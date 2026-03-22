# Feedback — Visual Direction: Harmonograph

## Status: Parked (noted as future direction)

## Concept

The Feedback patch IS a harmonograph — 6 coupled Kuramoto oscillators are coupled pendulums. Plot their phase relationships as X/Y coordinates with persistence trail. The polyrhythmic ratios between oscillators draw the figure.

## Why This Works

- **First principles**: Phase portrait of coupled oscillators. No arbitrary mapping.
- **Polyrhythm is visible**: 3:2 cross-rhythm = specific closed curve. 5:4 = different figure. Irrational ratio = space-filling texture.
- **Tuning systems have visual signatures**: Each of the 19 African tuning systems produces a distinct figure because the frequency ratios differ. You can SEE the difference between Slendro and Mbira tuning.
- **Kuramoto sync/desync is visible**: Sync = figure simplifies (pendulums lock into clean geometry). Desync = figure dissolves into chaos.
- **Veve topology shapes the figure**: Which oscillators are coupled determines which phase relationships dominate the drawing.
- **Culturally grounded**: Harmonograph aesthetics + African polyrhythmic ratios + sand-trace metaphor.

## Implementation (when ready)

1. Max sends 6 oscillator phases via OSC (`/phase/0` through `/phase/5`)
2. TD GLSL shader plots current point as X/Y (weighted sum of phase pairs, weights from veve coupling)
3. Feedback TOP retains trail with slow exponential decay (sand being blown away)
4. Color from Kuramoto R — sync = warm/bright, desync = cool/dim
5. Line thickness from amplitude/loudness
6. Veve change = clear the trail, new figure begins

## What It Replaces

- Fake Chladni cymatics (approximate mode numbers) → not needed
- Decorative lusona (preset lookup) → not needed
- The harmonograph IS the piece — one visual system, zero arbitrary mappings

## Why Not Wave Interference

Wave interference from the same 6 oscillators = watching the Max patch literally = oscilloscope with extra steps. The harmonograph shows something you CAN'T hear — the phase-space geometry of the polyrhythm.

## Festival Pitch (one sentence)

"Coupled oscillators in sacred Vodou topologies draw their own polyrhythmic geometry."

## References

- Eglash, "African Fractals" — self-similar scaling, feedback systems
- Gerdes, "Geometry from Africa" — path tracing, geometric algorithms
- Kuramoto model — synchronization of coupled oscillators
- Harmonograph — 19th century drawing machine, pendulum interference figures

## Existing Work (parked)

- Lusona shaders backed up in `~/Feedback/td/` (lusona_distance.glsl, chaos_lusona_composite.glsl, lusona_engine.py, osc_update.py)
- TD project has lusona pipeline built (needs Ctrl+S to save)
- Can be revisited as a secondary layer if desired
