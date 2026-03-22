// ============================================
// SWARM POLYPHONY ENGINE — Reynolds Boids
// Project 4: Emergent Ensemble
// Phase 5, Step 5.1
// ============================================
//
// Autonomous agents moving through Yoruba pentatonic
// pitch-time space. Three rules produce emergent polyphony:
//   Separation: don't crowd (melodic spacing)
//   Alignment:  match neighbors (parallel motion)
//   Cohesion:   steer toward group (cluster/chord)
//
// When an agent crosses a pitch gridline → NOTE EVENT.
// The gridlines follow Yoruba pentatonic intervals (unequal).
// Wider gaps (300 cents) crossed less often = natural phrasing.
//
// USE IN MAX:
//   [metro 10] → [js swarm.js] → outlets below
//
//   Outlet 0: note events [voice_id, frequency, velocity]
//             → route to [poly~ resonator_voice 6] or individual resonators
//   Outlet 1: positions [agent_count, x0, y0, x1, y1, ...]
//             → [udpsend] as OSC /swarm/positions for TD
//   Outlet 2: metrics [density, spread, order]
//             → [udpsend] as OSC /swarm/metrics for TD
//   Outlet 3: trigger flash [agent_id, x, y]
//             → [udpsend] as OSC /swarm/trigger for TD flash
//
// PARAMETER MESSAGES (send to inlet 0):
//   set_agents N            set agent count (re-initializes)
//   separation 0.5         separation weight (0-1)
//   alignment 0.3          alignment weight (0-1)
//   cohesion 0.5           cohesion weight (0-1)
//   maxspeed 0.05          max velocity per frame
//   neighborhood 5.0       neighborhood radius (Y units)
//   root 110               root frequency (Hz)
//   flex 0.5               Yoruba tuning flex (0=Pythagorean, 1=just)
//   octaves 3              pitch range in octaves
//   gate_mode 0            0=free, 1=Kuramoto gated (needs inlet bang timing)
//   preset scatter         load parameter preset
//   preset flock
//   preset cluster
//   preset callresponse
//   preset swarming
//   reset                  re-initialize all agents
//
// ============================================

autowatch = 1;  // Reload on save (dev convenience)
inlets = 2;     // 0: bang (metro) + messages, 1: Kuramoto gate
outlets = 4;    // 0: notes, 1: positions, 2: metrics, 3: trigger flash

// =====================
// CONFIGURATION
// =====================

var NUM_AGENTS = 10;
var NUM_VOICES = 6;        // Resonator count (agents are allocated round-robin)
var NUM_OCTAVES = 3;
var OCTAVE_Y_SIZE = 12;    // Y-units per octave (matches Yoruba pentatonic spacing)

// Yoruba pentatonic grid pattern within one octave (in Y-units)
// Intervals: 200, 200, 300, 200, 300 cents
// Mapped to: 2, 2, 3, 2, 3 Y-units
var GRID_PATTERN = [0, 2, 4, 7, 9];

// Precompute all gridlines across all octaves
var ALL_GRIDLINES = [];
var TOTAL_GRIDLINES = 0;

function build_gridlines() {
    ALL_GRIDLINES = [];
    for (var oct = 0; oct < NUM_OCTAVES; oct++) {
        for (var i = 0; i < GRID_PATTERN.length; i++) {
            ALL_GRIDLINES.push(oct * OCTAVE_Y_SIZE + GRID_PATTERN[i]);
        }
    }
    // Add final octave root
    ALL_GRIDLINES.push(NUM_OCTAVES * OCTAVE_Y_SIZE);
    TOTAL_GRIDLINES = ALL_GRIDLINES.length;
}

// =====================
// PARAMETERS
// =====================

var sep_weight = 0.5;       // Separation: melodic spacing
var ali_weight = 0.3;       // Alignment: parallel motion
var coh_weight = 0.5;       // Cohesion: density / clustering
var max_speed = 0.05;       // Max velocity per frame
var neighborhood_r = 5.0;   // Neighborhood radius (Y-units)
var root_freq = 110;        // Root frequency (Hz)
var flex = 0.5;             // Yoruba tuning flex
var gate_mode = 0;          // 0=free running, 1=Kuramoto gated
var gate_open = 1;          // Current gate state (always open if gate_mode=0)

