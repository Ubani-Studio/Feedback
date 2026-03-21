// ============================================
// VEVE PRESET LOADER v2
// ============================================
// Sends veve adjacency matrices as weighted values
// to buffer~ veve_adj and bitmask Params to gen~.
// Supports morphing between presets.
//
// USAGE IN MAX PATCHER:
//   [js veve_loader.js]
//   |
//   Outlet 0: status messages
//   Outlet 1: preset index (int)
//   Outlet 2: row param messages + veve_preset → gen~ inlet 0
//
// MESSAGES:
//   load <index>    — load preset by index (0-12)
//   load <name>     — load preset by name
//   init            — initialize and load default (0)
//   morph_target <index> — set morph target preset
//   morph <amount>  — interpolate 0-1 between current and target
//   dump            — print current adjacency matrix
//   info            — print all available presets
//   <integer>       — load preset by index
//
// ============================================

inlets = 1;
outlets = 3;  // 0: status, 1: preset index, 2: row param messages → gen~

var current_preset = -1;
var target_preset = -1;
var current_morph = 0;

// ============================================
// EMBEDDED PRESETS
// ============================================
// Source: Milo Rigaud, Ve-Ve: Diagrammes Rituels
//         du Voudou (1974)
//
// adj = row-major flattened 6x6 weighted adjacency matrix
// Values 0.0-1.0: connection strength
// Row i, col j: how strongly oscillator j pulls on oscillator i
// ============================================

