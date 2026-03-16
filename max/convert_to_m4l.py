#!/usr/bin/env python3
"""
convert_to_m4l.py — Convert Chaos Resonator + Sweetspot Explorer to Max for Live

Reads:
  step6_chaos_resonator.maxpat  (248KB, 537 boxes)
  sweetspot_explorer.maxpat     (64KB, FluCoMa analysis)
  presets.coll                  (50 presets)

Outputs:
  chaos_resonator.amxd          (M4L Instrument device)

Transformations:
  1. ezdac~/dac~        → plugout~ 1 2
  2. adc~ 3             → removed (no analog clock in M4L)
  3. startwindow        → removed (M4L handles DSP)
  4. p midi_sync        → plugsync~ (Live transport BPM)
  5. flonum params      → live.dial / live.menu / live.toggle (16 automatable)
  6. Recorder/render    → removed (use Live's recording)
  7. MIDI learn         → removed (M4L has its own MIDI mapping)
  8. Sweetspot explorer → merged (FluCoMa recall + sweep pipeline)
  9. Presentation       → redesigned for M4L device panel (~700x370px)

Unchanged:
  - gen~ codebox (39KB of DSP code — all chaos/resonator/tuning logic)
  - JS files (swarm.js, grid_bitmask.js, midi_learn.js, timestamp.js)
  - s toGen / r toGen parameter bus
  - send~ / receive~ audio routing
  - All preset message buttons (accessible in patcher view)
"""

import json
import os
import copy
import sys

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))


# ═══════════════════════════════════════════════════════════════
# Helpers
# ═══════════════════════════════════════════════════════════════

def load_json(filename):
    path = os.path.join(SCRIPT_DIR, filename)
    with open(path) as f:
        return json.load(f)


def load_text(filename):
    path = os.path.join(SCRIPT_DIR, filename)
    with open(path) as f:
        return f.read()


def find_box_index(boxes, box_id):
    for i, b in enumerate(boxes):
        if b['box']['id'] == box_id:
            return i
    return -1


def remove_boxes(boxes, ids):
    """Remove boxes by ID. Returns count removed."""
    id_set = set(ids)
    removed = 0
    i = 0
    while i < len(boxes):
        if boxes[i]['box']['id'] in id_set:
            boxes.pop(i)
            removed += 1
        else:
            i += 1
    return removed


def remove_connections_for(lines, ids):
    """Remove all connections involving any of the given box IDs."""
    id_set = set(ids)
    return [l for l in lines
            if l['patchline']['source'][0] not in id_set
            and l['patchline']['destination'][0] not in id_set]


def make_box(box_id, maxclass, text="", numinlets=1, numoutlets=1,
             outlettype=None, patching_rect=None,
             presentation=False, presentation_rect=None, **kwargs):
    box = {
        "id": box_id,
        "maxclass": maxclass,
        "numinlets": numinlets,
        "numoutlets": numoutlets,
    }
    if outlettype is not None:
        box["outlettype"] = outlettype
    if text:
        box["text"] = text
    if patching_rect:
        box["patching_rect"] = patching_rect
    if presentation:
        box["presentation"] = 1
    if presentation_rect:
        box["presentation_rect"] = presentation_rect
    box.update(kwargs)
    return {"box": box}


def make_conn(src_id, src_out, dst_id, dst_in, order=None):
    c = {"patchline": {"source": [src_id, src_out], "destination": [dst_id, dst_in]}}
    if order is not None:
        c["patchline"]["order"] = order
    return c


def make_live_dial(box_id, longname, shortname, mmin, mmax, initial,
                   patching_rect, presentation_rect, unitstyle=1):
    return {"box": {
        "id": box_id,
        "maxclass": "live.dial",
        "numinlets": 1,
        "numoutlets": 2,
        "outlettype": ["", "float"],
        "parameter_enable": 1,
        "saved_attribute_attributes": {
            "valueof": {
                "parameter_longname": longname,
                "parameter_shortname": shortname,
                "parameter_type": 0,
                "parameter_mmin": mmin,
                "parameter_mmax": mmax,
                "parameter_initial_enable": 1,
                "parameter_initial": [initial],
                "parameter_unitstyle": unitstyle
            }
        },
        "patching_rect": patching_rect,
        "presentation": 1,
        "presentation_rect": presentation_rect
    }}