// =====================
// TUNING
// =====================

function yoruba_ratio(step) {
    // Pythagorean ratios
    var pyth = [1.0, 1.125, 1.265625, 1.5, 1.6875];
    // Just intonation ratios
    var just = [1.0, 10.0/9.0, 5.0/4.0, 1.5, 5.0/3.0];
    // Interpolate
    return pyth[step] * (1.0 - flex) + just[step] * flex;
}

function degree_to_freq(degree) {
    if (degree < 0) degree = 0;
    if (degree >= TOTAL_GRIDLINES) degree = TOTAL_GRIDLINES - 1;
    var octave = Math.floor(degree / 5);
    var step = degree % 5;
    return root_freq * Math.pow(2, octave) * yoruba_ratio(step);
}

// =====================
// SNAP TO GRID
// =====================

function snap_to_gridline(y) {
    // Returns the degree index (0 to TOTAL_GRIDLINES-1)
    // of the nearest Yoruba pentatonic gridline
    var min_dist = 999999;
    var nearest_idx = 0;
    for (var i = 0; i < TOTAL_GRIDLINES; i++) {
        var d = Math.abs(y - ALL_GRIDLINES[i]);
        if (d < min_dist) {
            min_dist = d;
            nearest_idx = i;
        }
    }
    return nearest_idx;
}

// =====================
// AGENTS
// =====================

var swarm_agents = [];

function Agent(id) {
    this.id = id;
    this.voice = id % NUM_VOICES;  // Round-robin resonator assignment
    // Spread agents across pitch-time space
    this.x = Math.random();  // 0-1 rhythmic position
    this.y = Math.random() * OCTAVE_Y_SIZE * NUM_OCTAVES;
    this.vx = (Math.random() - 0.5) * 0.01;
    this.vy = (Math.random() - 0.5) * 0.01;
    this.prev_degree = snap_to_gridline(this.y);
}

function init_agents() {
    swarm_agents = [];
    for (var i = 0; i < NUM_AGENTS; i++) {
        swarm_agents.push(new Agent(i));
    }
    post("swarm: initialized " + NUM_AGENTS + " agents, "
         + TOTAL_GRIDLINES + " gridlines across "
         + NUM_OCTAVES + " octaves\n");
}

// =====================
// BOIDS FORCES
// =====================

