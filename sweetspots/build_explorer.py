#!/usr/bin/env python3
"""
Build sweetspot_explorer.maxpat — a FluCoMa-based Max patch that:
1. Auto-sweeps 50 presets through the real Chaos Resonator
2. Captures post-waveguide audio via receive~ feedback_L/R
3. Analyzes each preset with FluCoMa descriptors (MFCC, spectral, loudness, pitch)
4. Builds a UMAP 2D map for interactive navigation via fluid.plotter

FluCoMa API notes (camelCase throughout):
  - Buffer attrs: @source, @features, @stats, @numCoeffs, @numChans
  - Compose attrs: @startFrame, @numFrames, @startChan, @numChans, @destStartFrame, @destStartChan
  - Dataset/ML objects use messages: fitTransform <src> <dst>, fit <dataset>
  - Plotter outlet 0 = x y floats. Use kdtree knearest for point ID lookup.
  - Plotter data loaded via fluid.dataset~ dump → dictionary → plotter

Reads presets from presets.txt, outputs to ../max/sweetspot_explorer.maxpat
"""

import json
import re
from pathlib import Path

PRESETS_FILE = Path(__file__).parent / "presets.txt"
OUT_FILE = Path(__file__).parent.parent / "max" / "sweetspot_explorer.maxpat"

ATTRACTOR_NAMES = {0: "Lorenz", 1: "Rossler", 2: "Chua", 3: "Halvorsen", 4: "Aizawa"}
ATTRACTOR_COLORS = {
    0: [0.9, 0.2, 0.2, 1.0],   # Red
    1: [0.2, 0.8, 0.2, 1.0],   # Green
    2: [0.3, 0.4, 0.9, 1.0],   # Blue
    3: [0.9, 0.8, 0.1, 1.0],   # Yellow
    4: [0.7, 0.3, 0.9, 1.0],   # Purple
}

NUM_FEATURES = 37  # 26 MFCC(13 means + 13 stddevs) + 7 spectral + 2 loudness + 2 pitch

# ── Layout constants ──
COL1 = 30       # Main flow column
COL2 = 520      # Secondary column (buffers, datasets, manual entry)
ROW = 32        # Row height within sections
GAP = 18        # Extra gap between sections


def parse_presets():
    """Parse presets.txt into list of (index, attractor_id, params_string, label)."""
    presets = []
    idx = 0
    with open(PRESETS_FILE) as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            comment = ""
            if "#" in line:
                parts = line.split("#", 1)
                line_clean = parts[0].strip()
                comment = parts[1].strip()
            else:
                line_clean = line

            m = re.search(r"att_sel\s+(\d+)", line_clean)
            if not m:
                continue
            att_id = int(m.group(1))
            att_name = ATTRACTOR_NAMES.get(att_id, f"att{att_id}")
            label = f"{att_name}: {comment}" if comment else f"{att_name} preset {idx}"
            params = line_clean.rstrip(",").strip()

            presets.append((idx, att_id, params, label))
            idx += 1
    return presets


def box(id_, maxclass, text=None, numinlets=1, numoutlets=1,
        outlettype=None, patching_rect=None, **extra):
    """Create a Max box dict."""
    b = {
        "id": id_,
        "maxclass": maxclass,
        "numinlets": numinlets,
        "numoutlets": numoutlets,
    }
    if text is not None:
        b["text"] = text
    if outlettype is not None:
        b["outlettype"] = outlettype
    if patching_rect is not None:
        b["patching_rect"] = patching_rect
    b.update(extra)
    return {"box": b}


def patchline(src_id, src_outlet, dst_id, dst_inlet):
    """Create a patchline dict."""
    return {
        "patchline": {
            "source": [src_id, src_outlet],
            "destination": [dst_id, dst_inlet],
        }
    }