def make_live_menu(box_id, longname, shortname, enum_values,
                   patching_rect, presentation_rect, initial=0):
    return {"box": {
        "id": box_id,
        "maxclass": "live.menu",
        "numinlets": 1,
        "numoutlets": 3,
        "outlettype": ["", "", "float"],
        "parameter_enable": 1,
        "saved_attribute_attributes": {
            "valueof": {
                "parameter_longname": longname,
                "parameter_shortname": shortname,
                "parameter_type": 2,
                "parameter_enum": enum_values,
                "parameter_initial_enable": 1,
                "parameter_initial": [initial]
            }
        },
        "patching_rect": patching_rect,
        "presentation": 1,
        "presentation_rect": presentation_rect
    }}


def make_live_toggle(box_id, longname, shortname,
                     patching_rect, presentation_rect, initial=0):
    return {"box": {
        "id": box_id,
        "maxclass": "live.toggle",
        "numinlets": 1,
        "numoutlets": 1,
        "outlettype": [""],
        "parameter_enable": 1,
        "saved_attribute_attributes": {
            "valueof": {
                "parameter_longname": longname,
                "parameter_shortname": shortname,
                "parameter_type": 2,
                "parameter_enum": ["off", "on"],
                "parameter_initial_enable": 1,
                "parameter_initial": [initial]
            }
        },
        "patching_rect": patching_rect,
        "presentation": 1,
        "presentation_rect": presentation_rect
    }}


def parse_presets_coll(text):
    """Parse presets.coll into embedded coll data format."""
    data = []
    for line in text.strip().split('\n'):
        line = line.strip()
        if not line or line.startswith('//'):
            continue
        parts = line.split(',', 1)
        if len(parts) == 2:
            key = int(parts[0].strip())
            value = parts[1].strip().rstrip(';').split()
            data.append({"key": key, "value": value})
    return data


# ═══════════════════════════════════════════════════════════════
# Main conversion
# ═══════════════════════════════════════════════════════════════

