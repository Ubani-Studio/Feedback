// lane_rate.js — per-voice rate with master/individual link
// Inlets 0-5:   per-voice note index (0=1/1, 1=1/2, 2=1/4, 3=1/8, 4=1/16, 5=1/32, 6=1/64)
// Inlets 6-11:  per-voice mode (0=straight, 1=triplet, 2=dotted)
// Inlet 12:     link toggle (1=master controls all, 0=individual per-voice)
// Inlet 13:     master div value (float, from rate_select.js)
// Outlet 0:     messages "poly_rateN value" to gen~

inlets = 14;
outlets = 1;

var base_divs = [0.25, 0.5, 1.0, 2.0, 4.0, 8.0, 16.0];
var mode_mults = [1.0, 1.5, 0.6667];
var notes = [3, 3, 3, 3, 3, 3];
var modes = [0, 0, 0, 0, 0, 0];
var master_div = 2.0;
var linked = 1;

function msg_int(v) {
	if (inlet < 6) {
		notes[inlet] = Math.max(0, Math.min(6, v));
	} else if (inlet < 12) {
		modes[inlet - 6] = Math.max(0, Math.min(2, v));
	} else if (inlet === 12) {
		linked = (v > 0) ? 1 : 0;
	}
	update();
}

function msg_float(v) {
	if (inlet === 13) {
		master_div = Math.max(0.01, v);
		update();
	} else {
		msg_int(Math.floor(v));
	}
}

var ready = 0;

function update() {
	if (!ready) return;
	for (var i = 0; i < 6; i++) {
		var div;
		if (linked) {
			div = master_div;
		} else {
			var n = Math.max(0, Math.min(base_divs.length - 1, notes[i]));
			var m = Math.max(0, Math.min(mode_mults.length - 1, modes[i]));
			div = base_divs[n] * mode_mults[m];
		}
		outlet(0, "poly_rate" + (i + 1), div);
	}
}

function bang() {
	update();
}

function loadbang() {
	ready = 1;
	update();
}
