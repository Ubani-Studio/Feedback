# Feedback

Six Kuramoto coupled oscillators driven by Vodou veve adjacency matrices, exciting Karplus-Strong resonators tuned to African tuning systems. Visualization via GLSL in TouchDesigner.

## Thesis

Veve are cosmograms. They encode topology — which forces connect to which — not pictures. This instrument uses that topology as its core musical parameter: the adjacency matrix of a veve determines which oscillators couple, and coupling determines synchronization, which determines what you hear.

When oscillators lock phase, energy flows through the connection and the resonator rings. When they drift apart, the connection vibrates at the beat frequency and the string decays. The tuning system sets the intervals. The topology sets the relationships. The performer controls coupling strength, root frequency, decay, and drive.

Nothing is mapped symbolically. The visualization shows what the system is doing: phase alignment as line brightness, phase difference as vibration rate, connection weight as thickness, root frequency as circle size and line weight. White on black. The veve's structure operates directly — it is not illustrated.

## Architecture

```
Max/MSP                              TouchDesigner
─────────                            ─────────────
gen~ (Kuramoto oscillators)          oscinCHOP (port 7000)
  6 oscillators                        ↓
  19 tuning systems                  GLSL TOP (veve_viz)
  13 veve topologies                   phase → brightness
  weighted adjacency via buffer        alignment → line thickness
  ↓                                    weight → line opacity
gen~ (KS resonators)                   root → circle size
  6 heterogeneous strings              octave → size jump
  tanh saturation + analog drift       decay → trail persistence
  octave control (-2 to +2)            excite mode → visual quality
  ↓                                    bloom + feedback trail
nn~ (PERI RAVE)                        ↓
  corpus-flavored excitation         Output
  noise~ → nn~ peri_v1
  toggle: noise / PERI
  ↓
adc~ (mic feedback)
  gate~ → resonator input
  transducer → mic → delay lines
  ↓
8-channel output
  ch 1-2: stereo monitor mix
  ch 3-8: individual resonators → transducer array
  ↓
node.script (osc_send.js)
  UDP OSC → port 7000
```

**OSC channels**: `/kuramoto/phases` (6 floats), `/kuramoto/r` (order parameter), `/veve/preset`, `/resonator/decay`, `/audio/amplitude`, `/root/freq`, `/morph/amount`, `/octave/offset`, `/excite/mode`

## Parameters

| Parameter | Range | Effect |
|-----------|-------|--------|
| Veve | 13 presets | Topology, which oscillators couple and how strongly |
| K (coupling) | 0-5 | Synchronization strength. 0 = free, 0.5-2 = groove, 3+ = locked |
| Root | 20-880 Hz | Base frequency. Low = scaffolding (large, thick). High = rubber band (pinpoint, thin) |
| Octave | -2 to +2 | Integer octave shift. Doubles/halves all resonator frequencies |
| Tuning | 19 systems | Interval ratios between the 6 oscillators |
| Decay | 0-1.5 | KS feedback coefficient. Low = percussive flash. High = sustained drone |
| Drive | 0-1 | Excitation energy + saturation intensity. High = tanh distortion, growling strings |
| Drift | 0-0.01 | Analog component tolerance simulation. Subtle pitch/timing wandering |
| PERI | toggle | Excitation source. Off = white noise, On = RAVE corpus-shaped texture |
| Mic Feedback | toggle + 0-1 | Acoustic feedback from transducer surface. Amount controls blend |
| Morph | 0-1 | Interpolate topology between current veve and morph target |

## Veve Topologies

| # | Name | Source | Topology | Predicted Behavior |
|---|------|--------|----------|-------------------|
| 0 | All-to-all | Standard Kuramoto | Fully connected | Classic Kuramoto lock |
| 1 | Legba Carrefour | Rigaud p.189 | Star (hub + 5 arms) | Leader-follower entrainment |
| 2 | Carrefour Diamond | Rigaud p.206 | Near-complete + peripheral | Core locks, outsider drifts |
| 3 | Ferraille | Rigaud p.266 | V-shape + 3 free | Fractured groove |
| 4 | Ogou Bhathalah | Rigaud p.256 | Zigzag chain | Rolling wave propagation |
| 5 | Legba co-sou | Rigaud p.191 | Ring | Traveling wave cascade |
| 6 | Marassa | Rigaud p.409 | Bridged twin triangles (0.5 bridge) | Polyrhythmic phasing with convergence |
| 7 | Damballah Wedo | Rigaud p.169 | Linear chain | Delay-line ripple |
| 8 | Erzulie Freda | Rigaud p.215 | Heart (two lobes + weak bridge) | Lobes drift then re-sync |
| 9 | Baron Samedi | Rigaud p.579 | Cross + weak diagonals | Ghost rhythms at 40% |
| 10 | Simbi | Rigaud p.404 | Three branches from root (fan/tree) | Rivulet divergence from source |
| 11 | Ayizan | Rigaud p.471 | Spine + branches (weighted 0.7) | Palm-frond sway |
| 12 | Gran Bwa | Rigaud p.585 | Anthropomorphic tree (body hub + root intertwining) | Body dominates, roots pulse |

