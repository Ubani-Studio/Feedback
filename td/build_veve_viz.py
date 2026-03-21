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

# Colors
BG_COLOR = (0.02, 0.02, 0.05)
SYNC_COLOR = (1.0, 0.6, 0.1)        # Amber (synced)
FREE_COLOR = (0.2, 0.4, 1.0)        # Blue (free)
EDGE_DIM = (0.08, 0.08, 0.12)       # Edge color when desynchronized
EDGE_BRIGHT = (0.9, 0.5, 0.1)       # Edge color when synchronized

VOICE_COLORS = [
    (0.9, 0.2, 0.2),   # v0: sub bass — red
    (1.0, 0.6, 0.1),   # v1: body — amber
    (0.1, 0.8, 0.8),   # v2: metallic — cyan
    (1.0, 0.9, 0.2),   # v3: transient — yellow
    (0.4, 0.2, 0.9),   # v4: drone — indigo
    (0.9, 0.3, 0.7),   # v5: crystalline — magenta
]

RENDER_RES = (1920, 1080)
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
VOICE_COLORS = ''' + str(VOICE_COLORS) + '''
SYNC_COLOR = ''' + str(list(SYNC_COLOR)) + '''
FREE_COLOR = ''' + str(list(FREE_COLOR)) + '''

# Smoothed positions for animation
smooth_pos = [[0.0, 0.0] for _ in range(6)]
SMOOTH_RATE = 0.08  # Lower = smoother transition
current_preset_idx = -1

def onCook(scriptOp):
    global smooth_pos, current_preset_idx
    scriptOp.clear()

    # --- Read inputs ---
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

    preset = PRESETS[preset_idx]
    target_pos = preset["pos"]

    # --- Smooth position transition on preset change ---
    if current_preset_idx != preset_idx:
        current_preset_idx = preset_idx
        # Don't snap — let smoothing handle the animation

    for i in range(6):
        tx = target_pos[i][0] * SCALE
        ty = target_pos[i][1] * SCALE
        smooth_pos[i][0] += (tx - smooth_pos[i][0]) * SMOOTH_RATE
        smooth_pos[i][1] += (ty - smooth_pos[i][1]) * SMOOTH_RATE

    # --- Build instance channels ---
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

        # Phase-based pulse: flash when phase wraps near 0 (trigger moment)
        phase = phases[i]
        # Pulse near phase=0 (or 1, same thing on the circle)
        wrap_dist = min(phase, 1.0 - phase)
        pulse = max(0.0, 1.0 - wrap_dist * 20.0)  # Sharp pulse near 0

        # Color: lerp voice color → sync color based on r
        vc = VOICE_COLORS[i]
        cr = vc[0] * (1.0 - r) + SYNC_COLOR[0] * r
        cg = vc[1] * (1.0 - r) + SYNC_COLOR[1] * r
        cb = vc[2] * (1.0 - r) + SYNC_COLOR[2] * r

        # Brighten on pulse
        brightness = 1.0 + pulse * 2.0
        cr = min(cr * brightness, 1.0)
        cg = min(cg * brightness, 1.0)
        cb = min(cb * brightness, 1.0)

        cr_vals.append(cr)
        cg_vals.append(cg)
        cb_vals.append(cb)

        # Scale: base + pulse + sync boost
        base_scale = 0.25 + r * 0.15
        s = base_scale + pulse * 0.3
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
SYNC_COLOR = ''' + str(list(SYNC_COLOR)) + '''
FREE_COLOR = ''' + str(list(FREE_COLOR)) + '''
EDGE_DIM = ''' + str(list(EDGE_DIM)) + '''
EDGE_BRIGHT = ''' + str(list(EDGE_BRIGHT)) + '''

# Smoothed positions (shared with node script via matching logic)
smooth_pos = [[0.0, 0.0] for _ in range(6)]
SMOOTH_RATE = 0.08
current_preset_idx = -1

