#!/usr/bin/env python3
"""
Attractor Discovery Agent — sweep chaos attractor parameter spaces,
score for musicality, export navigable maps + ready-to-use Max presets.

Matches v5 gen~ codebox equations exactly (4x unrolled Euler).
"""

import json
import time
import numpy as np
from scipy import signal as sig
from pathlib import Path

# ─────────────────────────── constants ───────────────────────────

SR = 48000
DURATION_SAMPLES = 96000        # 2 seconds
WARMUP = 24000                  # discard first 0.5s
ANALYZE_LEN = DURATION_SAMPLES - WARMUP
UNROLL = 4                      # 4x Euler per sample

OUT_DIR = Path(__file__).parent


# ═══════════════════════════════════════════════════════════════════
# 1. ATTRACTOR SIMULATORS  (vectorized across parameter combos)
# ═══════════════════════════════════════════════════════════════════

def simulate_lorenz(rho_vals, sigma_vals):
    """Lorenz: swept rho x sigma. Returns (N, ANALYZE_LEN) x-channel."""
    rho_g, sigma_g = np.meshgrid(rho_vals, sigma_vals, indexing="ij")
    rho = rho_g.ravel()
    sigma = sigma_g.ravel()
    N = len(rho)
    beta = np.full(N, 2.667)
    dt = 0.0012

    lx = np.full(N, 0.1)
    ly = np.zeros(N)
    lz = np.zeros(N)

    out = np.empty((N, ANALYZE_LEN), dtype=np.float32)
    idx = 0

    for s in range(DURATION_SAMPLES):
        for _ in range(UNROLL):
            dx = sigma * (ly - lx)
            dy = lx * (rho - lz) - ly
            dz = lx * ly - beta * lz
            lx += dx * dt
            ly += dy * dt
            lz += dz * dt

        lx = np.clip(lx, -100, 100)
        ly = np.clip(ly, -100, 100)
        lz = np.clip(lz, -100, 100)

        if s >= WARMUP:
            out[:, idx] = lx * 0.05
            idx += 1

    params = [{"attractor": "lorenz", "rho": float(r), "sigma": float(sg)}
              for r, sg in zip(rho, sigma)]
    return out, params


def simulate_rossler(c_vals):
    """Rossler: swept ross_c. Returns (N, ANALYZE_LEN) x-channel."""
    N = len(c_vals)
    c = np.array(c_vals, dtype=np.float64)
    dt = 0.006

    rx = np.ones(N)
    ry = np.zeros(N)
    rz = np.zeros(N)

    out = np.empty((N, ANALYZE_LEN), dtype=np.float32)
    idx = 0

    for s in range(DURATION_SAMPLES):
        for _ in range(UNROLL):
            dx = -(ry + rz)
            dy = rx + 0.2 * ry
            dz = 0.2 + rz * (rx - c)
            rx += dx * dt
            ry += dy * dt
            rz += dz * dt

        rx = np.clip(rx, -100, 100)
        ry = np.clip(ry, -100, 100)
        rz = np.clip(rz, -100, 100)

        if s >= WARMUP:
            out[:, idx] = rx * 0.08
            idx += 1

    params = [{"attractor": "rossler", "ross_c": float(v)} for v in c_vals]
    return out, params


def simulate_chua(alpha_vals):
    """Chua: swept chua_alpha. Returns (N, ANALYZE_LEN) x-channel."""
    N = len(alpha_vals)
    alpha = np.array(alpha_vals, dtype=np.float64)
    beta_c = 28.0
    dt = 0.0012

    cx = np.full(N, 0.1)
    cy = np.zeros(N)
    cz = np.zeros(N)

    out = np.empty((N, ANALYZE_LEN), dtype=np.float32)
    idx = 0

    for s in range(DURATION_SAMPLES):
        for _ in range(UNROLL):
            h = -0.714 * cx + 0.5 * (-0.429) * (np.abs(cx + 1) - np.abs(cx - 1))
            dx = alpha * (cy - cx - h)
            dy = cx - cy + cz
            dz = -beta_c * cy
            cx += dx * dt
            cy += dy * dt
            cz += dz * dt

        cx = np.clip(cx, -10, 10)
        cy = np.clip(cy, -3, 3)
        cz = np.clip(cz, -20, 20)

        if s >= WARMUP:
            out[:, idx] = cx * 0.4
            idx += 1

    params = [{"attractor": "chua", "chua_alpha": float(v)} for v in alpha_vals]
    return out, params


