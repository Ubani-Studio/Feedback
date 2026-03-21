# ============================================
# FEEDBACK — Veve Graph Visualization
# ============================================
#
# Run in TD Textport or Execute DAT:
#   exec(open('D:/path/to/build_veve_viz.py').read())
#
# Builds a veve topology graph layer:
#   - 6 instanced spheres at veve-specific XY positions
#   - Edges (lines) between coupled oscillators
#   - Phase maps to node pulse/glow
#   - Sync (r) maps to edge brightness + color warmth
#   - Preset switching animates node positions
#
# OSC from Max (port 7000):
#   /kuramoto/r        — order parameter (0-1)
#   /kuramoto/phases   — 6 phases (0-1)
#   /veve/preset       — preset index (0-12)
#   /octave/offset     — octave shift (-2 to +2)
#   /excite/mode       — 0=noise, 1=PERI
#   /resonator/decay   — KS decay (0-1.5)
#   /root/freq         — root frequency (20-880)
#   /morph/amount      — topology morph (0-1)
#   /audio/amplitude   — master amplitude
#
# TD GLSL SHADER UPDATES for festival-grade:
#   - Octave: scale ringR by pow(2.0, -octave_offset) — lower octave = larger circles
#   - Excite mode: when PERI active, add warm tint (0.15, 0.08, 0.0) to connections
#   - These read from oscinCHOP uniforms automatically
#
# ============================================

import math

# ============================================
# CONFIGURATION
# ============================================

OSC_PORT = 7000
BASE_PATH = '/project1'
CONTAINER_NAME = 'feedback_viz'

# White on black — nothing is mapped symbolically
BG_COLOR = (0.0, 0.0, 0.0)
NODE_COLOR = (1.0, 1.0, 1.0)        # White
EDGE_DIM = (0.06, 0.06, 0.06)       # Edge when desynchronized
EDGE_BRIGHT = (1.0, 1.0, 1.0)       # Edge when synchronized

RENDER_RES = (1280, 720)
VEVE_SCALE = 0.8   # Scale factor for veve node positions


# ============================================
# HELPERS
# ============================================

def wire(src, dst, src_out=0, dst_in=0):
    src.outputConnectors[src_out].connect(dst.inputConnectors[dst_in])


def get_container():
    parent = op(BASE_PATH)
    existing = parent.op(CONTAINER_NAME)
    if existing is None:
        existing = parent.create(baseCOMP, CONTAINER_NAME)
    return existing


# ============================================
# VEVE PRESET DATA (embedded for TD access)
# ============================================

