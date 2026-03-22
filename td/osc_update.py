# osc_update — per-frame driver for chaos_viz + lusona progress
# Execute DAT: framestart=True
# Reads OSC In CHOP, drives vec params, animates lusona drawing

import time as _time
import math as _math

_prev_x = 0.0
_prev_y = 0.0
_prev_z = 0.0
_lusona_progress = 0.0
_lusona_visible = 2
_lusona_preset = 3
_lusona_hold_timer = 0.0
_lusona_total_pts = 141
_last_veve = -1
_update_skip = 0

CHAOS_SCALE = 300.0
LOUD_SCALE = 3.0
DRAW_SPEED_BASE = 0.003    # ~11 seconds to complete at 30fps
DRAW_SPEED_LOUD = 0.012    # louder = faster drawing
HOLD_TIME = 5.0            # seconds to hold completed lusona
VIS_UPDATE_STEP = 3        # update table every N points (batch)

def _set_lusona_preset(preset_idx, visible_count=2):
    global _lusona_total_pts, _lusona_preset, _lusona_visible
    _lusona_preset = preset_idx % 6
    engine = op('/project1/feedback_viz/lusona_engine')
    if engine is None:
        return
    mod = engine.module
    npts, r, c, nm, vis = mod.update_visibility(_lusona_preset, visible_count, 0.08)
    _lusona_total_pts = npts
    _lusona_visible = vis
    viz = op('/project1/feedback_viz/chaos_viz')
    if viz is not None:
        viz.par.vec2valuex = float(r)
        viz.par.vec2valuey = float(c)
        viz.par.vec2valuez = 0.08
        viz.par.vec2valuew = float(npts)

def _update_progress(loudness):
    global _lusona_progress, _lusona_visible, _lusona_hold_timer, _update_skip

    if _lusona_progress >= 1.0:
        _lusona_hold_timer += 1.0 / 30.0
        if _lusona_hold_timer > HOLD_TIME:
            _lusona_hold_timer = 0.0
            _lusona_progress = 0.0
            _lusona_visible = 2
            _set_lusona_preset((_lusona_preset + 1) % 6, 2)
        return

    speed = DRAW_SPEED_BASE + loudness * DRAW_SPEED_LOUD
    _lusona_progress = min(_lusona_progress + speed, 1.0)

    new_visible = max(2, int(_lusona_progress * _lusona_total_pts))
    if new_visible >= _lusona_visible + VIS_UPDATE_STEP or _lusona_progress >= 1.0:
        if new_visible != _lusona_visible:
            _lusona_visible = new_visible
            engine = op('/project1/feedback_viz/lusona_engine')
            if engine is not None:
                engine.module.update_visibility(_lusona_preset, new_visible, 0.08)

def onFrameStart(frame):
    global _prev_x, _prev_y, _prev_z, _last_veve
    global _lusona_progress, _lusona_visible, _lusona_hold_timer

    s = op('/project1/feedback_viz').storage
    s['_dbg_frame_count'] = s.get('_dbg_frame_count', 0) + 1

    # Read from OSC In CHOP
    osc = op('/project1/feedback_viz/osc_in')
    if osc is not None and osc.numChans > 0:
        for i in range(osc.numChans):
            ch = osc.chan(i)
            name = ch.name
            val = ch.eval()
            if '/x' in name:
                s['x'] = val
            elif '/y' in name:
                s['y'] = val
            elif '/z' in name:
                s['z'] = val
            elif 'amplitude' in name or 'loudness' in name:
                s['loudness'] = val
            elif 'kuramoto' in name:
                s['kuramoto_r'] = val
            elif 'gain' in name:
                s['chaos_gain'] = val
            elif 'veve' in name or 'preset' in name:
                s['veve'] = int(val)

    raw_x = s.get('x', 0.0)
    raw_y = s.get('y', 0.0)
    raw_z = s.get('z', 0.0)
    raw_loud = s.get('loudness', 0.0)
    loudness = min(abs(raw_loud) * LOUD_SCALE, 1.0)

    # Derive kuramoto_r from chaos velocity if not from OSC
    dx = abs(raw_x - _prev_x)
    dy = abs(raw_y - _prev_y)
    dz = abs(raw_z - _prev_z)
    velocity = _math.sqrt(dx*dx + dy*dy + dz*dz)
    if 'kuramoto_r' not in s:
        s['kuramoto_r'] = 1.0 - min(velocity * 80.0, 1.0)
    _prev_x, _prev_y, _prev_z = raw_x, raw_y, raw_z

    # Veve change from Max → new lusona preset
    cur_veve = s.get('veve', -1)
    if cur_veve != _last_veve and cur_veve >= 0:
        _last_veve = cur_veve
        _lusona_progress = 0.0
        _lusona_hold_timer = 0.0
        _set_lusona_preset(cur_veve, 2)

    # Animate lusona progress
    _update_progress(loudness)

    # Drive chaos_viz vec params
    viz = op('/project1/feedback_viz/chaos_viz')
    if viz is not None:
        # vec0: uChaos
        viz.par.vec0valuex = raw_x * CHAOS_SCALE
        viz.par.vec0valuey = raw_y * CHAOS_SCALE
        viz.par.vec0valuez = raw_z * CHAOS_SCALE
        viz.par.vec0valuew = loudness
        # vec1: uParams1 (kuramotoR, time=expr, chaosGain, progress)
        viz.par.vec1valuex = s.get('kuramoto_r', 0.5)
        # vec1valuey driven by absTime.seconds expression
        viz.par.vec1valuez = s.get('chaos_gain', 0.5)
        viz.par.vec1valuew = _lusona_progress
        # vec4: uParams4 (headGlow, headX, headY, 0)
        head_x = s.get('lusona_head_x', 0.5)
        head_y = s.get('lusona_head_y', 0.5)
        glow = 1.0 if _lusona_progress < 1.0 else 0.0
        viz.par.vec4valuex = glow
        viz.par.vec4valuey = head_x
        viz.par.vec4valuez = head_y

    # Update Constant CHOP (for data chain)
    c = op('/project1/feedback_viz/osc_const')
    if c is not None:
        c.par.value0 = raw_x * CHAOS_SCALE
        c.par.value1 = raw_y * CHAOS_SCALE
        c.par.value2 = raw_z * CHAOS_SCALE
        c.par.value3 = loudness

    # ComfyUI bridge
    if s.get('comfyui_enabled', False):
        try:
            bridge = op('/project1/feedback_viz/comfyui_bridge')
            if bridge is not None:
                bridge.module.update()
        except:
            pass

def onFrameEnd(frame):
    return
def onPlayStateChange(state):
    return
def onDeviceChange():
    return
def onProjectPreSave():
    return
def onProjectPostSave():
    return