Presets 6-12 use **weighted adjacency** — connections have strength 0.0-1.0 instead of binary on/off. Weak connections (0.4-0.7) create secondary sync paths that produce ghost rhythms and delayed entrainment.

## Per-Connection Coupling

The gen~ engine reads connection weights from `buffer~ veve_adj` (6x6 float matrix). Each connection multiplies the global K by its weight:

```
coupling_ij = K * weight_ij * sin(phase_j - phase_i)
```

Weight 1.0 = full coupling. Weight 0.4 = ghost coupling. Weight 0 = no connection. The visualization renders weak connections as thinner, dimmer lines.

## Topology Morphing

The Morph parameter interpolates between two adjacency matrices in real-time. The veve_loader writes blended weights to the buffer, and both the audio engine and visualization respond:

Morph 0.0: fully current preset
Morph 0.5: connections forming/breaking, half-states
Morph 1.0: fully target preset

Connections don't snap. They fade in and out as continuous weight values.

## Physical Build

The instrument is designed for physical vibration, not conventional speakers. Six channels of audio should be felt on a surface, not projected into air.

### Recommended: Tactile Transducer Array

Mount 6 tactile transducers on a resonant surface. Each transducer corresponds to one oscillator. Their physical positions should mirror the veve topology — the spatial arrangement IS the veve.

**Transducers** (per unit, need 6)

Dayton Audio TT25-16 (25W, clean for KS tones, ~$10 each)
Clark Synthesis TST329 Gold Transducer (higher fidelity, ~$80 each)
Rolen Star RS-24B (wide bandwidth, ~$90 each)

**Amplification**

6-channel amp: Dayton Audio MA1240a (12-channel, bridgeable) or 3x stereo amps. Per-channel power: 20-50W sufficient for transducers on resonant surface.

**Surfaces** (the surface IS the instrument)

Hardwood panel (oak, maple), 18mm+, warm resonance, sustain
Sheet metal (steel, brass), 1-3mm, bright, metallic harmonics, short decay
Glass panel (tempered, 6mm+), crystalline, fragile aesthetically and literally
Gourd/calabash, traditional, curved resonance, uneven harmonics
Concrete slab, heavy, subharmonic emphasis, brutalist

**Mounting**

Bolt transducers directly to surface underside. Isolation feet (sorbothane pads) underneath to decouple from floor/table. Surface should be free to vibrate. Don't clamp edges unless you want nodal damping.

**Wiring**

8-channel audio interface (e.g. MOTU UltraLite mk5, Focusrite 18i20) → 6-channel amp → 6 transducers. Channels 1-2 for stereo monitoring, channels 3-8 each to one transducer.

### Alternative: Spatial Speaker Array

6 small full-range speakers (Genelec 8010, Auratone 5C, or DIY 3" drivers in sealed boxes) arranged in the veve topology pattern. Suspended or mounted on stands. Less visceral than transducers but more conventional monitoring.

### Minimal: Stereo + Sub

Standard stereo monitoring works for development. The spatial and haptic dimensions are lost but the tonal and rhythmic content is preserved.

## Requirements

Max/MSP 9 (gen~, node.script, nn~ CUDA)
TouchDesigner (GLSL TOP, oscinCHOP)
Node.js (for osc_send.js via node.script)
nn_tilde_cuda package (GPU-accelerated RAVE inference)

## Files

```
max/
  feedback_veve.maxpat     Main patch (all gen~ embedded inline)
  peri_v1.ts               PERI RAVE model (1.58M steps, 43MB)
  veve_loader.js           Preset loader + morph + buffer writer
  osc_send.js              OSC bridge to TouchDesigner
  max_mcp*.js              MCP bridge
td/
  build_veve_viz.py        TD network builder
```

## Usage

1. Open `feedback_veve.maxpat` in Max
2. DSP turns on automatically (ezdac~)
3. OSC starts sending after 3 seconds (loadbang → delay → metro)
4. Open TouchDesigner project with veve_viz network
5. Adjust veve, coupling, root, octave, tuning, decay, drive, drift, morph
6. Toggle PERI for corpus-shaped excitation
7. Toggle Mic + set Feedback amount for transducer feedback loop