VEVE_PRESETS_CODE = '''
# Veve adjacency matrices and node positions
# Embedded from veve_presets.json for TD Script CHOP access

PRESETS = [
    {
        "name": "All-to-all",
        "adj": [
            0,1,1,1,1,1,
            1,0,1,1,1,1,
            1,1,0,1,1,1,
            1,1,1,0,1,1,
            1,1,1,1,0,1,
            1,1,1,1,1,0
        ],
        "pos": [[6,0],[3,5.196],[-3,5.196],[-6,0],[-3,-5.196],[3,-5.196]]
    },
    {
        "name": "Legba Carrefour",
        "adj": [
            0,1,1,1,1,1,
            1,0,0,0,0,0,
            1,0,0,0,0,0,
            1,0,0,0,0,0,
            1,0,0,0,0,0,
            1,0,0,0,0,0
        ],
        "pos": [[0,0],[0,8],[8,0],[0,-8],[-8,0],[10,4]]
    },
    {
        "name": "Carrefour Diamond",
        "adj": [
            0,1,1,1,1,0,
            1,0,1,1,1,0,
            1,1,0,1,1,0,
            1,1,1,0,1,0,
            1,1,1,1,0,1,
            0,0,0,0,1,0
        ],
        "pos": [[0,0],[0,6],[6,0],[0,-6],[-6,0],[-7,-4]]
    },
    {
        "name": "Ferraille",
        "adj": [
            0,1,1,0,0,0,
            1,0,0,0,0,0,
            1,0,0,0,0,0,
            0,0,0,0,0,0,
            0,0,0,0,0,0,
            0,0,0,0,0,0
        ],
        "pos": [[0,-4],[-6,4],[6,4],[-3,0],[3,0],[0,6]]
    },
    {
        "name": "Ogou Bhathalah",
        "adj": [
            0,1,0,1,1,0,
            1,0,1,0,1,0,
            0,1,0,0,1,1,
            1,0,0,0,0,0,
            1,1,1,0,0,0,
            0,0,1,0,0,0
        ],
        "pos": [[-6,0],[0,0],[6,0],[-6,6],[0,-6],[6,6]]
    },
    {
        "name": "Legba co-sou",
        "adj": [
            0,1,0,0,0,1,
            1,0,1,0,0,0,
            0,1,0,1,0,0,
            0,0,1,0,1,0,
            0,0,0,1,0,1,
            1,0,0,0,1,0
        ],
        "pos": [[6,0],[3,5.196],[-3,5.196],[-6,0],[-3,-5.196],[3,-5.196]]
    },
    {
        "name": "Marassa",
        "adj": [
            0,1,1,0,0,0,
            1,0,1,0,0,0,
            1,1,0,0.5,0,0,
            0,0,0.5,0,1,1,
            0,0,0,1,0,1,
            0,0,0,1,1,0
        ],
        "pos": [[-6,4],[-6,-4],[-2,0],[2,0],[6,4],[6,-4]]
    },
    {
        "name": "Damballah Wedo",
        "adj": [
            0,1,0,0,0,0,
            1,0,1,0,0,0,
            0,1,0,1,0,0,
            0,0,1,0,1,0,
            0,0,0,1,0,1,
            0,0,0,0,1,0
        ],
        "pos": [[-10,0],[-6,0],[-2,0],[2,0],[6,0],[10,0]]
    },
    {
        "name": "Erzulie Freda",
        "adj": [
            0,1,1,1,1,0,
            1,0,1,0,0,0.5,
            1,1,0,0,0,0,
            1,0,0,0,1,0,
            1,0,0,1,0,0.5,
            0,0.5,0,0,0.5,0
        ],
        "pos": [[0,6],[-4,2],[-6,-2],[4,2],[6,-2],[0,-4]]
    },
    {
        "name": "Baron Samedi",
        "adj": [
            0,1,1,1,1,0.4,
            1,0,0,0.4,0,0,
            1,0,0,0,0.4,0,
            1,0.4,0,0,0,0,
            1,0,0.4,0,0,0,
            0.4,0,0,0,0,0
        ],
        "pos": [[0,0],[0,8],[8,0],[0,-8],[-8,0],[4,-6]]
    },
    {
        "name": "Simbi",
        "adj": [
            0,1,0,1,0,1,
            1,0,1,0,0,0,
            0,1,0,0,0,0,
            1,0,0,0,1,0,
            0,0,0,1,0,0,
            1,0,0,0,0,0
        ],
        "pos": [[0,-6],[-5,0],[-8,6],[0,2],[0,8],[5,0]]
    },
    {
        "name": "Ayizan",
        "adj": [
            0,1,0,0,0,0,
            1,0,1,0,0.7,0,
            0,1,0,1,0,0.7,
            0,0,1,0,0,0,
            0,0.7,0,0,0,0,
            0,0,0.7,0,0,0
        ],
        "pos": [[-8,0],[-3,0],[3,0],[8,0],[-3,6],[3,6]]
    },
    {
        "name": "Gran Bwa",
        "adj": [
            0,1,0,0,0,0,
            1,0,1,1,1,1,
            0,1,0,0,0,0,
            0,1,0,0,0,0,
            0,1,0,0,0,0.5,
            0,1,0,0,0.5,0
        ],
        "pos": [[0,8],[0,1],[-7,3],[7,3],[-4,-7],[4,-7]]
    }
]
'''


