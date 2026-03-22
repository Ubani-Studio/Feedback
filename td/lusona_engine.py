# Lusona Sand Drawing Engine — Gerdes Mirror-Curve Algorithm
# Cached path generation for efficient per-frame progress updates
# Reference: Paulus Gerdes, "Geometry from Africa", Ch.5

from math import gcd

def _lcm(a, b):
    return a * b // gcd(a, b)

def _zigzag(val, period):
    val = val % period
    half = period // 2
    if val > half:
        val = period - val
    return val

def trace_lusona(rows, cols):
    m, n = rows, cols
    W = 2 * n
    H = 2 * m
    period = _lcm(2 * W, 2 * H)
    raw_pts = []
    for t in range(period):
        x = _zigzag(t, 2 * W)
        y = _zigzag(t + W, 2 * H)
        raw_pts.append((x, y))
    pts = [raw_pts[0]]
    for p in raw_pts[1:]:
        if p != pts[-1]:
            pts.append(p)
    if pts[-1] != pts[0]:
        pts.append(pts[0])
    return pts

def normalize_path(pts, rows, cols, margin=0.08):
    W = 2 * cols
    H = 2 * rows
    scale = 1.0 - 2.0 * margin
    return [(margin + (x / W) * scale, margin + (y / H) * scale) for (x, y) in pts]

PRESETS = [
    ("myombo_2", 3, 4),       # ~48 pts
    ("myombo_3", 4, 5),       # ~80 pts
    ("chased_chicken", 3, 5), # ~60 pts
    ("hunted_bird", 5, 7),    # ~140 pts
    ("lions_stomach", 7, 8),  # ~224 pts
    ("ancestor_tree", 5, 6),  # ~120 pts
]

MAX_PATH = 250

# Cache
_cached_preset = -1
_cached_pts = []
_cached_rows = 0
_cached_cols = 0
_cached_name = ""

def _ensure_cache(preset_idx, margin=0.08):
    global _cached_preset, _cached_pts, _cached_rows, _cached_cols, _cached_name
    preset_idx = preset_idx % len(PRESETS)
    if preset_idx != _cached_preset:
        name, rows, cols = PRESETS[preset_idx]
        raw = trace_lusona(rows, cols)
        _cached_pts = normalize_path(raw, rows, cols, margin)
        _cached_preset = preset_idx
        _cached_rows = rows
        _cached_cols = cols
        _cached_name = name

def generate(preset_idx=3, margin=0.08):
    _ensure_cache(preset_idx, margin)
    _write_table(_cached_pts, len(_cached_pts))
    s = op('/project1/feedback_viz').storage
    s['lusona_name'] = _cached_name
    s['lusona_rows'] = _cached_rows
    s['lusona_cols'] = _cached_cols
    s['lusona_points'] = len(_cached_pts)
    s['lusona_margin'] = margin
    return len(_cached_pts), _cached_rows, _cached_cols, _cached_name

def update_visibility(preset_idx, visible_count, margin=0.08):
    """Fast path: only rewrites table padding, no path regeneration."""
    _ensure_cache(preset_idx, margin)
    pts = _cached_pts
    num_pts = len(pts)
    visible_count = max(2, min(visible_count, num_pts))
    _write_table(pts, visible_count)

    head = pts[visible_count - 1]
    s = op('/project1/feedback_viz').storage
    s['lusona_name'] = _cached_name
    s['lusona_rows'] = _cached_rows
    s['lusona_cols'] = _cached_cols
    s['lusona_points'] = num_pts
    s['lusona_margin'] = margin
    s['lusona_visible'] = visible_count
    s['lusona_head_x'] = head[0]
    s['lusona_head_y'] = head[1]
    return num_pts, _cached_rows, _cached_cols, _cached_name, visible_count

def _write_table(pts, visible_count):
    table = op('lusona_path')
    table.clear()
    table.appendRow(['px', 'py'])
    num_pts = len(pts)
    last_vis = pts[min(visible_count - 1, num_pts - 1)]
    for i in range(MAX_PATH):
        if i < visible_count and i < num_pts:
            table.appendRow([round(pts[i][0], 6), round(pts[i][1], 6)])
        else:
            table.appendRow([round(last_vis[0], 6), round(last_vis[1], 6)])

# Auto-run: generate full hunted_bird
if __name__ != '__main__':
    _ensure_cache(3, 0.08)
    _write_table(_cached_pts, len(_cached_pts))
    s = op('/project1/feedback_viz').storage
    s['lusona_rows'] = _cached_rows
    s['lusona_cols'] = _cached_cols
    s['lusona_points'] = len(_cached_pts)
    print(f"Lusona: {_cached_name} ({_cached_rows}x{_cached_cols}), {len(_cached_pts)} pts")