var presets = [
	{
		index: 0,
		name: "All-to-all",
		source: "Default (standard Kuramoto)",
		description: "Every oscillator couples to every other. Maximum synchronization potential.",
		predicted_behavior: "Classic Kuramoto: smooth transition from free to locked as K increases.",
		adj: [
			0,1,1,1,1,1,
			1,0,1,1,1,1,
			1,1,0,1,1,1,
			1,1,1,0,1,1,
			1,1,1,1,0,1,
			1,1,1,1,1,0
		],
		node_labels: ["iya_ilu", "omele_1", "ogene", "gudugudu", "omele_2", "shekere"]
	},
	{
		index: 1,
		name: "Legba Carrefour",
		source: "Rigaud p.189 — Crossroads hub",
		description: "Center hub connects to all 5. Arms connect only to center. Star topology.",
		predicted_behavior: "Strong leader-follower. Center entrains all arms. Arms don't influence each other.",
		adj: [
			0,1,1,1,1,1,
			1,0,0,0,0,0,
			1,0,0,0,0,0,
			1,0,0,0,0,0,
			1,0,0,0,0,0,
			1,0,0,0,0,0
		],
		node_labels: ["center_hub", "north_arm", "east_arm", "south_arm", "west_arm", "staff"]
	},
	{
		index: 2,
		name: "Carrefour Diamond",
		source: "Rigaud p.206 — Diamond mesh",
		description: "5 nodes fully connected in diamond. 6th node peripheral through node 4.",
		predicted_behavior: "Near-all-to-all lock for 5 core voices. One outsider drifts — rhythmic tension.",
		adj: [
			0,1,1,1,1,0,
			1,0,1,1,1,0,
			1,1,0,1,1,0,
			1,1,1,0,1,0,
			1,1,1,1,0,1,
			0,0,0,0,1,0
		],
		node_labels: ["center_cross", "north_star", "east_star", "south_star", "west_star", "spiral"]
	},
	{
		index: 3,
		name: "Ferraille",
		source: "Rigaud p.266 — V-shape sabre",
		description: "V-graph: junction connects to 2 tips. Oscillators 3-5 completely free.",
		predicted_behavior: "Two-against-one lock + 3 free voices. Fractured groove at high K.",
		adj: [
			0,1,1,0,0,0,
			1,0,0,0,0,0,
			1,0,0,0,0,0,
			0,0,0,0,0,0,
			0,0,0,0,0,0,
			0,0,0,0,0,0
		],
		node_labels: ["junction", "left_tip", "right_tip", "free_1", "free_2", "free_3"]
	},
	{
		index: 4,
		name: "Ogou Bhathalah",
		source: "Rigaud p.256 — W/M zigzag",
		description: "3 diamond centers in chain (L-M-R). Star endpoints at vertices. Zigzag topology.",
		predicted_behavior: "Wave propagation L-to-M-to-R. Sync cascades along the chain — rolling groove.",
		adj: [
			0,1,0,1,1,0,
			1,0,1,0,1,0,
			0,1,0,0,1,1,
			1,0,0,0,0,0,
			1,1,1,0,0,0,
			0,0,1,0,0,0
		],
		node_labels: ["L_diamond", "M_diamond", "R_diamond", "TL_star", "B_star", "TR_star"]
	},
	{
		index: 5,
		name: "Legba co-sou",
		source: "Rigaud p.191 — Circle with dots",
		description: "Nearest-neighbor ring. Each oscillator connects to its 2 immediate neighbors.",
		predicted_behavior: "Traveling wave. Phase patterns rotate — circular rhythm cascade.",
		adj: [
			0,1,0,0,0,1,
			1,0,1,0,0,0,
			0,1,0,1,0,0,
			0,0,1,0,1,0,
			0,0,0,1,0,1,
			1,0,0,0,1,0
		],
		node_labels: ["ring_0", "ring_1", "ring_2", "ring_3", "ring_4", "ring_5"]
	},
	{
		index: 6,
		name: "Marassa",
		source: "Rigaud p.409 — Maraça caille (bilateral cross)",
		description: "Mirrored twins on shared axis. Two triangles (0-1-2, 3-4-5) bridged at 2-3 (0.5). Twins are connected, not isolated.",
		predicted_behavior: "Twin groups lock internally. Weak bridge creates cross-talk — lobes drift then re-sync. Polyrhythmic phasing with periodic convergence.",
		adj: [
			0,1,1,0,0,0,
			1,0,1,0,0,0,
			1,1,0,0.5,0,0,
			0,0,0.5,0,1,1,
			0,0,0,1,0,1,
			0,0,0,1,1,0
		],
		node_labels: ["twin_A1", "twin_A2", "twin_A_bridge", "twin_B_bridge", "twin_B1", "twin_B2"]
	},
	{
		index: 7,
		name: "Damballah Wedo",
		source: "Rigaud p.169 — Danbhalah-la-flambeau",
		description: "Linear chain 0-1-2-3-4-5. Sync propagates like a wave from head to tail.",
		predicted_behavior: "Phase wave — each oscillator entrains its neighbor. Ripple effect. Delay-line groove.",
		adj: [
			0,1,0,0,0,0,
			1,0,1,0,0,0,
			0,1,0,1,0,0,
			0,0,1,0,1,0,
			0,0,0,1,0,1,
			0,0,0,0,1,0
		],
		node_labels: ["head", "neck", "body_1", "body_2", "body_3", "tail"]
	},
	{
		index: 8,
		name: "Erzulie Freda",
		source: "Rigaud p.215 — Heart / two lobes",
		description: "Two triangles sharing apex (node 0). Bridge node 5 connects lobe tips. Weighted: bridge at 0.5.",
		predicted_behavior: "Two lobes lock internally. Bridge creates weak cross-talk — lobes drift then re-sync.",
		adj: [
			0,  1,  1,  1,  1,  0,
			1,  0,  1,  0,  0,  0.5,
			1,  1,  0,  0,  0,  0,
			1,  0,  0,  0,  1,  0,
			1,  0,  0,  1,  0,  0.5,
			0,  0.5,0,  0,  0.5,0
		],
		node_labels: ["apex", "lobe_A1", "lobe_A2", "lobe_B1", "lobe_B2", "bridge"]
	},
	{
		index: 9,
		name: "Baron Samedi",
		source: "Rigaud p.286+ — Cross of the dead (plate not located)",
		description: "Center hub (0) with 4 arms. Cross-bracing: 1-3 and 2-4 diagonal. Node 5 weak to center.",
		predicted_behavior: "Hub dominates. Diagonals create secondary sync paths at 40% strength — ghost rhythms.",
		adj: [
			0,  1,  1,  1,  1,  0.4,
			1,  0,  0,  0.4,0,  0,
			1,  0,  0,  0,  0.4,0,
			1,  0.4,0,  0,  0,  0,
			1,  0,  0.4,0,  0,  0,
			0.4,0,  0,  0,  0,  0
		],
		node_labels: ["center_cross", "north", "east", "south", "west", "grave"]
	},
	{
		index: 10,
		name: "Simbi",
		source: "Rigaud p.404 — Sim'bi Yamphaca (three branches from root)",
		description: "Root basin (0) feeds 3 branch bases (1,3,5). Two branches extend to tips (1-2, 3-4). Fan/tree from shared root.",
		predicted_behavior: "Root entrains all branches. Tips follow with delay. Three-way phase spread — rivulet divergence from single source.",
		adj: [
			0,  1,  0,  1,  0,  1,
			1,  0,  1,  0,  0,  0,
			0,  1,  0,  0,  0,  0,
			1,  0,  0,  0,  1,  0,
			0,  0,  0,  1,  0,  0,
			1,  0,  0,  0,  0,  0
		],
		node_labels: ["root_basin", "branch_A", "tip_A", "branch_B", "tip_B", "branch_C"]
	},
	{
		index: 11,
		name: "Ayizan",
		source: "Rigaud p.135 — Palm frond / spine with branches",
		description: "Central spine 0-1-2-3. Branches: 1-4 and 2-5. Spine at full strength, branches at 0.7.",
		predicted_behavior: "Spine locks first. Branches follow with slight lag — palm-frond sway.",
		adj: [
			0,  1,  0,  0,  0,  0,
			1,  0,  1,  0,  0.7,0,
			0,  1,  0,  1,  0,  0.7,
			0,  0,  1,  0,  0,  0,
			0,  0.7,0,  0,  0,  0,
			0,  0,  0.7,0,  0,  0
		],
		node_labels: ["spine_root", "spine_1", "spine_2", "spine_tip", "branch_L", "branch_R"]
	},
	{
		index: 12,
		name: "Gran Bwa",
		source: "Rigaud p.178 — Great tree",
		description: "Root (0) splits to trunk (1,2). Left trunk branches to 3,4. Right trunk branches to 5.",
		predicted_behavior: "Hierarchical sync — root drives trunk, trunk drives branches. Top-down entrainment.",
		adj: [
			0,1,1,0,0,0,
			1,0,0,1,1,0,
			1,0,0,0,0,1,
			0,1,0,0,0,0,
			0,1,0,0,0,0,
			0,0,1,0,0,0
		],
		node_labels: ["root", "trunk_L", "trunk_R", "branch_L1", "branch_L2", "branch_R1"]
	}
];