# ============================================
# BUILD: VEVE NODE POSITIONS (Script CHOP)
# ============================================

VEVE_NODE_SCRIPT = VEVE_PRESETS_CODE + '''
import math

SCALE = ''' + str(VEVE_SCALE) + '''

# Smoothed positions for animation
smooth_pos = [[0.0, 0.0] for _ in range(6)]
SMOOTH_RATE = 0.08

# Pulse persistence — sustained glow controlled by decay
held_pulse = [0.0] * 6

def onCook(scriptOp):
    global smooth_pos, held_pulse
    scriptOp.clear()

    # Input 0: phases (6 channels, 0-1)
    phases = [0.0] * 6
    if scriptOp.inputs and len(scriptOp.inputs) > 0:
        inp = scriptOp.inputs[0]
        for i in range(min(inp.numChans, 6)):
            phases[i] = inp[i][0]

    # Input 1: order parameter r
    r = 0.5
    if scriptOp.inputs and len(scriptOp.inputs) > 1:
        r_inp = scriptOp.inputs[1]
        if r_inp.numChans > 0:
            r = r_inp[0][0]

    # Input 2: veve preset index
    preset_idx = 0
    if scriptOp.inputs and len(scriptOp.inputs) > 2:
        p_inp = scriptOp.inputs[2]
        if p_inp.numChans > 0:
            preset_idx = int(p_inp[0][0])
            preset_idx = max(0, min(preset_idx, len(PRESETS) - 1))

    # Input 3: decay (0-1.5)
    decay = 0.3
    if scriptOp.inputs and len(scriptOp.inputs) > 3:
        d_inp = scriptOp.inputs[3]
        if d_inp.numChans > 0:
            decay = max(0.0, min(d_inp[0][0], 1.5))

    # Input 4: root frequency (20-880)
    root_freq = 220.0
    if scriptOp.inputs and len(scriptOp.inputs) > 4:
        f_inp = scriptOp.inputs[4]
        if f_inp.numChans > 0:
            root_freq = max(20.0, min(f_inp[0][0], 880.0))

    # Input 5: octave offset (-2 to +2)
    octave = 0.0
    if scriptOp.inputs and len(scriptOp.inputs) > 5:
        o_inp = scriptOp.inputs[5]
        if o_inp.numChans > 0:
            octave = o_inp[0][0]

    preset = PRESETS[preset_idx]
    target_pos = preset["pos"]

    # Smooth position transition
    for i in range(6):
        tx = target_pos[i][0] * SCALE
        ty = target_pos[i][1] * SCALE
        smooth_pos[i][0] += (tx - smooth_pos[i][0]) * SMOOTH_RATE
        smooth_pos[i][1] += (ty - smooth_pos[i][1]) * SMOOTH_RATE

    # Decay controls pulse release rate
    # decay 0 = fast release (percussive flash)
    # decay 1.5 = near-permanent glow (sustained drone)
    decay_norm = decay / 1.5
    release_rate = 0.3 * (1.0 - decay_norm) ** 2 + 0.002

    # Root frequency controls base circle size
    # Low freq (20Hz) = large scaffolding. High freq (880Hz) = pinpoint.
    # Normalize: 20Hz -> 1.0, 880Hz -> 0.15
    freq_scale = 1.0 - (root_freq - 20.0) / (880.0 - 20.0) * 0.85

    # Octave shifts double/halve size
    oct_scale = 2.0 ** (-octave)

    base_size = 0.2 * freq_scale * oct_scale

    tx_vals = []
    ty_vals = []
    tz_vals = []
    cr_vals = []
    cg_vals = []
    cb_vals = []
    sx_vals = []
    sy_vals = []
    sz_vals = []

    for i in range(6):
        tx_vals.append(smooth_pos[i][0])
        ty_vals.append(smooth_pos[i][1])
        tz_vals.append(0.0)

        # Phase pulse: flash when phase wraps near 0
        phase = phases[i]
        wrap_dist = min(phase, 1.0 - phase)
        raw_pulse = max(0.0, 1.0 - wrap_dist * 20.0)

        # Sustain pulse with decay-controlled release
        if raw_pulse > held_pulse[i]:
            held_pulse[i] = raw_pulse
        else:
            held_pulse[i] = max(held_pulse[i] - release_rate, 0.0)
        pulse = held_pulse[i]

        # White on black: brightness = base dim + pulse glow + sync boost
        base_bright = 0.15 + r * 0.15
        brightness = base_bright + pulse * (0.7 + decay_norm * 0.3)
        brightness = min(brightness, 1.0)

        cr_vals.append(brightness)
        cg_vals.append(brightness)
        cb_vals.append(brightness)

        # Size: root freq base + pulse expansion
        s = base_size + pulse * base_size * 0.8
        sx_vals.append(s)
        sy_vals.append(s)
        sz_vals.append(s)

    scriptOp.appendChan('tx').vals = tx_vals
    scriptOp.appendChan('ty').vals = ty_vals
    scriptOp.appendChan('tz').vals = tz_vals
    scriptOp.appendChan('cr').vals = cr_vals
    scriptOp.appendChan('cg').vals = cg_vals
    scriptOp.appendChan('cb').vals = cb_vals
    scriptOp.appendChan('sx').vals = sx_vals
    scriptOp.appendChan('sy').vals = sy_vals
    scriptOp.appendChan('sz').vals = sz_vals
    scriptOp.numSamples = 6
    return
'''