def onCook(scriptOp):
    global smooth_pos, current_preset_idx
    scriptOp.clear()

    # --- Read CHOP inputs via parent ---
    # We get preset + r from the container's CHOP data
    container = scriptOp.parent()

    # Read preset index
    preset_idx = 0
    try:
        p_chop = container.op('veve_preset_select')
        if p_chop and p_chop.numChans > 0:
            preset_idx = int(p_chop[0][0])
            preset_idx = max(0, min(preset_idx, len(PRESETS) - 1))
    except:
        pass

    # Read order parameter r
    r = 0.5
    try:
        r_chop = container.op('kura_r_select')
        if r_chop and r_chop.numChans > 0:
            r = r_chop[0][0]
    except:
        pass

    preset = PRESETS[preset_idx]
    adj = preset["adj"]
    target_pos = preset["pos"]

    # Smooth positions (must match node script)
    if current_preset_idx != preset_idx:
        current_preset_idx = preset_idx

    for i in range(6):
        tx = target_pos[i][0] * SCALE
        ty = target_pos[i][1] * SCALE
        smooth_pos[i][0] += (tx - smooth_pos[i][0]) * SMOOTH_RATE
        smooth_pos[i][1] += (ty - smooth_pos[i][1]) * SMOOTH_RATE

    # --- Generate edge lines ---
    # For each pair (i,j) where adj[i*6+j] > 0 and i < j (avoid duplicates)
    edge_count = 0
    for i in range(6):
        for j in range(i + 1, 6):
            w = adj[i * 6 + j]
            if w > 0:
                x0 = smooth_pos[i][0]
                y0 = smooth_pos[i][1]
                x1 = smooth_pos[j][0]
                y1 = smooth_pos[j][1]

                # Create line primitive
                p0 = scriptOp.appendPoint()
                p0.x = x0
                p0.y = y0
                p0.z = 0

                p1 = scriptOp.appendPoint()
                p1.x = x1
                p1.y = y1
                p1.z = 0

                line = scriptOp.appendPoly(2, closed=False)

                # Edge color: lerp dim→bright with r and weight
                blend = r * w
                cr = EDGE_DIM[0] + (EDGE_BRIGHT[0] - EDGE_DIM[0]) * blend
                cg = EDGE_DIM[1] + (EDGE_BRIGHT[1] - EDGE_DIM[1]) * blend
                cb = EDGE_DIM[2] + (EDGE_BRIGHT[2] - EDGE_DIM[2]) * blend

                # Set vertex color via point color
                p0.Cd = tdu.Color(cr, cg, cb, 0.6 + r * 0.4)
                p1.Cd = tdu.Color(cr, cg, cb, 0.6 + r * 0.4)

                edge_count += 1

    return