function update_swarm() {
    var pitch_max = OCTAVE_Y_SIZE * NUM_OCTAVES;

    for (var i = 0; i < swarm_agents.length; i++) {
        var a = swarm_agents[i];
        var sep_x = 0, sep_y = 0;
        var ali_x = 0, ali_y = 0;
        var coh_x = 0, coh_y = 0;
        var n_count = 0;

        for (var j = 0; j < swarm_agents.length; j++) {
            if (i === j) continue;
            var b = swarm_agents[j];

            // X distance with wraparound (rhythmic cycle)
            var dx = a.x - b.x;
            if (dx > 0.5) dx -= 1.0;
            if (dx < -0.5) dx += 1.0;

            var dy = a.y - b.y;
            var dist = Math.sqrt(dx * dx + dy * dy);

            if (dist < neighborhood_r && dist > 0.001) {
                // SEPARATION: push away, inverse-square falloff
                var inv_d2 = 1.0 / (dist * dist);
                sep_x += dx * inv_d2;
                sep_y += dy * inv_d2;

                // ALIGNMENT: accumulate neighbor velocities
                ali_x += b.vx;
                ali_y += b.vy;

                // COHESION: accumulate neighbor positions
                coh_x += b.x;
                coh_y += b.y;

                n_count++;
            }
        }

        if (n_count > 0) {
            // Average alignment → steer toward average direction
            ali_x = ali_x / n_count - a.vx;
            ali_y = ali_y / n_count - a.vy;

            // Cohesion → steer toward center of neighbors
            coh_x = coh_x / n_count - a.x;
            coh_y = coh_y / n_count - a.y;
        }

        // --- Combined acceleration ---
        var accel_scale = 0.01;
        a.vx += (sep_x * sep_weight + ali_x * ali_weight + coh_x * coh_weight) * accel_scale;
        a.vy += (sep_y * sep_weight + ali_y * ali_weight + coh_y * coh_weight) * accel_scale;

        // --- Speed limit ---
        var speed = Math.sqrt(a.vx * a.vx + a.vy * a.vy);
        if (speed > max_speed) {
            a.vx *= max_speed / speed;
            a.vy *= max_speed / speed;
            speed = max_speed;
        }

        // --- Update position ---
        a.x += a.vx;
        a.y += a.vy;

        // --- Wrap X (rhythmic cycle 0-1) ---
        a.x = a.x - Math.floor(a.x);

        // --- Bounce Y at pitch boundaries ---
        if (a.y < 0) {
            a.y = -a.y;
            a.vy = Math.abs(a.vy) * 0.8;
        }
        if (a.y > pitch_max) {
            a.y = 2 * pitch_max - a.y;
            a.vy = -Math.abs(a.vy) * 0.8;
        }

        // --- Pitch gridline crossing → NOTE EVENT ---
        var current_degree = snap_to_gridline(a.y);

        if (current_degree !== a.prev_degree) {
            // Gate check: in gate mode, only trigger if gate is open
            if (gate_mode === 0 || gate_open) {
                var freq = degree_to_freq(current_degree);
                var velocity = Math.min(speed / max_speed, 1.0);

                // Outlet 0: target + note data for poly~
                // poly~ voices are 1-indexed
                outlet(0, "target", a.voice + 1);
                outlet(0, freq, velocity);

                // Outlet 3: trigger flash for TD [agent_id, x_pos, y_pos]
                outlet(3, a.id, a.x, a.y);
            }
            a.prev_degree = current_degree;
        }
    }
}

// =====================
// METRICS
// =====================

function compute_metrics() {
    if (swarm_agents.length === 0) return;

    // Center of mass
    var cx = 0, cy = 0;
    for (var i = 0; i < swarm_agents.length; i++) {
        cx += swarm_agents[i].x;
        cy += swarm_agents[i].y;
    }
    cx /= swarm_agents.length;
    cy /= swarm_agents.length;

    // Spread (average distance from center)
    var spread = 0;
    for (var i = 0; i < swarm_agents.length; i++) {
        var dx = swarm_agents[i].x - cx;
        var dy = swarm_agents[i].y - cy;
        spread += Math.sqrt(dx * dx + dy * dy);
    }
    spread /= swarm_agents.length;

    // Density (inverse of spread, normalized 0-1)
    var max_spread = Math.sqrt(0.25 + Math.pow(OCTAVE_Y_SIZE * NUM_OCTAVES * 0.5, 2));
    var density = 1.0 - Math.min(spread / max_spread, 1.0);

    // Velocity alignment (like Kuramoto order parameter but for direction)
    var sum_vx = 0, sum_vy = 0;
    for (var i = 0; i < swarm_agents.length; i++) {
        var sp = Math.sqrt(swarm_agents[i].vx * swarm_agents[i].vx + swarm_agents[i].vy * swarm_agents[i].vy);
        if (sp > 0.0001) {
            sum_vx += swarm_agents[i].vx / sp;
            sum_vy += swarm_agents[i].vy / sp;
        }
    }
    var order = Math.sqrt(sum_vx * sum_vx + sum_vy * sum_vy) / swarm_agents.length;

    // Outlet 2: [density, spread, order]
    outlet(2, density, spread, order);
}

// =====================
// POSITION OUTPUT (for TD)
// =====================

function output_positions() {
    // Send each agent position as individual message (Max js outlet has no .apply)
    // Format: [agent_index, x, y] from outlet 1
    for (var i = 0; i < swarm_agents.length; i++) {
        outlet(1, i, swarm_agents[i].x, swarm_agents[i].y);
    }
}

// =====================
// MAIN LOOP (called by metro bang)
// =====================

var frame_count = 0;