# ============================================
# BUILD: VEVE EDGES (Script SOP)
# ============================================

VEVE_EDGE_SCRIPT = VEVE_PRESETS_CODE + '''
import math

SCALE = ''' + str(VEVE_SCALE) + '''

# Smoothed positions (must match node script)
smooth_pos = [[0.0, 0.0] for _ in range(6)]
SMOOTH_RATE = 0.08

# Edge brightness persistence — sustained by decay
held_edge_bright = {}

def onCook(scriptOp):
    global smooth_pos, held_edge_bright
    scriptOp.clear()

    container = scriptOp.parent().parent()

    # Read preset
    preset_idx = 0
    try:
        p_chop = container.op('veve_preset_select')
        if p_chop and p_chop.numChans > 0:
            preset_idx = int(max(0, min(p_chop[0][0], len(PRESETS) - 1)))
    except:
        pass

    # Read r
    r = 0.5
    try:
        r_chop = container.op('kura_r_select')
        if r_chop and r_chop.numChans > 0:
            r = r_chop[0][0]
    except:
        pass

    # Read decay
    decay = 0.3
    try:
        d_chop = container.op('decay_select')
        if d_chop and d_chop.numChans > 0:
            decay = max(0.0, min(d_chop[0][0], 1.5))
    except:
        pass

    # Read root freq for line weight
    root_freq = 220.0
    try:
        f_chop = container.op('freq_select')
        if f_chop and f_chop.numChans > 0:
            root_freq = max(20.0, min(f_chop[0][0], 880.0))
    except:
        pass

    preset = PRESETS[preset_idx]
    adj = preset["adj"]
    target_pos = preset["pos"]

    for i in range(6):
        tx = target_pos[i][0] * SCALE
        ty = target_pos[i][1] * SCALE
        smooth_pos[i][0] += (tx - smooth_pos[i][0]) * SMOOTH_RATE
        smooth_pos[i][1] += (ty - smooth_pos[i][1]) * SMOOTH_RATE

    # Decay controls edge persistence
    decay_norm = decay / 1.5
    release_rate = 0.15 * (1.0 - decay_norm) ** 2 + 0.001

    for i in range(6):
        for j in range(i + 1, 6):
            w = adj[i * 6 + j]
            if w > 0:
                p0 = scriptOp.appendPoint()
                p0.x = smooth_pos[i][0]
                p0.y = smooth_pos[i][1]
                p0.z = 0

                p1 = scriptOp.appendPoint()
                p1.x = smooth_pos[j][0]
                p1.y = smooth_pos[j][1]
                p1.z = 0

                scriptOp.appendPoly(2, closed=False)

                # Brightness from sync, sustained by decay
                target_bright = r * w
                key = (i, j)
                prev = held_edge_bright.get(key, 0.0)
                if target_bright > prev:
                    held_edge_bright[key] = target_bright
                else:
                    held_edge_bright[key] = max(prev - release_rate, target_bright * 0.3)

    return
'''