// ============================================
// INIT — load default preset, write to buffer
// ============================================

function init() {
	post("veve_loader: " + presets.length + " presets ready (embedded)\n");
	for (var i = 0; i < presets.length; i++) {
		post("  [" + i + "] " + presets[i].name + "\n");
	}
	load(0);
}


// ============================================
// WRITE WEIGHTS TO BUFFER
// ============================================

function writeWeightsToBuffer(weights) {
	var buf = new Buffer("veve_adj");
	for (var row = 0; row < 6; row++) {
		for (var col = 0; col < 6; col++) {
			buf.poke(row + 1, col, weights[row * 6 + col]);
		}
	}
}


// ============================================
// LOAD — compute bitmasks, write to buffer, send to gen~
// ============================================

function load(arg) {
	var preset = null;

	// Find by index or name
	if (typeof arg === "number") {
		var idx = Math.floor(arg);
		if (idx >= 0 && idx < presets.length) {
			preset = presets[idx];
		}
	} else if (typeof arg === "string") {
		for (var i = 0; i < presets.length; i++) {
			if (presets[i].name.toLowerCase() === arg.toLowerCase()) {
				preset = presets[i];
				break;
			}
		}
	}

	if (preset === null) {
		error("veve_loader: Preset not found: " + arg + "\n");
		return;
	}

	// Write weighted adjacency to buffer~ veve_adj
	writeWeightsToBuffer(preset.adj);

	// Send adjacency matrix rows as bitmask Param messages to gen~ (backward compat)
	for (var row = 0; row < 6; row++) {
		var bitmask = 0;
		for (var col = 0; col < 6; col++) {
			if (preset.adj[row * 6 + col] > 0) {
				bitmask += (1 << col);
			}
		}
		outlet(2, "row" + row, bitmask);
	}

	// Send veve_preset index
	outlet(2, "veve_preset", preset.index);

	current_preset = preset.index;
	current_morph = 0;

	// Output status
	outlet(0, "loaded", preset.index, preset.name);
	outlet(1, preset.index);

	post("veve_loader: Loaded [" + preset.index + "] " + preset.name + "\n");
	post("  " + preset.description + "\n");
	post("  " + preset.predicted_behavior + "\n");
}