function bang() {
    try {
        if (inlet === 0) {
            // Main update tick
            update_swarm();

            // Close gate after processing (notes only on Kuramoto trigger frames)
            if (gate_mode === 1) {
                gate_open = 0;
            }

            frame_count++;
            // Send positions and metrics every 5 frames (reduce OSC traffic)
            if (frame_count % 5 === 0) {
                output_positions();
                compute_metrics();
            }
        } else if (inlet === 1) {
            // Kuramoto gate pulse (inlet 1)
            // Open the gate briefly for note events
            gate_open = 1;
        }
    } catch (e) {
        post("swarm.js ERROR: " + e.message + "\n");
    }
}



// =====================
// MESSAGE HANDLERS
// =====================

function msg_float(v) {
    // Float to inlet 1 = unused, but handle gracefully
    if (inlet === 1) {
        gate_open = (v > 0.5) ? 1 : 0;
    }
}

function set_agents(n) {
    NUM_AGENTS = Math.max(2, Math.min(n, 500));
    init_agents();
}

function separation(v) { sep_weight = Math.max(0, Math.min(v, 2.0)); }
function alignment(v)  { ali_weight = Math.max(0, Math.min(v, 2.0)); }
function cohesion(v)   { coh_weight = Math.max(0, Math.min(v, 2.0)); }
function maxspeed(v)   { max_speed = Math.max(0.001, Math.min(v, 1.0)); }
function neighborhood(v) { neighborhood_r = Math.max(0.5, Math.min(v, 50.0)); }
function root(v)       { root_freq = Math.max(20, Math.min(v, 2000)); }
function tuning_flex(v) { flex = Math.max(0, Math.min(v, 1.0)); }
function octaves(n)    { NUM_OCTAVES = Math.max(1, Math.min(n, 5)); build_gridlines(); init_agents(); }
function gate_mode_set(v) { gate_mode = (v > 0) ? 1 : 0; gate_open = (gate_mode === 0) ? 1 : 0; }

function reset() {
    build_gridlines();
    init_agents();
}

// =====================
// PRESETS
// =====================

function preset(name) {
    if (name === "scatter" || name === "callresponse") {
        // Sparse, individual voices. Call-and-response zone.
        sep_weight = 0.7;
        ali_weight = 0.15;
        coh_weight = 0.25;
        max_speed = 0.02;
        neighborhood_r = 4.0;
        post("swarm: preset CALL-AND-RESPONSE (sparse, conversational)\n");
    }
    else if (name === "flock") {
        // Parallel melodic motion. Sweeping, oceanic.
        sep_weight = 0.3;
        ali_weight = 0.7;
        coh_weight = 0.4;
        max_speed = 0.04;
        neighborhood_r = 8.0;
        post("swarm: preset FLOCK (parallel motion, sweeping)\n");
    }
    else if (name === "cluster") {
        // Dense chords. Thick, organ-like.
        sep_weight = 0.1;
        ali_weight = 0.2;
        coh_weight = 0.8;
        max_speed = 0.03;
        neighborhood_r = 10.0;
        post("swarm: preset CLUSTER (dense chords, thick)\n");
    }
    else if (name === "swarming") {
        // All three balanced. Complex interlocking polyphony.
        // THIS is the sweet spot. Arom's emergent polyphony.
        sep_weight = 0.4;
        ali_weight = 0.35;
        coh_weight = 0.45;
        max_speed = 0.04;
        neighborhood_r = 6.0;
        post("swarm: preset SWARMING (balanced, emergent polyphony)\n");
    }
    else if (name === "drone") {
        // Very slow, low separation. Sustained cluster.
        sep_weight = 0.15;
        ali_weight = 0.1;
        coh_weight = 0.6;
        max_speed = 0.005;
        neighborhood_r = 15.0;
        post("swarm: preset DRONE (slow, sustained cluster)\n");
    }
    else {
        post("swarm: unknown preset '" + name + "'. Options: scatter, callresponse, flock, cluster, swarming, drone\n");
    }
}

// =====================
// INIT
// =====================

build_gridlines();
init_agents();
post("swarm.js loaded. Send bang from [metro 10] to drive. Use 'preset callresponse' to start.\n");