# ============================================
# BUILD FUNCTION
# ============================================

def build_veve_graph(container, osc_node):
    """
    Build the veve topology graph visualization.
    White on black. Phase = brightness. Sync = edge brightness.
    Root freq = circle size. Decay = persistence.
    """
    base_x = 0
    base_y = 200

    # --- Select CHOPs from OSC ---
    phase_sel = container.create('selectCHOP', 'kura_phase_select')
    phase_sel.par.chop = osc_node.path
    phase_sel.par.channames = 'kuramoto/phases1 kuramoto/phases2 kuramoto/phases3 kuramoto/phases4 kuramoto/phases5 kuramoto/phases6'
    phase_sel.nodeX = base_x
    phase_sel.nodeY = base_y

    r_sel = container.create('selectCHOP', 'kura_r_select')
    r_sel.par.chop = osc_node.path
    r_sel.par.channames = 'kuramoto/r'
    r_sel.nodeX = base_x + 200
    r_sel.nodeY = base_y

    preset_sel = container.create('selectCHOP', 'veve_preset_select')
    preset_sel.par.chop = osc_node.path
    preset_sel.par.channames = 'veve/preset'
    preset_sel.nodeX = base_x + 400
    preset_sel.nodeY = base_y

    decay_sel = container.create('selectCHOP', 'decay_select')
    decay_sel.par.chop = osc_node.path
    decay_sel.par.channames = 'resonator/decay'
    decay_sel.nodeX = base_x + 600
    decay_sel.nodeY = base_y

    freq_sel = container.create('selectCHOP', 'freq_select')
    freq_sel.par.chop = osc_node.path
    freq_sel.par.channames = 'root/freq'
    freq_sel.nodeX = base_x + 800
    freq_sel.nodeY = base_y

    octave_sel = container.create('selectCHOP', 'octave_select')
    octave_sel.par.chop = osc_node.path
    octave_sel.par.channames = 'octave/offset'
    octave_sel.nodeX = base_x + 1000
    octave_sel.nodeY = base_y

    # --- Script CHOP: node positions + brightness + size ---
    node_script = container.create('scriptCHOP', 'veve_node_positions')
    node_script.par.timeslice = False
    wire(phase_sel, node_script, 0, 0)    # input 0: phases
    wire(r_sel, node_script, 0, 1)        # input 1: r
    wire(preset_sel, node_script, 0, 2)   # input 2: preset
    wire(decay_sel, node_script, 0, 3)    # input 3: decay
    wire(freq_sel, node_script, 0, 4)     # input 4: root freq
    wire(octave_sel, node_script, 0, 5)   # input 5: octave
    node_script.nodeX = base_x
    node_script.nodeY = base_y - 200

    # --- Null for instance data ---
    node_null = container.create('nullCHOP', 'veve_instance_data')
    wire(node_script, node_null)
    node_null.nodeX = base_x
    node_null.nodeY = base_y - 350

    # --- Node geometry (instanced spheres) ---
    node_geo = container.create('geometryCOMP', 'veve_node_geo')
    node_geo.par.instancing = True
    node_geo.par.instanceop = node_null.path
    node_geo.par.instancetx = 'tx'
    node_geo.par.instancety = 'ty'
    node_geo.par.instancetz = 'tz'
    node_geo.par.instancesx = 'sx'
    node_geo.par.instancesy = 'sy'
    node_geo.par.instancesz = 'sz'
    node_geo.par.instancecolormode = 1
    node_geo.par.instancecolorop = node_null.path
    node_geo.par.instancer = 'cr'
    node_geo.par.instanceg = 'cg'
    node_geo.par.instanceb = 'cb'
    node_geo.nodeX = base_x
    node_geo.nodeY = base_y - 500

    # Sphere SOP inside node_geo
    node_sphere = node_geo.create('sphereSOP', 'sphere1')
    node_sphere.par.type = 2
    node_sphere.par.rows = 16
    node_sphere.par.cols = 24
    node_sphere.par.radx = 1.0
    node_sphere.par.rady = 1.0
    node_sphere.par.radz = 1.0

    # White material
    node_mat = node_geo.create('constantMAT', 'mat1')
    node_mat.par.colorr = 1.0
    node_mat.par.colorg = 1.0
    node_mat.par.colorb = 1.0
    node_mat.par.alpha = 1.0
    node_geo.par.material = node_mat.path

    # --- Edge geometry (Script SOP lines) ---
    edge_geo = container.create('geometryCOMP', 'veve_edge_geo')
    edge_geo.nodeX = base_x + 400
    edge_geo.nodeY = base_y - 500

    edge_script_sop = edge_geo.create('scriptSOP', 'edges1')

    # White wireframe, brightness driven by r
    edge_mat = edge_geo.create('wireframeMAT', 'mat1')
    edge_mat.par.colorr.mode = 2
    edge_mat.par.colorr.expr = "0.06 + op('" + r_sel.path + "')[0] * 0.94"
    edge_mat.par.colorg.mode = 2
    edge_mat.par.colorg.expr = "0.06 + op('" + r_sel.path + "')[0] * 0.94"
    edge_mat.par.colorb.mode = 2
    edge_mat.par.colorb.expr = "0.06 + op('" + r_sel.path + "')[0] * 0.94"
    edge_geo.par.material = edge_mat.path

    # --- Camera (orthographic-like, 2D view) ---
    cam = container.create('cameraCOMP', 'cam1')
    cam.par.tx = 0
    cam.par.ty = 0
    cam.par.tz = 30
    cam.nodeX = base_x
    cam.nodeY = base_y - 700

    # --- Render TOP ---
    render = container.create('renderTOP', 'render1')
    render.par.camera = cam.path
    render.par.geometry = node_geo.path + ' ' + edge_geo.path
    render.par.resolutionw = 1280
    render.par.resolutionh = 720
    render.par.bgcolorr = 0.0
    render.par.bgcolorg = 0.0
    render.par.bgcolorb = 0.0
    render.nodeX = base_x + 200
    render.nodeY = base_y - 700

    # --- Output ---
    out = container.create('nullTOP', 'out1')
    render.outputConnectors[0].connect(out.inputConnectors[0])
    out.nodeX = base_x + 400
    out.nodeY = base_y - 700

    return (node_script, VEVE_NODE_SCRIPT,
            edge_script_sop, VEVE_EDGE_SCRIPT,
            node_geo, edge_geo)


