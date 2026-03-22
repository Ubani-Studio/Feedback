# Feedback V2 Directions

## Current State (V1)

Karplus-Strong resonators driven by Kuramoto oscillators through veve adjacency matrices. 19 African tuning systems. 13 veve topologies with weighted adjacency. PERI RAVE excitation. Mic feedback loop. 6-channel transducer output. TD visualization (GLSL shader, trail feedback, bloom).

KS is the right resonator for V1: topology-transparent, simple, stable, honest. The veve structure is audible because the resonator doesn't impose its own personality.

## V2: Modal Resonators

### Why Modal

Modal resonators model objects as sets of resonant modes (frequencies, decays, amplitudes, coupling). Instead of "filtering a tone," they simulate how a body rings. This gives each resonator a **material identity**.

### What Changes

**6 resonators → 6 materials.** Each resonator gets a mode bank defining its physical character:

| Resonator | Material | Character |
|-----------|----------|-----------|
| R1 | Wood (hardwood panel) | Warm, sustaining, fundamental-heavy |
| R2 | Metal (brass/steel) | Bright, long decay, inharmonic partials |
| R3 | Glass (tempered) | Crystalline, fragile, high-frequency shimmer |
| R4 | Membrane (goatskin) | Percussive, pitch-flexible, dampened |
| R5 | Bone/Calabash | Hollow, mid-focused, organic resonance |
| R6 | Stone (concrete/slate) | Heavy, subharmonic emphasis, short decay |

These are starting points. Each material is defined by ~8-16 mode frequencies + decay rates + amplitudes, tuneable in real-time.

### Three Independent Dimensions

**Topology × Material × Tuning System** = the full parameter space.

- **Topology** (veve): Which resonators couple, how strongly. 13 presets + morphing.
- **Material** (mode banks): What each resonator sounds like when excited. 6 presets per resonator or continuous morph between materials.
- **Tuning** (African systems): The pitch ratios between resonators. 19 systems.

These are orthogonal. Legba's star topology connecting wood-hub to metal-arms sounds fundamentally different from Damballah's chain connecting glass→bone→membrane. Same veve, different materials = different instrument. Same materials, different veve = different coupling. Same everything, different tuning = different harmonic world.

### Implementation

**gen~ codebox changes:**

Replace each KS delay line with a bank of damped sinusoidal oscillators:

```
// Per resonator: N modes (8-16 typical)
// mode_freq[n] = partial frequency (Hz)
// mode_decay[n] = decay rate (seconds)
// mode_amp[n] = relative amplitude

for each mode n:
    mode_state[n] *= exp(-1.0 / (mode_decay[n] * samplerate));
    mode_state[n] += excitation * mode_amp[n];
    output += mode_state[n] * sin(mode_phase[n]);
    mode_phase[n] += mode_freq[n] * TWOPI / samplerate;
```

Mode parameters stored in `Data` or `Buffer` objects. Material presets loaded from `veve_loader.js` or similar.

**Coupling changes:**

Instead of `fb_sig` being added directly to all delay lines, coupling between modal resonators means: the output of one resonator excites the modes of connected resonators, weighted by the adjacency matrix. This is physically correct — when two objects touch, vibration transfers between them.

```
coupling_energy = K * weight_ij * resonator_j_output;
resonator_i_excitation += coupling_energy;
```

### Material Morphing

Like topology morphing, material morphing interpolates between two mode banks:

```
Morph 0.0: fully wood
Morph 0.5: wood-metal hybrid (impossible material)
Morph 1.0: fully metal
```

Intermediate materials don't exist physically — they're synthetic bodies with blended resonant properties. This is where it gets interesting.

### Physical Build Implications

With modal resonators, the transducer array becomes more meaningful:

- Mount transducers on **different surfaces** matching each resonator's material
- R1 transducer on hardwood, R2 on brass plate, R3 on glass panel
- The physical surface reinforces the synthesized material character
- Or: all transducers on one surface, and the modal resonator makes that surface sound like different materials

### Performance Parameters (new)

| Parameter | Range | Effect |
|-----------|-------|--------|
| Material | 6 presets per resonator | Which mode bank is active |
| Material Morph | 0-1 | Interpolate between two materials |
| Mode Count | 4-16 | Complexity of resonance (fewer = simpler body) |
| Inharmonicity | 0-1 | Stretch partials away from harmonic series |
| Damping | 0-1 | Overall mode decay scaling |

### Dependencies

- V1 must be stable and performing before V2 work begins
- Modal resonator gen~ code is more CPU-intensive (N modes × 6 resonators × per-sample)
- May need to profile on laptop RTX 4090 / optimize mode count
- Material presets need research: actual measured mode frequencies from real objects, or designed from scratch

### Not V2

- The GLSL visualization doesn't need to change fundamentally
- The trail feedback system works for any resonator type
- The veve topology system is resonator-agnostic
- The tuning system applies to modal resonators the same way (root × ratio × octave)
- PERI excitation works with modal resonators (excitation source is independent of resonator type)