'''


# ============================================
# BUILD FUNCTION
# ============================================

def build_veve_graph(container, osc_node):
    """
    Build the veve topology graph visualization.
    Replaces the simple Kuramoto phase ring with a graph
    whose topology is defined by the active veve preset.
    """
    base_x = 0
    base_y = 200

    # --- Select phase channels ---
    phase_sel = container.create(selectCHOP, 'kura_phase_select')
    phase_sel.par.chop = osc_node.path
    phase_sel.par.channames = 'phase1 phase2 phase3 phase4 phase5 phase6'
    phase_sel.nodeX = base_x
    phase_sel.nodeY = base_y

    # --- Select order parameter ---
    r_sel = container.create(selectCHOP, 'kura_r_select')
    r_sel.par.chop = osc_node.path
    r_sel.par.channames = 'r'
    r_sel.nodeX = base_x + 200
    r_sel.nodeY = base_y

    # --- Select veve preset index ---
    preset_sel = container.create(selectCHOP, 'veve_preset_select')
    preset_sel.par.chop = osc_node.path
    preset_sel.par.channames = 'veve_preset'
    preset_sel.nodeX = base_x + 400
    preset_sel.nodeY = base_y

    # --- Script CHOP: compute veve node positions ---
    node_script = container.create(scriptCHOP, 'veve_node_positions')
    wire(phase_sel, node_script, 0, 0)
    wire(r_sel, node_script, 0, 1)
    wire(preset_sel, node_script, 0, 2)
    node_script.nodeX = base_x
    node_script.nodeY = base_y - 200

    # --- Null for instance data ---
    node_null = container.create(nullCHOP, 'veve_instance_data')
    wire(node_script, node_null)
    node_null.nodeX = base_x
    node_null.nodeY = base_y - 350

    # --- Sphere SOP for nodes ---
    node_sphere = container.create(sphereSOP, 'veve_node_sphere')
    node_sphere.par.type = 2   # polygon
    node_sphere.par.rows = 12
    node_sphere.par.cols = 16
    node_sphere.par.radx = 0.3
    node_sphere.par.rady = 0.3
    node_sphere.par.radz = 0.3
    node_sphere.nodeX = base_x + 200
    node_sphere.nodeY = base_y - 350

    # --- Material for nodes (per-instance color) ---
    node_mat = container.create(constantMAT, 'veve_node_mat')
    node_mat.par.colorr = 1.0
    node_mat.par.colorg = 1.0
    node_mat.par.colorb = 1.0
    node_mat.par.alpha = 0.9
    node_mat.nodeX = base_x + 200
    node_mat.nodeY = base_y - 450

    # --- Geometry COMP for nodes (instanced) ---
    node_geo = container.create(geometryCOMP, 'veve_node_geo')
    node_geo.par.instancing = True
    node_geo.par.instancechop = node_null.path
    node_geo.par.material = node_mat.path
    node_geo.nodeX = base_x
    node_geo.nodeY = base_y - 500

    # --- Script SOP: generate edge lines ---
    edge_script_sop = container.create(scriptSOP, 'veve_edges')
    edge_script_sop.nodeX = base_x + 400
    edge_script_sop.nodeY = base_y - 350

    # --- Material for edges (wireframe with per-point color) ---
    edge_mat = container.create(wireframeMAT, 'veve_edge_mat')
    edge_mat.par.colorr = 1.0
    edge_mat.par.colorg = 1.0
    edge_mat.par.colorb = 1.0
    edge_mat.nodeX = base_x + 400
    edge_mat.nodeY = base_y - 450

    # --- Geometry COMP for edges ---
    edge_geo = container.create(geometryCOMP, 'veve_edge_geo')
    edge_geo.par.material = edge_mat.path
    edge_geo.nodeX = base_x + 400
    edge_geo.nodeY = base_y - 500

    return (node_script, VEVE_NODE_SCRIPT,
            edge_script_sop, VEVE_EDGE_SCRIPT,
            node_geo, edge_geo)


# ============================================
# WRITE CALLBACKS
# ============================================

def write_callbacks(container, script_op, code, name):
    """Write callback code to a docked Text DAT."""
    docked = script_op.docked
    if docked:
        callbacks_dat = docked[0]
        callbacks_dat.text = code
    else:
        dat = container.create(textDAT, name + '_callbacks')
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
        osc = container.create(oscinCHOP, 'osc_in')
        osc.par.port = OSC_PORT
        osc.par.active = True
        osc.nodeX = 0
        osc.nodeY = 400
        print(f"[OK] Created OSC In: port {OSC_PORT}")
    else:
        print(f"[OK] Using existing OSC In: {osc.path}")

    # Remove old Kuramoto ring if present
    old_nodes = ['kura_phase_select', 'kura_r_select', 'kura_positions',
                 'kura_shuffle', 'kura_instance_data', 'kura_sphere',
                 'kura_mat', 'kura_geo', 'kura_ring', 'kura_ring_mat',
                 'kura_ring_geo']
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
    write_callbacks(container, edge_sop, edge_code, 'veve_edges')

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