# ============================================
# WRITE CALLBACKS
# ============================================

def write_callbacks(parent_op, script_op, code, name):
    """Write callback code to a docked Text DAT."""
    docked = script_op.docked
    if docked:
        callbacks_dat = docked[0]
        callbacks_dat.text = code
    else:
        dat = parent_op.create('textDAT', name + '_callbacks')
        dat.text = code
        dat.dock = script_op
        try:
            script_op.par.callbacks = dat.path
        except:
            pass
        dat.nodeX = script_op.nodeX + 200
        dat.nodeY = script_op.nodeY


# ============================================
# STANDALONE BUILD (run this file directly)
# ============================================

def build_veve_standalone():
    """
    Build only the veve graph layer into the existing feedback_viz container.
    Assumes OSC input already exists (from build_viz.py).
    """
    print("=" * 50)
    print("VEVE GRAPH — Building topology visualization...")
    print("=" * 50)

    container = get_container()
    print(f"[OK] Container: {container.path}")

    # Find existing OSC input
    osc = container.op('osc_in')
    if osc is None:
        # Create OSC input if it doesn't exist
        osc = container.create('oscinCHOP', 'osc_in')
        osc.par.port = OSC_PORT
        osc.par.active = True
        osc.nodeX = 0
        osc.nodeY = 400
        print(f"[OK] Created OSC In: port {OSC_PORT}")
    else:
        print(f"[OK] Using existing OSC In: {osc.path}")

    # Remove old nodes (both legacy Kuramoto ring and previous veve build)
    old_nodes = ['kura_phase_select', 'kura_r_select', 'kura_positions',
                 'kura_shuffle', 'kura_instance_data', 'kura_sphere',
                 'kura_mat', 'kura_geo', 'kura_ring', 'kura_ring_mat',
                 'kura_ring_geo',
                 'veve_preset_select', 'decay_select', 'freq_select',
                 'octave_select',
                 'veve_node_positions', 'veve_instance_data',
                 'veve_node_sphere', 'veve_node_mat', 'veve_node_geo',
                 'veve_edges', 'veve_edge_mat', 'veve_edge_geo',
                 'veve_nodes_callbacks', 'veve_edges_callbacks',
                 'cam1', 'render1', 'out1',
                 'veve_node_positions_callbacks', 'veve_edges_callbacks',
                 'test_geo', 'test_render', 'test_inst_chop']
    for name in old_nodes:
        old = container.op(name)
        if old is not None:
            old.destroy()
            print(f"  [--] Removed old: {name}")

    # Build veve graph
    (node_script, node_code,
     edge_sop, edge_code,
     node_geo, edge_geo) = build_veve_graph(container, osc)

    write_callbacks(container, node_script, node_code, 'veve_nodes')
    write_callbacks(edge_geo, edge_sop, edge_code, 'veve_edges')

    print("[OK] Veve node positions (Script CHOP)")
    print("[OK] Veve edge topology (Script SOP)")
    print("[OK] Node + Edge geometry")

    print("")
    print("=" * 50)
    print("VEVE GRAPH BUILD COMPLETE")
    print(f"  Nodes: {node_geo.path}")
    print(f"  Edges: {edge_geo.path}")
    print("")
    print("OSC channels expected:")
    print("  /kuramoto/phases — 6 floats (phase1-phase6)")
    print("  /kuramoto/r      — 1 float (order parameter)")
    print("  /veve/preset     — 1 int (preset index 0-12)")
    print("")
    print("Presets:")
    print("  0: All-to-all (default)")
    print("  1: Legba Carrefour (hub/cross)")
    print("  2: Carrefour Diamond (dense mesh)")
    print("  3: Ferraille (V-graph, 3+3)")
    print("  4: Ogou Bhathalah (zigzag chain)")
    print("  5: Legba co-sou (ring)")
    print("  6: Marassa (bridged twins)")
    print("  7: Damballah Wedo (linear chain)")
    print("  8: Erzulie Freda (heart/two lobes)")
    print("  9: Baron Samedi (cross + diagonals)")
    print("  10: Simbi (3 branches from root)")
    print("  11: Ayizan (spine + branches)")
    print("  12: Gran Bwa (anthropomorphic tree)")
    print("=" * 50)


# ============================================
# RUN
# ============================================

build_veve_standalone()