def simulate_halvorsen(a_vals):
    """Halvorsen: swept halv_a. Returns (N, ANALYZE_LEN) x-channel."""
    N = len(a_vals)
    a = np.array(a_vals, dtype=np.float64)
    dt = 0.005

    hx = np.ones(N)
    hy = np.zeros(N)
    hz = np.zeros(N)

    out = np.empty((N, ANALYZE_LEN), dtype=np.float32)
    idx = 0

    for s in range(DURATION_SAMPLES):
        for _ in range(UNROLL):
            dx = -a * hx - 4 * hy - 4 * hz - hy * hy
            dy = -a * hy - 4 * hz - 4 * hx - hz * hz
            dz = -a * hz - 4 * hx - 4 * hy - hx * hx
            hx += dx * dt
            hy += dy * dt
            hz += dz * dt

        hx = np.clip(hx, -20, 20)
        hy = np.clip(hy, -20, 20)
        hz = np.clip(hz, -20, 20)

        if s >= WARMUP:
            out[:, idx] = hx * 0.1
            idx += 1

    params = [{"attractor": "halvorsen", "halv_a": float(v)} for v in a_vals]
    return out, params


def simulate_aizawa(c_vals, d_vals):
    """Aizawa: swept aiz_c x aiz_d. Returns (N, ANALYZE_LEN) x-channel."""
    c_g, d_g = np.meshgrid(c_vals, d_vals, indexing="ij")
    c = c_g.ravel()
    d = d_g.ravel()
    N = len(c)
    dt = 0.006

    ax = np.full(N, 0.1)
    ay = np.zeros(N)
    az = np.zeros(N)

    out = np.empty((N, ANALYZE_LEN), dtype=np.float32)
    idx = 0

    for s in range(DURATION_SAMPLES):
        for _ in range(UNROLL):
            dx = (az - 0.7) * ax - d * ay
            dy = d * ax + (az - 0.7) * ay
            r2 = ax * ax + ay * ay
            dz = c + 0.95 * az - az**3 / 3.0 - r2 * (1.0 + 0.25 * az) + 0.1 * az * ax**3
            ax += dx * dt
            ay += dy * dt
            az += dz * dt

        ax = np.clip(ax, -3, 3)
        ay = np.clip(ay, -3, 3)
        az = np.clip(az, -3, 3)

        if s >= WARMUP:
            out[:, idx] = ax * 0.7
            idx += 1

    params = [{"attractor": "aizawa", "aiz_c": float(cv), "aiz_d": float(dv)}
              for cv, dv in zip(c, d)]
    return out, params


# ═══════════════════════════════════════════════════════════════════
# 2. MUSICALITY ANALYSIS
# ═══════════════════════════════════════════════════════════════════