// ============================================
// MORPH TARGET — set which preset to morph toward
// ============================================

function morph_target(idx) {
	idx = Math.floor(idx);
	if (idx >= 0 && idx < presets.length) {
		target_preset = idx;
		post("veve_loader: Morph target set to [" + idx + "] " + presets[idx].name + "\n");
	} else {
		error("veve_loader: Invalid morph target: " + idx + "\n");
	}
}


// ============================================
// MORPH — interpolate between current and target
// ============================================

function morph(amount) {
	if (current_preset < 0) {
		error("veve_loader: No preset loaded\n");
		return;
	}
	if (target_preset < 0) {
		target_preset = (current_preset + 1) % presets.length;
	}

	amount = Math.max(0, Math.min(1, amount));
	current_morph = amount;

	var src = presets[current_preset].adj;
	var dst = presets[target_preset].adj;
	var morphed = [];

	for (var i = 0; i < 36; i++) {
		morphed[i] = src[i] * (1 - amount) + dst[i] * amount;
	}

	// Write interpolated weights to buffer
	writeWeightsToBuffer(morphed);

	// Send interpolated veve_preset (for shader interpolation)
	var morphedPreset = current_preset * (1 - amount) + target_preset * amount;
	outlet(2, "veve_preset", morphedPreset);

	// Update bitmasks (threshold at 0.1 for binary connection)
	for (var row = 0; row < 6; row++) {
		var bitmask = 0;
		for (var col = 0; col < 6; col++) {
			if (morphed[row * 6 + col] > 0.1) {
				bitmask += (1 << col);
			}
		}
		outlet(2, "row" + row, bitmask);
	}
}


// ============================================
// DUMP — print current adjacency matrix
// ============================================

function dump() {
	if (current_preset < 0) {
		post("veve_loader: No preset loaded\n");
		return;
	}

	var p = presets[current_preset];
	post("veve_loader: Current preset [" + p.index + "] " + p.name + "\n");
	if (current_morph > 0 && target_preset >= 0) {
		post("  Morphing " + (current_morph * 100).toFixed(0) + "% toward [" + target_preset + "] " + presets[target_preset].name + "\n");
	}
	post("  Weighted adjacency matrix (row = pulled, col = puller):\n");

	for (var row = 0; row < 6; row++) {
		var line = "  [";
		for (var col = 0; col < 6; col++) {
			var w = p.adj[row * 6 + col];
			line += (w === Math.floor(w)) ? w : w.toFixed(1);
			if (col < 5) line += ", ";
		}
		line += "]  <- osc " + (row + 1) + " (" + p.node_labels[row] + ")";
		post(line + "\n");
	}
}


// ============================================
// INFO — list all presets
// ============================================

function info() {
	post("veve_loader: " + presets.length + " presets available\n");
	for (var i = 0; i < presets.length; i++) {
		var p = presets[i];
		var marker = (i === current_preset) ? " <- ACTIVE" : "";
		post("  [" + i + "] " + p.name + " -- " + p.source + marker + "\n");
	}
}


// ============================================
// MSG_INT — load by index when receiving integer
// ============================================

function msg_int(v) {
	load(v);
}


// ============================================
// ANYTHING — catch named messages
// ============================================

function anything() {
	var msg = messagename;
	if (msg === "load" && arguments.length > 0) {
		load(arguments[0]);
	} else if (msg === "init") {
		init();
	} else if (msg === "dump") {
		dump();
	} else if (msg === "info") {
		info();
	} else if (msg === "morph" && arguments.length > 0) {
		morph(arguments[0]);
	} else if (msg === "morph_target" && arguments.length > 0) {
		morph_target(arguments[0]);
	} else {
		load(msg);
	}
}