def convert():
    print("Loading source files...")
    patch = load_json('step6_chaos_resonator.maxpat')
    sweetspot = load_json('sweetspot_explorer.maxpat')
    presets_text = load_text('presets.coll')
    presets_data = parse_presets_coll(presets_text)

    boxes = patch['patcher']['boxes']
    lines = patch['patcher']['lines']

    print(f"  step6: {len(boxes)} boxes, {len(lines)} connections")
    print(f"  sweetspot: {len(sweetspot['patcher']['boxes'])} boxes")
    print(f"  presets: {len(presets_data)} entries")

    # ──────────────────────────────────────────────────────────
    # STEP 1: Remove objects that don't apply in M4L
    # ──────────────────────────────────────────────────────────

    remove_ids = [
        # --- Audio I/O (replaced by plugout~) ---
        'obj-ezdac',
        'obj-dac',

        # --- DSP startup (M4L handles this) ---
        'obj-startdsp',

        # --- Analog clock input (no hardware audio in M4L) ---
        'obj-adc-clk', 'obj-clk-tog', 'obj-clk-m',
        'obj-clk-hint', 'obj-s-clk',

        # --- MIDI clock subpatcher (replaced by plugsync~) ---
        'obj-midi', 'obj-bpm-disp', 'obj-bpm-disp-l', 'obj-midi-label',

        # --- MIDI learn (M4L has its own MIDI mapping) ---
        'obj-ml-label', 'obj-ml-tog', 'obj-ml-tog-l',
        'obj-ml-menu', 'obj-ml-hint', 'obj-ml-p', 'obj-s-ml',

        # --- Recording (use Live's recording) ---
        'obj-recorder', 'obj-rec-label', 'obj-rec-tog',
        'obj-rec-hint', 'obj-rec-path', 'obj-rec-name',
        'obj-smooth-sel', 'obj-smooth-on', 'obj-smooth-off', 'obj-smooth-send',

        # --- 8-bar render (use Live's recording) ---
        'obj-render-btn', 'obj-render-hint', 'obj-render-p',

        # --- Scopes (not needed in M4L panel) ---
        'obj-scope-l', 'obj-scope-r', 'obj-sl', 'obj-sr',

        # --- Big standalone title (will add M4L title) ---
        'obj-title',

        # --- Old mute toggle + label (replaced by live.toggle) ---
        'obj-mute-tog', 'obj-mute-label',

        # --- Old BPM flonum (replaced by transport sync) ---
        'obj-bpm-l', 'obj-bpm-n', 'obj-bpm-m',

        # --- Chaos amount macro (replaced by individual live.dials) ---
        'obj-camac-l', 'obj-camac-n', 'obj-camac-srho',
        'obj-camac-rhom', 'obj-camac-scg', 'obj-camac-cgm', 'obj-camac-hint',
    ]

    # Remove old flonum/label pairs that are replaced by live.dials
    # We KEEP the message objects (obj-XX-m) — they format "param $1" → s toGen
    param_replacements = [
        ('obj-cg-n', 'obj-cg-l'),         # chaos_gain
        ('obj-rho-n', 'obj-rho-l'),        # rho
        ('obj-bmix-n', 'obj-bmix-l'),      # blend_mix
        ('obj-mdep-n', 'obj-mdep-l'),      # mod_depth
        ('obj-root-n', 'obj-root-l'),      # root
        ('obj-flex-n', 'obj-flex-l'),       # flex
        ('obj-brt-n', 'obj-brt-l'),         # brightness
        ('obj-mg-n', 'obj-mg-l'),           # master_gain
        ('obj-sub-n', 'obj-sub-l'),         # sub_amt
        ('obj-sch-n', 'obj-sch-l'),         # sub_chaos
        ('obj-roff-n', 'obj-roff-l'),       # root_offset
        ('obj-ts-n', 'obj-ts-l'),           # tuning_system
        ('obj-arpr-n', 'obj-arpr-l'),       # arp_rate
    ]
    for n, l in param_replacements:
        remove_ids.extend([n, l])

    # Remove attractor A selection buttons (replaced by live.menu)
    remove_ids.extend([
        'obj-att-label', 'obj-att-a-l',
        'obj-att-a-lbl-lor', 'obj-att-a-lbl-ros', 'obj-att-a-lbl-chu',
        'obj-att-a-lbl-hal', 'obj-att-a-lbl-aiz',
        'obj-att-a-0', 'obj-att-a-1', 'obj-att-a-2',
        'obj-att-a-3', 'obj-att-a-4',
    ])

    # Remove combine mode buttons (replaced by live.menu)
    remove_ids.extend([
        'obj-cm-l', 'obj-cm-lbl-ble', 'obj-cm-lbl-mod', 'obj-cm-lbl-rou',
        'obj-cm-0', 'obj-cm-1', 'obj-cm-2', 'obj-cm-hint',
    ])

    # Remove individual arp mode buttons (replaced by live.menu)
    remove_ids.extend([f'obj-arp-{i}' for i in range(20)])
    remove_ids.extend([
        'obj-arp-label', 'obj-afr-labels', 'obj-afr2-labels',
        'obj-luso-labels', 'obj-eucl-hint',
    ])

    n_removed = remove_boxes(boxes, remove_ids)
    lines[:] = remove_connections_for(lines, remove_ids)
    print(f"\nStep 1: Removed {n_removed} boxes, {len(lines)} connections remain")

    # ──────────────────────────────────────────────────────────
    # STEP 2: Strip ALL presentation from remaining objects
    #         (clean slate — only new objects get presentation)
    # ──────────────────────────────────────────────────────────

    for b in boxes:
        box = b['box']
        box.pop('presentation', None)
        box.pop('presentation_rect', None)

    print("Step 2: Stripped presentation from all remaining objects")

    # ──────────────────────────────────────────────────────────
    # STEP 3: Add M4L infrastructure
    # ──────────────────────────────────────────────────────────

    # live.thisdevice — auto-init in M4L
    boxes.append(make_box(
        "obj-ltd", "live.thisdevice",
        numinlets=1, numoutlets=1, outlettype=[""],
        patching_rect=[15, 15, 100, 22]
    ))

    # plugout~ 1 2 — audio output to Live
    boxes.append(make_box(
        "obj-plugout", "newobj", text="plugout~ 1 2",
        numinlets=2, numoutlets=0, outlettype=[],
        patching_rect=[100, 2495, 100, 22]
    ))

    # Wire gain stages to plugout~ (same routing as old dac~)
    lines.append(make_conn("obj-gain-l", 0, "obj-plugout", 0))
    lines.append(make_conn("obj-gain-r", 0, "obj-plugout", 1))

    # Transport BPM sync: plugsync~ → snapshot~ → change → arp_bpm $1 → s toGen
    transport_chain = [
        ("obj-plugsync", "newobj", "plugsync~",
         0, 5, ["signal"] * 5, [15, 588, 80, 22]),
        ("obj-bpm-snap", "newobj", "snapshot~ 200",
         2, 1, ["float"], [15, 615, 85, 22]),
        ("obj-bpm-chg", "newobj", "change",
         2, 2, ["", "bang"], [15, 640, 50, 22]),
        ("obj-bpm-msg-m4l", "message", "arp_bpm $1",
         2, 1, [""], [15, 665, 75, 22]),
        ("obj-s-bpm-m4l", "newobj", "s toGen",
         1, 0, [], [15, 690, 52, 22]),
    ]
    for bid, mc, txt, ni, no, ot, pr in transport_chain:
        boxes.append(make_box(bid, mc, text=txt,
                              numinlets=ni, numoutlets=no,
                              outlettype=ot, patching_rect=pr))

    lines.append(make_conn("obj-plugsync", 0, "obj-bpm-snap", 0))
    lines.append(make_conn("obj-bpm-snap", 0, "obj-bpm-chg", 0))
    lines.append(make_conn("obj-bpm-chg", 0, "obj-bpm-msg-m4l", 0))
    lines.append(make_conn("obj-bpm-msg-m4l", 0, "obj-s-bpm-m4l", 0))

    # BPM display in presentation
    boxes.append(make_box(
        "obj-bpm-display", "number",
        numinlets=1, numoutlets=2, outlettype=["", "bang"],
        patching_rect=[100, 640, 55, 22],
        presentation=True, presentation_rect=[560, 5, 55, 18],
        parameter_enable=0, fontsize=10.0
    ))
    boxes.append(make_box(
        "obj-bpm-display-l", "comment", text="BPM:",
        numinlets=1, numoutlets=0,
        patching_rect=[100, 620, 35, 15],
        presentation=True, presentation_rect=[535, 5, 30, 18],
        fontsize=9.0
    ))
    lines.append(make_conn("obj-bpm-chg", 0, "obj-bpm-display", 0))

    print("Step 3: Added M4L infrastructure (live.thisdevice, plugout~, plugsync~)")

    # ──────────────────────────────────────────────────────────
    # STEP 4: Add live.dial / live.menu / live.toggle params
    # ──────────────────────────────────────────────────────────

    # Presentation layout grid
    # Row heights: title=5, labels=20, row1=35, row2=80, row3=125
    # Column positions:  CHAOS=10  TUNING=180  ARP=330  RESON=440  OUTPUT=540
    DW, DH = 52, 40     # dial size
    MW, MH = 105, 20    # menu size

    # Patching area: new objects go in a clear area (Y=1800+)
    px = 600  # patching X start

    # ─── Column 1: CHAOS (x=10-170) ───

    # Attractor A (live.menu)
    boxes.append(make_live_menu(
        "obj-lm-att", "Attractor", "Attrctr",
        ["Lorenz", "Rossler", "Chua", "Halvorsen", "Aizawa"],
        [px, 1850, MW, MH], [10, 35, MW, MH], initial=0
    ))
    boxes.append(make_box("obj-lm-att-msg", "message", text="att_sel $1",
                           numinlets=2, numoutlets=1, outlettype=[""],
                           patching_rect=[px, 1875, 80, 22]))
    boxes.append(make_box("obj-s-lm-att", "newobj", text="s toGen",
                           numinlets=1, numoutlets=0,
                           patching_rect=[px, 1900, 52, 22]))
    lines.append(make_conn("obj-lm-att", 0, "obj-lm-att-msg", 0))
    lines.append(make_conn("obj-lm-att-msg", 0, "obj-s-lm-att", 0))

    # Chaos gain (live.dial → obj-cg-m)
    boxes.append(make_live_dial(
        "obj-ld-cg", "Chaos Amt", "Chaos", 0.0, 0.1, 0.05,
        [px, 1930, DW, DH], [10, 80, DW, DH]
    ))
    lines.append(make_conn("obj-ld-cg", 0, "obj-cg-m", 0))

    # Rho (live.dial → obj-rho-m)
    boxes.append(make_live_dial(
        "obj-ld-rho", "Rho", "Rho", 20.0, 200.0, 28.0,
        [px + 60, 1930, DW, DH], [65, 80, DW, DH]
    ))
    lines.append(make_conn("obj-ld-rho", 0, "obj-rho-m", 0))

    # Combine mode (live.menu)
    boxes.append(make_live_menu(
        "obj-lm-cm", "Combine Mode", "Combine",
        ["Blend", "Modulate", "Route"],
        [px, 1970, MW, MH], [10, 125, MW, MH], initial=0
    ))
    boxes.append(make_box("obj-lm-cm-msg", "message", text="combine_mode $1",
                           numinlets=2, numoutlets=1, outlettype=[""],
                           patching_rect=[px, 1995, 105, 22]))
    boxes.append(make_box("obj-s-lm-cm", "newobj", text="s toGen",
                           numinlets=1, numoutlets=0,
                           patching_rect=[px, 2020, 52, 22]))
    lines.append(make_conn("obj-lm-cm", 0, "obj-lm-cm-msg", 0))
    lines.append(make_conn("obj-lm-cm-msg", 0, "obj-s-lm-cm", 0))

    # Blend mix (live.dial → obj-bmix-m)
    boxes.append(make_live_dial(
        "obj-ld-bmix", "Blend Mix", "Blend", 0.0, 1.0, 0.5,
        [px + 120, 1930, DW, DH], [120, 80, DW, DH]
    ))
    lines.append(make_conn("obj-ld-bmix", 0, "obj-bmix-m", 0))

    # Mod depth (live.dial → obj-mdep-m)
    boxes.append(make_live_dial(
        "obj-ld-mdep", "Mod Depth", "ModDpth", 0.0, 2.0, 0.5,
        [px + 120, 1970, DW, DH], [120, 125, DW, DH]
    ))
    lines.append(make_conn("obj-ld-mdep", 0, "obj-mdep-m", 0))

    # ─── Column 2: TUNING (x=180-320) ───

    tuning_names = [
        "Yoruba", "Dundun", "Balafon", "7-TET", "BaAka",
        "Nyamaropa", "Gandanga", "Kora Silaba", "Kora Sauta",
        "Tizita Maj", "Tizita Min", "Bati", "Ambassel",
        "Anchihoye", "Amadinda", "Timbila", "San Bow",
        "Wagogo", "Igbo"
    ]

    # Tuning system (live.menu → obj-ts-m)
    boxes.append(make_live_menu(
        "obj-lm-ts", "Tuning System", "Tuning", tuning_names,
        [px + 200, 1850, MW, MH], [180, 35, MW, MH], initial=0
    ))
    lines.append(make_conn("obj-lm-ts", 0, "obj-ts-m", 0))

    # Root Hz (live.dial → obj-root-m)
    boxes.append(make_live_dial(
        "obj-ld-root", "Root Hz", "Root", 20.0, 500.0, 55.0,
        [px + 200, 1930, DW, DH], [180, 80, DW, DH], unitstyle=3
    ))
    lines.append(make_conn("obj-ld-root", 0, "obj-root-m", 0))

    # Flex (live.dial → obj-flex-m)
    boxes.append(make_live_dial(
        "obj-ld-flex", "Flex", "Flex", 0.0, 1.0, 0.5,
        [px + 260, 1930, DW, DH], [235, 80, DW, DH]
    ))
    lines.append(make_conn("obj-ld-flex", 0, "obj-flex-m", 0))

    # Root offset (live.dial → obj-roff-m)
    boxes.append(make_live_dial(
        "obj-ld-roff", "Root Offset", "Offset", -24.0, 24.0, 0.0,
        [px + 200, 1970, DW, DH], [180, 125, DW, DH], unitstyle=0
    ))
    lines.append(make_conn("obj-ld-roff", 0, "obj-roff-m", 0))

    # ─── Column 3: ARP (x=330-430) ───

    arp_names = [
        "Off", "Up", "Down", "PingPong", "Random", "Unison",
        "Poly 3:2", "Triplet", "Bembe", "Shiko", "Call+Resp",
        "Gahu", "Son Clave", "Fume Fume", "Kassa",
        "Kuduro", "Semba", "Kizomba", "Marrabenta",
        "Euclidean", "User Grid"
    ]

    # Arp mode (live.menu → new message → s toGen)
    boxes.append(make_live_menu(
        "obj-lm-arp", "Arp Mode", "Arp", arp_names,
        [px + 350, 1850, MW, MH], [330, 35, MW, MH], initial=0
    ))
    boxes.append(make_box("obj-lm-arp-msg", "message", text="arp_mode $1",
                           numinlets=2, numoutlets=1, outlettype=[""],
                           patching_rect=[px + 350, 1875, 80, 22]))
    boxes.append(make_box("obj-s-lm-arp", "newobj", text="s toGen",
                           numinlets=1, numoutlets=0,
                           patching_rect=[px + 350, 1900, 52, 22]))
    lines.append(make_conn("obj-lm-arp", 0, "obj-lm-arp-msg", 0))
    lines.append(make_conn("obj-lm-arp-msg", 0, "obj-s-lm-arp", 0))

    # Arp rate (live.dial → obj-arpr-m)
    boxes.append(make_live_dial(
        "obj-ld-arpr", "Arp Rate", "Rate", 0.5, 20.0, 2.0,
        [px + 350, 1930, DW, DH], [330, 80, DW, DH]
    ))
    lines.append(make_conn("obj-ld-arpr", 0, "obj-arpr-m", 0))

    # ─── Column 4: RESONATOR (x=440-530) ───

    # Brightness (live.dial → obj-brt-m)
    boxes.append(make_live_dial(
        "obj-ld-brt", "Brightness", "Bright", -1.0, 1.0, 0.0,
        [px + 450, 1850, DW, DH], [440, 35, DW, DH]
    ))
    lines.append(make_conn("obj-ld-brt", 0, "obj-brt-m", 0))

    # Sub amount (live.dial → obj-sub-m)
    boxes.append(make_live_dial(
        "obj-ld-sub", "Sub Bass", "SubBass", 0.0, 1.5, 0.5,
        [px + 450, 1930, DW, DH], [440, 80, DW, DH]
    ))
    lines.append(make_conn("obj-ld-sub", 0, "obj-sub-m", 0))

    # Sub chaos (live.dial → obj-sch-m)
    boxes.append(make_live_dial(
        "obj-ld-sch", "Sub Chaos", "SubChs", 0.0, 1.0, 0.0,
        [px + 450, 1970, DW, DH], [440, 125, DW, DH]
    ))
    lines.append(make_conn("obj-ld-sch", 0, "obj-sch-m", 0))

    # ─── Column 5: OUTPUT (x=540-640) ───

    # Master gain (live.dial → obj-mg-m)
    boxes.append(make_live_dial(
        "obj-ld-mg", "Master Gain", "Gain", 0.0, 1.5, 1.0,
        [px + 550, 1850, DW, DH], [540, 35, DW, DH]
    ))
    lines.append(make_conn("obj-ld-mg", 0, "obj-mg-m", 0))

    # Mute (live.toggle → obj-mute-m)
    boxes.append(make_live_toggle(
        "obj-lt-mute", "Mute", "Mute",
        [px + 550, 1930, 30, 30], [545, 85, 30, 30], initial=0
    ))
    lines.append(make_conn("obj-lt-mute", 0, "obj-mute-m", 0))

    # Mute label
    boxes.append(make_box(
        "obj-mute-lbl-m4l", "comment", text="MUTE",
        numinlets=1, numoutlets=0,
        patching_rect=[px + 585, 1935, 40, 15],
        presentation=True, presentation_rect=[545, 118, 40, 15],
        fontsize=9.0, fontface=1
    ))

    # Meters (reposition from old objects)
    for meter_id in ["obj-meter-l", "obj-meter-r"]:
        idx = find_box_index(boxes, meter_id)
        if idx >= 0:
            b = boxes[idx]['box']
            b['presentation'] = 1
            mx = 620 if meter_id == "obj-meter-l" else 638
            b['presentation_rect'] = [mx, 35, 15, 130]

    print(f"Step 4: Added 16 live.dial/menu/toggle parameters")

    # ──────────────────────────────────────────────────────────
    # STEP 5: Presentation labels
    # ──────────────────────────────────────────────────────────

    # Title
    boxes.append(make_box(
        "obj-m4l-title", "comment", text="CHAOS RESONATOR",
        numinlets=1, numoutlets=0,
        patching_rect=[15, 5, 200, 22],
        presentation=True, presentation_rect=[10, 3, 200, 22],
        fontsize=14.0, fontface=1
    ))

    # Section headers
    sections = [
        ("obj-sec-chaos", "CHAOS", 10),
        ("obj-sec-tuning", "TUNING", 180),
        ("obj-sec-arp", "ARP", 330),
        ("obj-sec-res", "RESONATOR", 440),
        ("obj-sec-out", "OUTPUT", 540),
    ]
    for sid, text, x in sections:
        boxes.append(make_box(
            sid, "comment", text=text,
            numinlets=1, numoutlets=0,
            patching_rect=[15, 5, 80, 15],
            presentation=True, presentation_rect=[x, 22, 80, 15],
            fontsize=9.0, fontface=1
        ))

    # Horizontal separator
    boxes.append(make_box(
        "obj-sep1", "panel",
        numinlets=1, numoutlets=0,
        patching_rect=[15, 5, 640, 2],
        presentation=True, presentation_rect=[5, 170, 660, 2],
        **{"bgcolor": [0.5, 0.5, 0.5, 1.0]}
    ))

    print("Step 5: Added presentation labels")

    # ──────────────────────────────────────────────────────────
    # STEP 6: Merge Sweetspot Explorer
    # ──────────────────────────────────────────────────────────

    sw_boxes = sweetspot['patcher']['boxes']
    sw_lines = sweetspot['patcher']['lines']

    # IDs to exclude from merge
    sw_exclude = {'obj-title', 'obj-plotter',
                  'obj-coll-loadbang', 'obj-coll-loaddelay', 'obj-coll-readmsg'}

    # Connections to skip (file-read chain — presets are embedded)
    sw_skip_conns = {
        ('obj-coll-loadbang', 'obj-coll-loaddelay'),
        ('obj-coll-loaddelay', 'obj-coll-readmsg'),
        ('obj-coll-readmsg', 'obj-coll'),
    }

    def prefix(box_id):
        return f"sw-{box_id}"

    # Presentation offset: sweetspot section starts at Y=175
    SW_PRES_Y_OFFSET = 175
    # Patching offset: place sweetspot objects below main patch
    SW_PATCH_X_OFFSET = 500
    SW_PATCH_Y_OFFSET = 50

    sw_added = 0
    for sb in sw_boxes:
        box = sb['box']
        if box['id'] in sw_exclude:
            continue

        new_box = copy.deepcopy(box)
        new_box['id'] = prefix(box['id'])

        # Offset patching position
        if 'patching_rect' in new_box:
            r = new_box['patching_rect']
            new_box['patching_rect'] = [
                r[0] + SW_PATCH_X_OFFSET, r[1] + SW_PATCH_Y_OFFSET, r[2], r[3]
            ]

        # Offset presentation position
        if new_box.get('presentation') and 'presentation_rect' in new_box:
            pr = new_box['presentation_rect']
            new_box['presentation_rect'] = [pr[0], pr[1] + SW_PRES_Y_OFFSET, pr[2], pr[3]]

        # Embed presets in coll objects
        if (new_box.get('maxclass') == 'newobj'
                and 'coll presets' in new_box.get('text', '')):
            new_box['text'] = 'coll presets @embed 1'
            new_box['saved_object_attributes'] = {"embed": 1, "precision": 6}
            new_box['coll_data'] = {
                "count": len(presets_data),
                "data": presets_data
            }

        boxes.append({"box": new_box})
        sw_added += 1

    # Copy connections with prefixed IDs
    sw_conns_added = 0
    for sl in sw_lines:
        src_id = sl['patchline']['source'][0]
        dst_id = sl['patchline']['destination'][0]

        if (src_id, dst_id) in sw_skip_conns:
            continue
        if src_id in sw_exclude or dst_id in sw_exclude:
            continue

        new_line = copy.deepcopy(sl)
        new_line['patchline']['source'][0] = prefix(src_id)
        new_line['patchline']['destination'][0] = prefix(dst_id)
        lines.append(new_line)
        sw_conns_added += 1

    # Sweetspot section label
    boxes.append(make_box(
        "obj-sw-title", "comment", text="SWEETSPOT EXPLORER",
        numinlets=1, numoutlets=0,
        patching_rect=[15, 5, 200, 20],
        presentation=True, presentation_rect=[10, 178, 200, 18],
        fontsize=11.0, fontface=1
    ))

    # Manual preset selector (live.dial)
    boxes.append(make_live_dial(
        "obj-ld-preset", "Preset #", "Preset", 0, 49, 0,
        [px + 550, 2050, DW, DH], [320, 195, DW, DH],
        unitstyle=0
    ))
    # Convert float to int for coll lookup
    boxes.append(make_box(
        "obj-preset-int", "newobj", text="i",
        numinlets=2, numoutlets=1, outlettype=["int"],
        patching_rect=[px + 550, 2095, 30, 22]
    ))
    lines.append(make_conn("obj-ld-preset", 0, "obj-preset-int", 0))
    lines.append(make_conn("obj-preset-int", 0, f"{prefix('obj-manual-coll')}", 0))

    # Restyle the plotter for M4L panel (wider)
    plotter_id = prefix('obj-1')  # fluid.plotter JSUI
    idx = find_box_index(boxes, plotter_id)
    if idx >= 0:
        b = boxes[idx]['box']
        b['presentation_rect'] = [10, 200, 300, 160]

    # Reposition sweetspot legend
    legend_id = prefix('obj-legend')
    idx = find_box_index(boxes, legend_id)
    if idx >= 0:
        b = boxes[idx]['box']
        b['presentation_rect'] = [320, 215, 340, 19]

    # Reposition sweep toggle and label
    for sw_id, new_rect in [
        (prefix('obj-sweep-tog'), [320, 255, 24, 24]),
        (prefix('obj-sweep-label'), [348, 259, 100, 18]),
        (prefix('obj-build-btn'), [320, 285, 24, 24]),
        (prefix('obj-build-label'), [348, 289, 70, 18]),
        (prefix('obj-progress'), [430, 259, 45, 18]),
        (prefix('obj-progress-label'), [475, 259, 35, 18]),
    ]:
        idx = find_box_index(boxes, sw_id)
        if idx >= 0:
            b = boxes[idx]['box']
            b['presentation'] = 1
            b['presentation_rect'] = new_rect

    # Preset display message
    for sw_id, new_rect in [
        (prefix('obj-preset-display'), [10, 365, 350, 18]),
        (prefix('obj-recall-display'), [320, 320, 330, 18]),
    ]:
        idx = find_box_index(boxes, sw_id)
        if idx >= 0:
            b = boxes[idx]['box']
            b['presentation'] = 1
            b['presentation_rect'] = new_rect

    # Manual number + label (reposition or hide — we have live.dial now)
    for hide_id in [prefix('obj-manual-label'), prefix('obj-manual-num'),
                    prefix('obj-recall-idx')]:
        idx = find_box_index(boxes, hide_id)
        if idx >= 0:
            boxes[idx]['box'].pop('presentation', None)
            boxes[idx]['box'].pop('presentation_rect', None)

    print(f"Step 6: Merged {sw_added} sweetspot boxes, {sw_conns_added} connections")

    # ──────────────────────────────────────────────────────────
    # STEP 7: Update patcher properties for M4L
    # ──────────────────────────────────────────────────────────

    patch['patcher']['rect'] = [0, 0, 700, 400]
    patch['patcher']['openinpresentation'] = 1

    # Update init message: remove params now handled by live.dials
    # Keep only params without live.dial controls
    idx = find_box_index(boxes, 'obj-init-msg')
    if idx >= 0:
        boxes[idx]['box']['text'] = "att_b_sel -1, smooth_speed 1, sub_drone 1"

    print("Step 7: Updated patcher properties for M4L")

    # ──────────────────────────────────────────────────────────
    # STEP 8: Save output
    # ──────────────────────────────────────────────────────────

    output_path = os.path.join(SCRIPT_DIR, 'chaos_resonator.amxd')
    with open(output_path, 'w') as f:
        json.dump(patch, f, indent='\t')

    size_kb = os.path.getsize(output_path) / 1024
    print(f"\n{'=' * 60}")
    print(f"Saved: {output_path}")
    print(f"Size:  {size_kb:.0f} KB")
    print(f"Boxes: {len(boxes)}")
    print(f"Lines: {len(lines)}")
    print(f"{'=' * 60}")
    print(f"""
Next steps:
  1. Copy JS files alongside the .amxd:
     - swarm.js, grid_bitmask.js, midi_learn.js, timestamp.js
  2. Open chaos_resonator.amxd in Max (double-click)
  3. Drop onto a MIDI track in Live
  4. Verify:
     - Audio output through plugout~
     - live.dial params appear in automation lanes
     - BPM syncs to Live transport
     - Sweetspot sweep populates the map
  5. Save Live set to persist UMAP data

Requirements:
  - FluCoMa package (Max Package Manager)
  - Max 8.6+ / Live 11+
""")


if __name__ == '__main__':
    convert()