def build_patch():
    presets = parse_presets()
    num_presets = len(presets)

    boxes = []
    lines = []
    y = 20  # running y position

    # ═══════════════════════════════════════════════════════════════
    # A. TITLE
    # ═══════════════════════════════════════════════════════════════
    boxes.append(box(
        "obj-title", "comment", numinlets=1, numoutlets=0,
        text=f"SWEETSPOT EXPLORER — {num_presets} presets\n"
             "FluCoMa analysis + UMAP navigation\n\n"
             "1. Open step6_chaos_resonator, turn on audio\n"
             "2. Click [Start Sweep] below\n"
             "3. Wait ~3.5 min for analysis\n"
             "4. Click points on the map to recall presets\n\n"
             "Requires: FluCoMa package (Max Package Manager)",
        patching_rect=[COL1, y, 460, 120],
        fontsize=12.0, linecount=8
    ))
    y += 120 + GAP

    # ═══════════════════════════════════════════════════════════════
    # B. PRESET STORAGE (coll) — loaded from presets.coll on loadbang
    # ═══════════════════════════════════════════════════════════════
    boxes.append(box(
        "obj-coll-loadbang", "newobj",
        text="loadbang",
        numinlets=1, numoutlets=1,
        outlettype=["bang"],
        patching_rect=[COL1 + 170, y, 65, 22]
    ))
    boxes.append(box(
        "obj-coll-readmsg", "message",
        text="read presets.coll",
        numinlets=2, numoutlets=1,
        outlettype=[""],
        patching_rect=[COL1 + 170, y + ROW, 115, 22]
    ))
    lines.append(patchline("obj-coll-loadbang", 0, "obj-coll-readmsg", 0))

    boxes.append(box(
        "obj-coll", "newobj",
        text="coll presets",
        numinlets=1, numoutlets=4,
        outlettype=["", "", "int", ""],
        patching_rect=[COL1, y + 2 * ROW, 120, 22]
    ))
    lines.append(patchline("obj-coll-readmsg", 0, "obj-coll", 0))
    y += 3 * ROW + GAP

    # ═══════════════════════════════════════════════════════════════
    # C. SWEEP ENGINE
    # ═══════════════════════════════════════════════════════════════
    sweep_y = y

    boxes.append(box(
        "obj-sweep-tog", "toggle",
        numinlets=1, numoutlets=1,
        outlettype=["int"],
        patching_rect=[COL1, y, 24, 24],
        presentation=1, presentation_rect=[10, 10, 30, 30]
    ))
    boxes.append(box(
        "obj-sweep-label", "comment",
        text="Start / Stop Sweep", numinlets=1, numoutlets=0,
        patching_rect=[COL1 + 30, y + 2, 130, 22],
        presentation=1, presentation_rect=[45, 14, 130, 22]
    ))
    y += ROW + 4

    boxes.append(box(
        "obj-metro", "newobj",
        text="metro 4000",
        numinlets=2, numoutlets=1,
        outlettype=["bang"],
        patching_rect=[COL1, y, 80, 22]
    ))
    lines.append(patchline("obj-sweep-tog", 0, "obj-metro", 0))
    y += ROW

    boxes.append(box(
        "obj-counter", "newobj",
        text=f"counter 0 {num_presets - 1}",
        numinlets=5, numoutlets=4,
        outlettype=["int", "", "", "int"],
        patching_rect=[COL1, y, 130, 22]
    ))
    lines.append(patchline("obj-metro", 0, "obj-counter", 0))

    # Counter overflow → stop sweep
    boxes.append(box(
        "obj-sweep-done", "message",
        text="0",
        numinlets=2, numoutlets=1,
        outlettype=[""],
        patching_rect=[COL1 + 140, y, 25, 22]
    ))
    lines.append(patchline("obj-counter", 2, "obj-sweep-done", 0))
    lines.append(patchline("obj-sweep-done", 0, "obj-sweep-tog", 0))

    # Progress display
    boxes.append(box(
        "obj-progress", "number",
        numinlets=1, numoutlets=2,
        outlettype=["", "bang"],
        patching_rect=[COL1 + 200, y, 50, 22],
        presentation=1, presentation_rect=[180, 14, 50, 22]
    ))
    lines.append(patchline("obj-counter", 0, "obj-progress", 0))

    boxes.append(box(
        "obj-progress-label", "comment",
        text=f"/ {num_presets - 1}", numinlets=1, numoutlets=0,
        patching_rect=[COL1 + 255, y + 2, 50, 22],
        presentation=1, presentation_rect=[232, 14, 50, 22]
    ))
    y += ROW

    # State machine trigger: t b b b i
    boxes.append(box(
        "obj-trig", "newobj",
        text="t b b b i",
        numinlets=1, numoutlets=4,
        outlettype=["bang", "bang", "bang", "int"],
        patching_rect=[COL1, y, 100, 22]
    ))
    lines.append(patchline("obj-counter", 0, "obj-trig", 0))
    lines.append(patchline("obj-trig", 3, "obj-coll", 0))
    y += ROW

    # ═══════════════════════════════════════════════════════════════
    # D. PRESET RECALL — coll output → s toGen + display
    # ═══════════════════════════════════════════════════════════════
    boxes.append(box(
        "obj-s-toGen", "newobj",
        text="s toGen",
        numinlets=1, numoutlets=0,
        patching_rect=[COL1, y, 55, 22]
    ))
    lines.append(patchline("obj-coll", 0, "obj-s-toGen", 0))

    boxes.append(box(
        "obj-preset-display", "message",
        text="",
        numinlets=2, numoutlets=1,
        outlettype=[""],
        patching_rect=[COL1 + 80, y, 380, 22],
        presentation=1, presentation_rect=[10, 42, 460, 22]
    ))
    lines.append(patchline("obj-coll", 0, "obj-preset-display", 1))
    y += ROW + GAP

    # ═══════════════════════════════════════════════════════════════
    # E. AUDIO CAPTURE — receive~ → record~ with start/stop delays
    # ═══════════════════════════════════════════════════════════════
    boxes.append(box(
        "obj-recv-L", "newobj",
        text="receive~ feedback_L",
        numinlets=1, numoutlets=1,
        outlettype=["signal"],
        patching_rect=[COL1, y, 130, 22]
    ))

    boxes.append(box(
        "obj-capture-buf", "newobj",
        text="buffer~ capture_buf 2000",
        numinlets=1, numoutlets=2,
        outlettype=["float", "bang"],
        patching_rect=[COL1 + 300, y, 160, 22]
    ))
    y += ROW

    boxes.append(box(
        "obj-record", "newobj",
        text="record~ capture_buf 1",
        numinlets=2, numoutlets=1,
        outlettype=["signal"],
        patching_rect=[COL1, y, 130, 22]
    ))
    lines.append(patchline("obj-recv-L", 0, "obj-record", 0))

    # Record start: delay 500ms
    boxes.append(box(
        "obj-rec-delay", "newobj",
        text="delay 500",
        numinlets=2, numoutlets=1,
        outlettype=["bang"],
        patching_rect=[COL1 + 170, y, 75, 22]
    ))
    lines.append(patchline("obj-trig", 2, "obj-rec-delay", 0))

    # Record stop: delay 2500ms
    boxes.append(box(
        "obj-rec-stop-delay", "newobj",
        text="delay 2500",
        numinlets=2, numoutlets=1,
        outlettype=["bang"],
        patching_rect=[COL1 + 280, y, 85, 22]
    ))
    lines.append(patchline("obj-trig", 2, "obj-rec-stop-delay", 0))
    y += ROW

    # Start/stop messages
    boxes.append(box(
        "obj-rec-start", "message",
        text="1",
        numinlets=2, numoutlets=1,
        outlettype=[""],
        patching_rect=[COL1 + 170, y, 25, 22]
    ))
    lines.append(patchline("obj-rec-delay", 0, "obj-rec-start", 0))
    lines.append(patchline("obj-rec-start", 0, "obj-record", 1))

    boxes.append(box(
        "obj-rec-stop", "message",
        text="0",
        numinlets=2, numoutlets=1,
        outlettype=[""],
        patching_rect=[COL1 + 280, y, 25, 22]
    ))
    lines.append(patchline("obj-rec-stop-delay", 0, "obj-rec-stop", 0))
    lines.append(patchline("obj-rec-stop", 0, "obj-record", 1))
    y += ROW + GAP

    # ═══════════════════════════════════════════════════════════════
    # F. FluCoMa ANALYSIS CHAIN — stacked vertically, chained via done-bang
    # ═══════════════════════════════════════════════════════════════
    analysis_y = y

    # Analysis trigger
    boxes.append(box(
        "obj-analyze-delay", "newobj",
        text="delay 2600",
        numinlets=2, numoutlets=1,
        outlettype=["bang"],
        patching_rect=[COL1, y, 85, 22]
    ))
    lines.append(patchline("obj-trig", 0, "obj-analyze-delay", 0))
    y += ROW

    # Feature buffers — right column, stacked neatly
    buf_names = [
        "mfcc_buf", "mfcc_stats_buf",
        "shape_buf", "shape_stats_buf",
        "loud_buf", "loud_stats_buf",
        "pitch_buf", "pitch_stats_buf",
        "feature_row",
    ]
    buf_y = analysis_y
    for buf_name in buf_names:
        boxes.append(box(
            f"obj-{buf_name}", "newobj",
            text=f"buffer~ {buf_name}",
            numinlets=1, numoutlets=2,
            outlettype=["float", "bang"],
            patching_rect=[COL2, buf_y, 150, 22]
        ))
        buf_y += ROW - 4  # tighter spacing for buffer stack

    # Analysis objects — main column, chained
    analysis_objs = [
        ("obj-mfcc", "fluid.bufmfcc~ @source capture_buf @features mfcc_buf @numCoeffs 13 @numChans 1"),
        ("obj-mfcc-stats", "fluid.bufstats~ @source mfcc_buf @stats mfcc_stats_buf @numChans 1"),
        ("obj-spectral", "fluid.bufspectralshape~ @source capture_buf @features shape_buf @numChans 1"),
        ("obj-spectral-stats", "fluid.bufstats~ @source shape_buf @stats shape_stats_buf @numChans 1"),
        ("obj-loudness", "fluid.bufloudness~ @source capture_buf @features loud_buf @numChans 1"),
        ("obj-loud-stats", "fluid.bufstats~ @source loud_buf @stats loud_stats_buf @numChans 1"),
        ("obj-pitch", "fluid.bufpitch~ @source capture_buf @features pitch_buf @numChans 1"),
        ("obj-pitch-stats", "fluid.bufstats~ @source pitch_buf @stats pitch_stats_buf @numChans 1"),
    ]

    prev_id = "obj-analyze-delay"
    prev_outlet = 0
    for obj_id, obj_text in analysis_objs:
        boxes.append(box(
            obj_id, "newobj",
            text=obj_text,
            numinlets=1, numoutlets=2,
            outlettype=["", "bang"],
            patching_rect=[COL1, y, 460, 22]
        ))
        if prev_id == "obj-analyze-delay":
            lines.append(patchline(prev_id, 0, obj_id, 0))
        else:
            lines.append(patchline(prev_id, 1, obj_id, 0))  # done-bang chain
        prev_id = obj_id
        y += ROW
    y += GAP

    # ═══════════════════════════════════════════════════════════════
    # G. FEATURE ASSEMBLY — bufcompose~ → dataset
    # ═══════════════════════════════════════════════════════════════
    compose_objs = [
        ("obj-comp-mfcc",
         "fluid.bufcompose~ @source mfcc_stats_buf @destination feature_row "
         "@startFrame 0 @numFrames 1 @startChan 0 @numChans 13 "
         "@destStartFrame 0 @destStartChan 0"),
        ("obj-comp-mfcc-std",
         "fluid.bufcompose~ @source mfcc_stats_buf @destination feature_row "
         "@startFrame 1 @numFrames 1 @startChan 0 @numChans 13 "
         "@destStartChan 13"),
        ("obj-comp-shape",
         "fluid.bufcompose~ @source shape_stats_buf @destination feature_row "
         "@startFrame 0 @numFrames 1 @startChan 0 @numChans 7 "
         "@destStartChan 26"),
        ("obj-comp-loud",
         "fluid.bufcompose~ @source loud_stats_buf @destination feature_row "
         "@startFrame 0 @numFrames 1 @startChan 0 @numChans 2 "
         "@destStartChan 33"),
        ("obj-comp-pitch",
         "fluid.bufcompose~ @source pitch_stats_buf @destination feature_row "
         "@startFrame 0 @numFrames 1 @startChan 0 @numChans 2 "
         "@destStartChan 35"),
    ]

    for obj_id, obj_text in compose_objs:
        boxes.append(box(
            obj_id, "newobj",
            text=obj_text,
            numinlets=1, numoutlets=2,
            outlettype=["", "bang"],
            patching_rect=[COL1, y, 460, 22]
        ))
        lines.append(patchline(prev_id, 1, obj_id, 0))
        prev_id = obj_id
        y += ROW
    y += 4

    # Index hold + tosymbol → addpoint message
    boxes.append(box(
        "obj-idx-hold", "newobj",
        text="i",
        numinlets=2, numoutlets=1,
        outlettype=["int"],
        patching_rect=[COL1 + 200, y, 30, 22]
    ))
    lines.append(patchline("obj-counter", 0, "obj-idx-hold", 1))
    lines.append(patchline("obj-comp-pitch", 1, "obj-idx-hold", 0))

    boxes.append(box(
        "obj-idx-sym", "newobj",
        text="tosymbol",
        numinlets=1, numoutlets=1,
        outlettype=[""],
        patching_rect=[COL1 + 250, y, 65, 22]
    ))
    lines.append(patchline("obj-idx-hold", 0, "obj-idx-sym", 0))
    y += ROW

    boxes.append(box(
        "obj-addpoint-msg", "message",
        text="addpoint $1 feature_row",
        numinlets=2, numoutlets=1,
        outlettype=[""],
        patching_rect=[COL1, y, 190, 22]
    ))
    lines.append(patchline("obj-idx-sym", 0, "obj-addpoint-msg", 0))
    y += ROW

    boxes.append(box(
        "obj-dataset", "newobj",
        text="fluid.dataset~ sweetspots",
        numinlets=1, numoutlets=2,
        outlettype=["", ""],
        patching_rect=[COL1, y, 170, 22]
    ))
    lines.append(patchline("obj-addpoint-msg", 0, "obj-dataset", 0))

    boxes.append(box(
        "obj-labelset", "newobj",
        text="fluid.labelset~ labels",
        numinlets=1, numoutlets=2,
        outlettype=["", ""],
        patching_rect=[COL1 + 200, y, 160, 22]
    ))
    y += ROW + GAP

    # ═══════════════════════════════════════════════════════════════
    # H. POST-SWEEP ML PIPELINE: Normalize → UMAP → KDTree
    # ═══════════════════════════════════════════════════════════════
    ml_y = y

    # Trigger: counter overflow + manual button
    boxes.append(box(
        "obj-umap-delay", "newobj",
        text="delay 500",
        numinlets=2, numoutlets=1,
        outlettype=["bang"],
        patching_rect=[COL1, y, 75, 22]
    ))
    lines.append(patchline("obj-counter", 2, "obj-umap-delay", 0))

    boxes.append(box(
        "obj-build-btn", "button",
        numinlets=1, numoutlets=1,
        outlettype=["bang"],
        patching_rect=[COL1 + 120, y, 24, 24],
        presentation=1, presentation_rect=[300, 10, 30, 30]
    ))
    boxes.append(box(
        "obj-build-label", "comment",
        text="Build Map", numinlets=1, numoutlets=0,
        patching_rect=[COL1 + 150, y + 2, 70, 22],
        presentation=1, presentation_rect=[335, 14, 70, 22]
    ))
    y += ROW

    boxes.append(box(
        "obj-post-trig", "newobj",
        text="t b",
        numinlets=1, numoutlets=1,
        outlettype=["bang"],
        patching_rect=[COL1, y, 35, 22]
    ))
    lines.append(patchline("obj-umap-delay", 0, "obj-post-trig", 0))
    lines.append(patchline("obj-build-btn", 0, "obj-post-trig", 0))
    y += ROW

    # 1. Normalize
    boxes.append(box(
        "obj-norm-msg", "message",
        text="fitTransform sweetspots sweetspots_norm",
        numinlets=2, numoutlets=1,
        outlettype=[""],
        patching_rect=[COL1, y, 270, 22]
    ))
    lines.append(patchline("obj-post-trig", 0, "obj-norm-msg", 0))
    y += ROW

    boxes.append(box(
        "obj-normalize", "newobj",
        text="fluid.normalize~",
        numinlets=1, numoutlets=2,
        outlettype=["", ""],
        patching_rect=[COL1, y, 120, 22]
    ))
    lines.append(patchline("obj-norm-msg", 0, "obj-normalize", 0))

    boxes.append(box(
        "obj-ds-norm", "newobj",
        text="fluid.dataset~ sweetspots_norm",
        numinlets=1, numoutlets=2,
        outlettype=["", ""],
        patching_rect=[COL2, y, 190, 22]
    ))
    y += ROW

    # 2. UMAP
    boxes.append(box(
        "obj-umap-msg", "message",
        text="fitTransform sweetspots_norm sweetspots_2d",
        numinlets=2, numoutlets=1,
        outlettype=[""],
        patching_rect=[COL1, y, 280, 22]
    ))
    lines.append(patchline("obj-normalize", 1, "obj-umap-msg", 0))
    y += ROW

    boxes.append(box(
        "obj-umap", "newobj",
        text="fluid.umap~ @numDimensions 2 @numNeighbours 10 @minDist 0.3 @iterations 200",
        numinlets=1, numoutlets=2,
        outlettype=["", ""],
        patching_rect=[COL1, y, 460, 22]
    ))
    lines.append(patchline("obj-umap-msg", 0, "obj-umap", 0))

    boxes.append(box(
        "obj-ds-2d", "newobj",
        text="fluid.dataset~ sweetspots_2d",
        numinlets=1, numoutlets=2,
        outlettype=["", ""],
        patching_rect=[COL2, y, 180, 22]
    ))
    y += ROW

    # 3. KDTree
    boxes.append(box(
        "obj-kdtree-msg", "message",
        text="fit sweetspots_2d",
        numinlets=2, numoutlets=1,
        outlettype=[""],
        patching_rect=[COL1, y, 120, 22]
    ))
    lines.append(patchline("obj-umap", 1, "obj-kdtree-msg", 0))
    y += ROW

    boxes.append(box(
        "obj-kdtree", "newobj",
        text="fluid.kdtree~",
        numinlets=1, numoutlets=2,
        outlettype=["", ""],
        patching_rect=[COL1, y, 100, 22]
    ))
    lines.append(patchline("obj-kdtree-msg", 0, "obj-kdtree", 0))
    y += ROW + GAP

    # ═══════════════════════════════════════════════════════════════
    # I. PLOTTER — dump 2D dataset → plotter, with colors + labels
    # ═══════════════════════════════════════════════════════════════

    # Dump trigger (after kdtree fit)
    boxes.append(box(
        "obj-dump-2d-msg", "message",
        text="dump",
        numinlets=2, numoutlets=1,
        outlettype=[""],
        patching_rect=[COL1, y, 40, 22]
    ))
    lines.append(patchline("obj-kdtree", 1, "obj-dump-2d-msg", 0))
    lines.append(patchline("obj-dump-2d-msg", 0, "obj-ds-2d", 0))

    # Color delay (wait for plotter to receive dict)
    boxes.append(box(
        "obj-color-delay", "newobj",
        text="delay 200",
        numinlets=2, numoutlets=1,
        outlettype=["bang"],
        patching_rect=[COL1 + 60, y, 75, 22]
    ))
    lines.append(patchline("obj-dump-2d-msg", 0, "obj-color-delay", 0))

    # Color + label messages — stacked right of dump trigger
    msg_x = COL1 + 160
    msg_y = y
    for att_id, color in ATTRACTOR_COLORS.items():
        att_presets = [p for p in presets if p[1] == att_id]
        if not att_presets:
            continue
        color_cmds = []
        for preset_idx, _, _, _ in att_presets:
            r, g, b, a = color
            color_cmds.append(f"pointcolor {preset_idx} {r} {g} {b} {a}")
        color_msg = ", ".join(color_cmds)
        boxes.append(box(
            f"obj-color-{att_id}", "message",
            text=color_msg,
            numinlets=2, numoutlets=1,
            outlettype=[""],
            patching_rect=[msg_x, msg_y, 340, 22]
        ))
        lines.append(patchline("obj-color-delay", 0, f"obj-color-{att_id}", 0))
        lines.append(patchline(f"obj-color-{att_id}", 0, "obj-plotter", 0))
        msg_y += ROW - 6

    # Point labels (chunked into groups of 10)
    label_cmds = []
    for idx, att_id, params, label in presets:
        safe_label = ATTRACTOR_NAMES[att_id]
        label_cmds.append(f"pointlabel {idx} {safe_label}")
    chunk_size = 10
    label_chunks = [label_cmds[i:i+chunk_size] for i in range(0, len(label_cmds), chunk_size)]
    for ci, chunk in enumerate(label_chunks):
        msg_text = ", ".join(chunk)
        boxes.append(box(
            f"obj-labels-{ci}", "message",
            text=msg_text,
            numinlets=2, numoutlets=1,
            outlettype=[""],
            patching_rect=[msg_x, msg_y, 340, 22]
        ))
        lines.append(patchline("obj-color-delay", 0, f"obj-labels-{ci}", 0))
        lines.append(patchline(f"obj-labels-{ci}", 0, "obj-plotter", 0))
        msg_y += ROW - 6

    # Advance y past the color/label messages
    y = max(y + ROW + GAP, msg_y + GAP)

    # Dataset dump outlet → plotter
    lines.append(patchline("obj-ds-2d", 0, "obj-plotter", 0))

    # Legend
    boxes.append(box(
        "obj-legend", "comment",
        text="RED=Lorenz  GREEN=Rossler  BLUE=Chua  YELLOW=Halvorsen  PURPLE=Aizawa",
        numinlets=1, numoutlets=0,
        patching_rect=[COL1, y, 480, 18],
        presentation=1, presentation_rect=[10, 70, 480, 18],
        fontsize=11.0
    ))
    y += 22

    # Plotter (large)
    boxes.append(box(
        "obj-plotter", "newobj",
        text="fluid.plotter",
        numinlets=1, numoutlets=2,
        outlettype=["", ""],
        patching_rect=[COL1, y, 600, 400],
        presentation=1, presentation_rect=[10, 92, 600, 400]
    ))
    plotter_bottom = y + 400
    y = plotter_bottom + GAP

    # ═══════════════════════════════════════════════════════════════
    # J. CLICK RECALL — plotter → kdtree lookup → coll → s toGen
    # ═══════════════════════════════════════════════════════════════

    boxes.append(box(
        "obj-click-buf", "newobj",
        text="buffer~ click_xy 1 2",
        numinlets=1, numoutlets=2,
        outlettype=["float", "bang"],
        patching_rect=[COL1 + 300, y, 130, 22]
    ))

    boxes.append(box(
        "obj-click-unpack", "newobj",
        text="unpack f f",
        numinlets=1, numoutlets=2,
        outlettype=["float", "float"],
        patching_rect=[COL1, y, 80, 22]
    ))
    lines.append(patchline("obj-plotter", 0, "obj-click-unpack", 0))
    y += ROW

    boxes.append(box(
        "obj-peek-x", "newobj",
        text="peek~ click_xy 1 0",
        numinlets=2, numoutlets=2,
        outlettype=["float", "bang"],
        patching_rect=[COL1, y, 130, 22]
    ))
    lines.append(patchline("obj-click-unpack", 0, "obj-peek-x", 0))

    boxes.append(box(
        "obj-peek-y", "newobj",
        text="peek~ click_xy 2 0",
        numinlets=2, numoutlets=2,
        outlettype=["float", "bang"],
        patching_rect=[COL1 + 150, y, 130, 22]
    ))
    lines.append(patchline("obj-click-unpack", 1, "obj-peek-y", 0))
    y += ROW

    boxes.append(box(
        "obj-knn-msg", "message",
        text="knearest click_xy 1",
        numinlets=2, numoutlets=1,
        outlettype=[""],
        patching_rect=[COL1, y, 130, 22]
    ))
    lines.append(patchline("obj-peek-y", 1, "obj-knn-msg", 0))
    y += ROW

    # Query kdtree (needs fit too)
    boxes.append(box(
        "obj-kdtree-query", "newobj",
        text="fluid.kdtree~",
        numinlets=1, numoutlets=2,
        outlettype=["", ""],
        patching_rect=[COL1, y, 100, 22]
    ))
    lines.append(patchline("obj-knn-msg", 0, "obj-kdtree-query", 0))

    boxes.append(box(
        "obj-kdtree-query-fit", "message",
        text="fit sweetspots_2d",
        numinlets=2, numoutlets=1,
        outlettype=[""],
        patching_rect=[COL1 + 120, y, 120, 22]
    ))
    lines.append(patchline("obj-umap", 1, "obj-kdtree-query-fit", 0))
    lines.append(patchline("obj-kdtree-query-fit", 0, "obj-kdtree-query", 0))
    y += ROW

    # Convert point ID symbol → int
    boxes.append(box(
        "obj-knn-fromsym", "newobj",
        text="fromsymbol",
        numinlets=1, numoutlets=1,
        outlettype=[""],
        patching_rect=[COL1, y, 80, 22]
    ))
    lines.append(patchline("obj-kdtree-query", 0, "obj-knn-fromsym", 0))

    boxes.append(box(
        "obj-recall-idx", "number",
        numinlets=1, numoutlets=2,
        outlettype=["", "bang"],
        patching_rect=[COL1 + 100, y, 50, 22],
        presentation=1, presentation_rect=[550, 500, 50, 22]
    ))
    lines.append(patchline("obj-knn-fromsym", 0, "obj-recall-idx", 0))
    y += ROW

    # Coll lookup → send to gen~
    boxes.append(box(
        "obj-recall-coll", "newobj",
        text="coll presets",
        numinlets=1, numoutlets=4,
        outlettype=["", "", "int", ""],
        patching_rect=[COL1, y, 120, 22]
    ))
    lines.append(patchline("obj-knn-fromsym", 0, "obj-recall-coll", 0))
    y += ROW

    boxes.append(box(
        "obj-recall-send", "newobj",
        text="s toGen",
        numinlets=1, numoutlets=0,
        patching_rect=[COL1, y, 55, 22]
    ))
    lines.append(patchline("obj-recall-coll", 0, "obj-recall-send", 0))

    boxes.append(box(
        "obj-recall-display", "message",
        text="",
        numinlets=2, numoutlets=1,
        outlettype=[""],
        patching_rect=[COL1 + 80, y, 380, 22],
        presentation=1, presentation_rect=[10, 500, 460, 22]
    ))
    lines.append(patchline("obj-recall-coll", 0, "obj-recall-display", 1))

    # ═══════════════════════════════════════════════════════════════
    # K. MANUAL EXPLORE — direct preset number entry (right column)
    # ═══════════════════════════════════════════════════════════════
    ky = plotter_bottom + GAP

    boxes.append(box(
        "obj-manual-label", "comment",
        text="Manual preset #:", numinlets=1, numoutlets=0,
        patching_rect=[COL2, ky, 110, 22],
        presentation=1, presentation_rect=[10, 530, 110, 22]
    ))
    boxes.append(box(
        "obj-manual-num", "number",
        numinlets=1, numoutlets=2,
        outlettype=["", "bang"],
        minimum=0, maximum=num_presets - 1,
        patching_rect=[COL2 + 120, ky, 50, 22],
        presentation=1, presentation_rect=[120, 530, 50, 22]
    ))
    boxes.append(box(
        "obj-manual-coll", "newobj",
        text="coll presets",
        numinlets=1, numoutlets=4,
        outlettype=["", "", "int", ""],
        patching_rect=[COL2 + 120, ky + ROW, 120, 22]
    ))
    lines.append(patchline("obj-manual-num", 0, "obj-manual-coll", 0))

    boxes.append(box(
        "obj-manual-send", "newobj",
        text="s toGen",
        numinlets=1, numoutlets=0,
        patching_rect=[COL2 + 120, ky + 2 * ROW, 55, 22]
    ))
    lines.append(patchline("obj-manual-coll", 0, "obj-manual-send", 0))

    # ═══════════════════════════════════════════════════════════════
    # WRITE COLL DATA FILE
    # ═══════════════════════════════════════════════════════════════
    coll_file = OUT_FILE.parent / "presets.coll"
    with open(coll_file, "w") as f:
        for idx, att_id, params, label in presets:
            f.write(f"{idx}, {params};\n")
    print(f"  Wrote {coll_file}")

    # ═══════════════════════════════════════════════════════════════
    # ASSEMBLE PATCH
    # ═══════════════════════════════════════════════════════════════
    patch = {
        "patcher": {
            "fileversion": 1,
            "appversion": {
                "major": 8,
                "minor": 6,
                "revision": 0,
                "architecture": "x64",
                "modernui": 1
            },
            "classnamespace": "box",
            "rect": [50, 100, 1200, 900],
            "bglocked": 0,
            "openinpresentation": 1,
            "default_fontsize": 12.0,
            "default_fontface": 0,
            "default_fontname": "Arial",
            "gridonopen": 1,
            "gridsize": [15.0, 15.0],
            "gridsnaponopen": 1,
            "objectsnaponopen": 1,
            "statusbarvisible": 2,
            "toolbarvisible": 1,
            "lefttoolbarpinned": 0,
            "toptoolbarpinned": 0,
            "righttoolbarpinned": 0,
            "bottomtoolbarpinned": 0,
            "toolbars_unpinned_last_save": 0,
            "tallnewobj": 0,
            "boxanimatetime": 200,
            "enablehscroll": 1,
            "enablevscroll": 1,
            "devicewidth": 0.0,
            "description": "",
            "digest": "",
            "tags": "",
            "style": "",
            "subpatcher_template": "",
            "assistshowspatchername": 0,
            "boxes": boxes,
            "lines": lines,
            "dependency_cache": [],
            "autosave": 0
        }
    }

    return patch


def main():
    print("Building sweetspot_explorer.maxpat...")
    patch = build_patch()

    with open(OUT_FILE, "w") as f:
        json.dump(patch, f, indent="\t")

    num_boxes = len(patch["patcher"]["boxes"])
    num_lines = len(patch["patcher"]["lines"])
    print(f"Generated {OUT_FILE}")
    print(f"  {num_boxes} objects, {num_lines} connections")
    print(f"  Open in Max alongside step6_chaos_resonator.maxpat")


if __name__ == "__main__":
    main()