def analyze_batch(signals):
    """Analyze (N, ANALYZE_LEN) signal batch. Returns list of metric dicts."""
    N = signals.shape[0]
    results = []

    for i in range(N):
        x = signals[i].astype(np.float64)
        metrics = {}

        # RMS energy
        rms = np.sqrt(np.mean(x**2))
        metrics["rms"] = float(rms)

        # Clamped fraction — how much time at rail
        peak = np.max(np.abs(x))
        if peak > 0:
            clamped = np.mean(np.abs(x) > peak * 0.98)
        else:
            clamped = 0.0
        metrics["clamped_frac"] = float(clamped)

        # Gate out silence
        if rms < 1e-4:
            metrics.update(spectral_flatness=0.0, quasi_periodicity=0.0,
                           dominant_freq=0.0, peak_prominence=0.0,
                           score=0.0, classification="silent")
            results.append(metrics)
            continue

        # ─── Spectral analysis ───
        freqs, psd = sig.welch(x, fs=SR, nperseg=2048, noverlap=1024)
        audible = (freqs >= 20) & (freqs <= 20000)
        psd_aud = psd[audible]
        freqs_aud = freqs[audible]

        # Spectral flatness — restrict to audible, floor at -60dB of max
        if len(psd_aud) > 0 and np.max(psd_aud) > 0:
            floor = np.max(psd_aud) * 1e-6
            psd_floored = np.maximum(psd_aud, floor)
            log_mean = np.exp(np.mean(np.log(psd_floored)))
            arith_mean = np.mean(psd_floored)
            spectral_flatness = float(log_mean / arith_mean)
        else:
            spectral_flatness = 0.0
        metrics["spectral_flatness"] = spectral_flatness

        # Spectral centroid
        total_power = np.sum(psd_aud)
        centroid = float(np.sum(freqs_aud * psd_aud) / total_power) if total_power > 0 else 0.0
        metrics["spectral_centroid"] = centroid

        # Number of spectral peaks (>6dB above local median in 128-bin windows)
        n_peaks = 0
        if len(psd_aud) > 32:
            win = 64
            for j in range(0, len(psd_aud) - win, win // 2):
                chunk = psd_aud[j:j + win]
                local_med = np.median(chunk)
                if local_med > 0:
                    n_peaks += int(np.sum(chunk > local_med * 4))  # 6dB ≈ 4x power
        metrics["n_peaks"] = n_peaks

        # ─── Autocorrelation periodicity (FFT-based) ───
        x_centered = x - np.mean(x)
        norm = np.dot(x_centered, x_centered)
        if norm > 0:
            n_fft = 2 ** int(np.ceil(np.log2(2 * len(x_centered))))
            X = np.fft.rfft(x_centered, n=n_fft)
            acorr_full = np.fft.irfft(X * np.conj(X))[:len(x_centered)]
            acorr_full /= norm

            min_lag = SR // 2000   # 24
            max_lag = SR // 20     # 2400
            max_lag = min(max_lag, len(acorr_full) - 1)
            if min_lag < max_lag:
                acorr_region = acorr_full[min_lag:max_lag]
                quasi_periodicity = float(np.max(acorr_region))
                best_lag = int(np.argmax(acorr_region)) + min_lag
                dominant_freq = float(SR / best_lag)
            else:
                quasi_periodicity = 0.0
                dominant_freq = 0.0
        else:
            quasi_periodicity = 0.0
            dominant_freq = 0.0
        metrics["quasi_periodicity"] = quasi_periodicity
        metrics["dominant_freq"] = dominant_freq

        # ─── Crest factor (peak/RMS) — transient-rich = good for waveguide ───
        crest = float(np.max(np.abs(x)) / (rms + 1e-30))
        metrics["crest_factor"] = crest

        # ─── Envelope variation — compute RMS in windows, take CV ───
        win_size = SR // 20  # 50ms windows
        n_wins = len(x) // win_size
        if n_wins >= 2:
            env = np.array([np.sqrt(np.mean(x[j*win_size:(j+1)*win_size]**2))
                            for j in range(n_wins)])
            env_mean = np.mean(env)
            env_cv = float(np.std(env) / (env_mean + 1e-30))  # coefficient of variation
        else:
            env_cv = 0.0
        metrics["envelope_cv"] = env_cv

        # ─── Peak prominence — strongest peak vs local floor ───
        if len(psd_aud) > 0 and np.median(psd_aud) > 0:
            peak_val = np.max(psd_aud)
            median_val = np.median(psd_aud)
            ratio = peak_val / median_val
            peak_prominence = float(np.log10(max(ratio, 1.0)))
            peak_prominence = min(peak_prominence / 3.0, 1.0)
        else:
            peak_prominence = 0.0
        metrics["peak_prominence"] = peak_prominence

        # ═══════════════════════════════════
        # SCORING (0-100)
        # ═══════════════════════════════════

        # Energy gate
        if clamped > 0.5:
            energy_gate = 0.2
        elif rms < 0.005:
            energy_gate = 0.2
        elif rms > 3.0:
            energy_gate = 0.5
        else:
            energy_gate = 1.0

        # 1. Spectral complexity (0-1) — structured chaos preferred
        if spectral_flatness < 0.1:
            spec_score = spectral_flatness / 0.1 * 0.3
        elif spectral_flatness <= 0.7:
            spec_score = 0.3 + 0.7 * (spectral_flatness - 0.1) / 0.6
        else:
            spec_score = max(0.0, 1.0 - (spectral_flatness - 0.7) / 0.3)

        # 2. Harmonic richness (0-1) — number of spectral peaks
        harm_score = min(1.0, n_peaks / 30.0)

        # 3. Quasi-periodicity (0-1) — some repetition = musical
        qp_score = min(1.0, quasi_periodicity / 0.3) if quasi_periodicity > 0.01 else 0.0

        # 4. Peak structure (0-1)
        pk_score = peak_prominence

        # 5. Crest factor (0-1) — transient richness, sweet spot 3-15
        if crest < 2:
            cf_score = crest / 2.0 * 0.3
        elif crest <= 15:
            cf_score = 0.3 + 0.7 * (crest - 2) / 13.0
        else:
            cf_score = max(0.0, 1.0 - (crest - 15) / 20.0)

        # 6. Envelope variation (0-1) — dynamic = interesting
        ev_score = min(1.0, env_cv / 0.5)

        # 7. Energy quality (0-1) — usable amplitude range
        if 0.05 <= rms <= 2.0:
            eq_score = 1.0
        elif rms > 2.0:
            eq_score = max(0.0, 1.0 - (rms - 2.0) / 3.0)
        else:
            eq_score = min(1.0, rms / 0.05)

        score = energy_gate * (
            spec_score * 20 +       # spectral complexity
            harm_score * 15 +       # harmonic richness
            qp_score * 15 +         # quasi-periodicity
            pk_score * 10 +         # peak structure
            cf_score * 15 +         # crest factor
            ev_score * 15 +         # envelope variation
            eq_score * 10           # energy quality
        )
        score = min(100.0, max(0.0, score))
        metrics["score"] = float(round(score, 1))

        # Classification — score takes priority over periodicity
        if rms < 1e-4:
            cls = "silent"
        elif spectral_flatness > 0.9:
            cls = "noise"
        elif score >= 55:
            cls = "sweetspot"
        elif quasi_periodicity > 0.6 and spectral_flatness < 0.1:
            cls = "periodic"
        elif score >= 30:
            cls = "chaotic"
        else:
            cls = "marginal"
        metrics["classification"] = cls

        results.append(metrics)

    return results


# ═══════════════════════════════════════════════════════════════════
# 3. RUN ALL SWEEPS
# ═══════════════════════════════════════════════════════════════════

def run_all():
    all_results = []
    t0 = time.time()

    # Lorenz: rho [20-200] x sigma [1-50], 40 x 8 = 320
    print("Lorenz (320 combos)...", flush=True)
    rho_vals = np.linspace(20, 200, 40)
    sigma_vals = np.linspace(1, 50, 8)
    sigs, params = simulate_lorenz(rho_vals, sigma_vals)
    metrics = analyze_batch(sigs)
    for p, m in zip(params, metrics):
        all_results.append({**p, **m})
    del sigs
    print(f"  done ({time.time()-t0:.1f}s)")

    # Rossler: ross_c [1-20], 60
    print("Rossler (60 combos)...", flush=True)
    c_vals = np.linspace(1, 20, 60)
    sigs, params = simulate_rossler(c_vals)
    metrics = analyze_batch(sigs)
    for p, m in zip(params, metrics):
        all_results.append({**p, **m})
    del sigs
    print(f"  done ({time.time()-t0:.1f}s)")

    # Chua: chua_alpha [5-30], 60
    print("Chua (60 combos)...", flush=True)
    alpha_vals = np.linspace(5, 30, 60)
    sigs, params = simulate_chua(alpha_vals)
    metrics = analyze_batch(sigs)
    for p, m in zip(params, metrics):
        all_results.append({**p, **m})
    del sigs
    print(f"  done ({time.time()-t0:.1f}s)")

    # Halvorsen: halv_a [0.5-5], 60
    print("Halvorsen (60 combos)...", flush=True)
    a_vals = np.linspace(0.5, 5, 60)
    sigs, params = simulate_halvorsen(a_vals)
    metrics = analyze_batch(sigs)
    for p, m in zip(params, metrics):
        all_results.append({**p, **m})
    del sigs
    print(f"  done ({time.time()-t0:.1f}s)")

    # Aizawa: aiz_c [0.1-2] x aiz_d [1-10], 30 x 20 = 600
    print("Aizawa (600 combos)...", flush=True)
    c_vals = np.linspace(0.1, 2, 30)
    d_vals = np.linspace(1, 10, 20)
    sigs, params = simulate_aizawa(c_vals, d_vals)
    metrics = analyze_batch(sigs)
    for p, m in zip(params, metrics):
        all_results.append({**p, **m})
    del sigs
    print(f"  done ({time.time()-t0:.1f}s)")

    print(f"\nTotal: {len(all_results)} combos in {time.time()-t0:.1f}s")
    return all_results


# ═══════════════════════════════════════════════════════════════════
# 4. OUTPUT: JSON, PRESETS, PLOTS
# ═══════════════════════════════════════════════════════════════════

def save_results(results):
    # ── results.json ──
    with open(OUT_DIR / "results.json", "w") as f:
        json.dump(results, f, indent=1)
    print(f"Saved results.json ({len(results)} entries)")

    # ── presets.txt ──
    att_index = {"lorenz": 0, "rossler": 1, "chua": 2, "halvorsen": 3, "aizawa": 4}
    lines = []
    for att_name in ["lorenz", "rossler", "chua", "halvorsen", "aizawa"]:
        group = [r for r in results if r["attractor"] == att_name]
        group.sort(key=lambda r: r["score"], reverse=True)
        top = group[:10]
        lines.append(f"# ─── {att_name.upper()} top {len(top)} (score range: "
                      f"{top[-1]['score']:.0f}-{top[0]['score']:.0f}) ───")
        for r in top:
            idx = att_index[att_name]
            parts = [f"att_sel {idx}"]
            if att_name == "lorenz":
                parts += [f"rho {r['rho']:.1f}", f"sigma {r['sigma']:.1f}"]
            elif att_name == "rossler":
                parts += [f"ross_c {r['ross_c']:.2f}"]
            elif att_name == "chua":
                parts += [f"chua_alpha {r['chua_alpha']:.1f}"]
            elif att_name == "halvorsen":
                parts += [f"halv_a {r['halv_a']:.2f}"]
            elif att_name == "aizawa":
                parts += [f"aiz_c {r['aiz_c']:.2f}", f"aiz_d {r['aiz_d']:.2f}"]
            comment = f"  # score={r['score']:.0f} {r['classification']}"
            msg = ", ".join(parts)
            lines.append(msg + comment)
        lines.append("")

    with open(OUT_DIR / "presets.txt", "w") as f:
        f.write("\n".join(lines))
    print(f"Saved presets.txt ({sum(1 for l in lines if not l.startswith('#') and l.strip())} presets)")


def plot_results(results):
    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt

    # ── Lorenz 2D heatmap: rho vs sigma ──
    lor = [r for r in results if r["attractor"] == "lorenz"]
    rhos = sorted(set(r["rho"] for r in lor))
    sigmas = sorted(set(r["sigma"] for r in lor))
    grid = np.zeros((len(rhos), len(sigmas)))
    for r in lor:
        ri = rhos.index(r["rho"])
        si = sigmas.index(r["sigma"])
        grid[ri, si] = r["score"]

    fig, ax = plt.subplots(figsize=(10, 7))
    im = ax.imshow(grid.T, origin="lower", aspect="auto",
                   extent=[rhos[0], rhos[-1], sigmas[0], sigmas[-1]],
                   cmap="magma", vmin=0, vmax=100)
    ax.set_xlabel("rho")
    ax.set_ylabel("sigma")
    ax.set_title("Lorenz Musicality Score")
    plt.colorbar(im, ax=ax, label="Score")
    fig.tight_layout()
    fig.savefig(OUT_DIR / "lorenz_rho_sigma.png", dpi=150)
    plt.close(fig)
    print("Saved lorenz_rho_sigma.png")

    # ── 1D charts: Rossler, Chua, Halvorsen ──
    for att_name, param_key, xlabel in [
        ("rossler", "ross_c", "ross_c"),
        ("chua", "chua_alpha", "chua_alpha"),
        ("halvorsen", "halv_a", "halv_a"),
    ]:
        group = [r for r in results if r["attractor"] == att_name]
        group.sort(key=lambda r: r[param_key])
        xs = [r[param_key] for r in group]
        ys = [r["score"] for r in group]
        cls = [r["classification"] for r in group]

        fig, ax = plt.subplots(figsize=(10, 4))
        colors = {"silent": "#333", "noise": "#c44", "periodic": "#4a4",
                  "sweetspot": "#fa0", "chaotic": "#88f", "marginal": "#888"}
        for x, y, c in zip(xs, ys, cls):
            ax.bar(x, y, width=(xs[-1] - xs[0]) / len(xs) * 0.8,
                   color=colors.get(c, "#888"), edgecolor="none")
        ax.set_xlabel(xlabel)
        ax.set_ylabel("Score")
        ax.set_title(f"{att_name.capitalize()} Musicality Score")
        ax.set_ylim(0, 100)
        # Legend
        from matplotlib.patches import Patch
        handles = [Patch(color=colors[k], label=k)
                   for k in ["sweetspot", "chaotic", "periodic", "noise", "marginal", "silent"]
                   if any(c == k for c in cls)]
        if handles:
            ax.legend(handles=handles, loc="upper right", fontsize=8)
        fig.tight_layout()
        fig.savefig(OUT_DIR / f"{att_name}_{param_key.split('_')[-1]}.png", dpi=150)
        plt.close(fig)
        print(f"Saved {att_name}_{param_key.split('_')[-1]}.png")

    # ── Aizawa 2D heatmap: aiz_c vs aiz_d ──
    aiz = [r for r in results if r["attractor"] == "aizawa"]
    cs = sorted(set(r["aiz_c"] for r in aiz))
    ds = sorted(set(r["aiz_d"] for r in aiz))
    grid = np.zeros((len(cs), len(ds)))
    for r in aiz:
        ci = cs.index(r["aiz_c"])
        di = ds.index(r["aiz_d"])
        grid[ci, di] = r["score"]

    fig, ax = plt.subplots(figsize=(10, 7))
    im = ax.imshow(grid.T, origin="lower", aspect="auto",
                   extent=[cs[0], cs[-1], ds[0], ds[-1]],
                   cmap="magma", vmin=0, vmax=100)
    ax.set_xlabel("aiz_c")
    ax.set_ylabel("aiz_d")
    ax.set_title("Aizawa Musicality Score")
    plt.colorbar(im, ax=ax, label="Score")
    fig.tight_layout()
    fig.savefig(OUT_DIR / "aizawa_c_d.png", dpi=150)
    plt.close(fig)
    print("Saved aizawa_c_d.png")


# ═══════════════════════════════════════════════════════════════════
# 5. SUMMARY
# ═══════════════════════════════════════════════════════════════════

def print_summary(results):
    print("\n" + "=" * 60)
    print("DISCOVERY SUMMARY")
    print("=" * 60)

    for att in ["lorenz", "rossler", "chua", "halvorsen", "aizawa"]:
        group = [r for r in results if r["attractor"] == att]
        by_cls = {}
        for r in group:
            by_cls.setdefault(r["classification"], []).append(r)

        best = max(group, key=lambda r: r["score"])
        n_sweet = len(by_cls.get("sweetspot", []))

        print(f"\n{att.upper()} ({len(group)} combos)")
        print(f"  Sweetspots: {n_sweet}  |  Best score: {best['score']:.0f}")
        cls_counts = "  ".join(f"{k}:{len(v)}" for k, v in sorted(by_cls.items()))
        print(f"  {cls_counts}")

        # Show top 3
        top3 = sorted(group, key=lambda r: r["score"], reverse=True)[:3]
        for r in top3:
            p = {k: round(v, 2) if isinstance(v, float) else v
                 for k, v in r.items()
                 if k not in ("attractor", "score", "classification",
                              "rms", "clamped_frac", "spectral_flatness",
                              "quasi_periodicity", "dominant_freq",
                              "peak_prominence", "spectral_centroid",
                              "n_peaks", "crest_factor", "envelope_cv")}
            print(f"    {r['score']:5.1f}  {r['classification']:10s}  {p}")


# ═══════════════════════════════════════════════════════════════════
# MAIN
# ═══════════════════════════════════════════════════════════════════

if __name__ == "__main__":
    print("Attractor Discovery Agent")
    print(f"Sweeping 1100 parameter combos × {DURATION_SAMPLES} samples each")
    print(f"Output directory: {OUT_DIR}\n")

    results = run_all()
    save_results(results)
    plot_results(results)
    print_summary(results)

    total_sweet = sum(1 for r in results if r["classification"] == "sweetspot")
    print(f"\n{'=' * 60}")
    print(f"DONE — {total_sweet} sweetspots found across all attractors")
    print(f"Presets ready to paste into Max: {OUT_DIR / 'presets.txt'}")
