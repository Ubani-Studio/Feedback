// preset_menu.js — maps umenu selections to gen~ parameter messages
// Inlet 0: Tuning System (0-18)
// Inlet 1: Pattern Preset (0-7)
// Inlet 2: Rho (0-5)
// Inlet 3: African Root (0-5)
// Inlet 4: ADSR (0-4)
// Inlet 5: Chaos Gain (0-4)
// Inlet 6: Root Spring (0-3)
// Inlet 7: Glide (0-2)
// Outlet 0: messages to s toGen

inlets = 8;
outlets = 1;

function msg_int(v) {
	if (inlet === 0) tuning(v);
	else if (inlet === 1) pattern(v);
	else if (inlet === 2) rho_preset(v);
	else if (inlet === 3) african_root(v);
	else if (inlet === 4) adsr(v);
	else if (inlet === 5) chaos_gain_preset(v);
	else if (inlet === 6) root_spring(v);
	else if (inlet === 7) glide_preset(v);
}

function tuning(i) {
	outlet(0, "tuning_system", i);
}

function pattern(i) {
	var p = [
		[8, 3, 120],
		[9, 2, 90],
		[6, 4, 130],
		[10, 1, 100],
		[11, 2, 110],
		[12, 4, 95],
		[13, 3, 120],
		[14, 4, 140]
	];
	if (i >= 0 && i < p.length) {
		outlet(0, "arp_mode", p[i][0]);
		outlet(0, "arp_div", p[i][1]);
		outlet(0, "arp_bpm", p[i][2]);
	}
}

function rho_preset(i) {
	var vals = [20, 24.74, 28, 100, 166, 50];
	if (i >= 0 && i < vals.length) {
		outlet(0, "rho", vals[i]);
	}
}

function african_root(i) {
	var vals = [61, 82, 125, 172, 220, 350];
	if (i >= 0 && i < vals.length) {
		outlet(0, "root", vals[i]);
	}
}

function adsr(i) {
	var p = [
		[0.001, 0.08, 0., 0.05],
		[0.3, 0.2, 0.9, 1.],
		[1., 0.5, 0.7, 2.],
		[0.001, 0.02, 0., 0.01],
		[0.005, 0.05, 0.8, 0.1]
	];
	if (i >= 0 && i < p.length) {
		outlet(0, "env_attack", p[i][0]);
		outlet(0, "env_decay", p[i][1]);
		outlet(0, "env_sustain", p[i][2]);
		outlet(0, "env_release", p[i][3]);
	}
}

function chaos_gain_preset(i) {
	var vals = [0.002, 0.005, 0.01, 0.03, 0.1];
	if (i >= 0 && i < vals.length) {
		outlet(0, "chaos_gain", vals[i]);
	}
}

function root_spring(i) {
	if (i === 0) {
		outlet(0, "root_offset", 0);
		outlet(0, "root_mode", 0);
		outlet(0, "root_return", 0.1);
	} else if (i === 1) {
		outlet(0, "root_offset", 0);
		outlet(0, "root_mode", 0);
		outlet(0, "root_return", 0.5);
	} else if (i === 2) {
		outlet(0, "root_offset", 0);
		outlet(0, "root_mode", 0);
		outlet(0, "root_return", 2.);
	} else if (i === 3) {
		outlet(0, "root_mode", 1);
	}
}

function glide_preset(i) {
	var vals = [0.0002, 0.001, 0.01];
	if (i >= 0 && i < vals.length) {
		outlet(0, "glide", vals[i]);
	}
}
