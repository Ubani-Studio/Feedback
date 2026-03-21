// ============================================
// OSC SENDER for Feedback pipeline
// ============================================
// Node for Max — sends binary OSC to TouchDesigner
//
// MESSAGES (inlet):
//   lorenz <x> <y> <z> <loudness>
//   kuramoto_r <r>
//   kuramoto_phases <p1> <p2> <p3> <p4> <p5> <p6>
//   veve_preset <index>
//   octave_offset <value>
//   excite_mode <0|1>
//   list <x> <y> <z> <loudness>  (backward compatible)
//
// OSC ADDRESSES SENT:
//   /lorenz/x, /lorenz/y, /lorenz/z, /lorenz/loudness
//   /kuramoto/r
//   /kuramoto/phases (6 floats: phase1-phase6)
//   /veve/preset
//   /octave/offset
//   /excite/mode
//
// ============================================

var Max = require('max-api');
var dgram = require('dgram');
var client = dgram.createSocket('udp4');

var PORT = 7000;
var HOST = '127.0.0.1';

// --- Single float OSC message ---
function makeOSC(address, value) {
    var addrLen = Math.ceil((address.length + 1) / 4) * 4;
    var addrBuf = Buffer.alloc(addrLen, 0);
    Buffer.from(address, 'ascii').copy(addrBuf);
    var typeBuf = Buffer.alloc(4, 0);
    typeBuf.write(',f', 0, 'ascii');
    var valBuf = Buffer.alloc(4);
    valBuf.writeFloatBE(value, 0);
    return Buffer.concat([addrBuf, typeBuf, valBuf]);
}

// --- Multi-float OSC message ---
function makeOSCMulti(address, values) {
    var addrLen = Math.ceil((address.length + 1) / 4) * 4;
    var addrBuf = Buffer.alloc(addrLen, 0);
    Buffer.from(address, 'ascii').copy(addrBuf);

    // Type tag: ,fff... (one 'f' per value)
    var typeStr = ',';
    for (var i = 0; i < values.length; i++) typeStr += 'f';
    var typeLen = Math.ceil((typeStr.length + 1) / 4) * 4;
    var typeBuf = Buffer.alloc(typeLen, 0);
    Buffer.from(typeStr, 'ascii').copy(typeBuf);

    // Values
    var valBuf = Buffer.alloc(values.length * 4);
    for (var i = 0; i < values.length; i++) {
        valBuf.writeFloatBE(values[i], i * 4);
    }

    return Buffer.concat([addrBuf, typeBuf, valBuf]);
}

function send(address, value) {
    var packet = makeOSC(address, value);
    client.send(packet, PORT, HOST);
}

function sendMulti(address, values) {
    var packet = makeOSCMulti(address, values);
    client.send(packet, PORT, HOST);
}

// --- Lorenz data (backward compatible with 'list') ---
Max.addHandler('list', function() {
    var args = Array.prototype.slice.call(arguments);
    if (args.length >= 4) {
        send('/lorenz/x', args[0]);
        send('/lorenz/y', args[1]);
        send('/lorenz/z', args[2]);
        send('/lorenz/loudness', args[3]);
    }
});

Max.addHandler('lorenz', function() {
    var args = Array.prototype.slice.call(arguments);
    if (args.length >= 4) {
        send('/lorenz/x', args[0]);
        send('/lorenz/y', args[1]);
        send('/lorenz/z', args[2]);
        send('/lorenz/loudness', args[3]);
    }
});

// --- Kuramoto order parameter ---
Max.addHandler('kuramoto_r', function() {
    var args = Array.prototype.slice.call(arguments);
    if (args.length >= 1) {
        send('/kuramoto/r', args[0]);
    }
});

// --- Kuramoto phases (6 floats) ---
Max.addHandler('kuramoto_phases', function() {
    var args = Array.prototype.slice.call(arguments);
    if (args.length >= 6) {
        sendMulti('/kuramoto/phases', [
            args[0], args[1], args[2], args[3], args[4], args[5]
        ]);
    }
});

// --- Veve preset index ---
Max.addHandler('veve_preset', function() {
    var args = Array.prototype.slice.call(arguments);
    if (args.length >= 1) {
        send('/veve/preset', args[0]);
    }
});

// --- Resonator decay ---
Max.addHandler('resonator_decay', function() {
    var args = Array.prototype.slice.call(arguments);
    if (args.length >= 1) {
        send('/resonator/decay', args[0]);
    }
});

// --- Audio amplitude ---
Max.addHandler('amplitude', function() {
    var args = Array.prototype.slice.call(arguments);
    if (args.length >= 1) {
        send('/audio/amplitude', args[0]);
    }
});

// --- Root frequency ---
Max.addHandler('root_freq', function() {
    var args = Array.prototype.slice.call(arguments);
    if (args.length >= 1) {
        send('/root/freq', args[0]);
    }
});

// --- Morph amount ---
Max.addHandler('morph', function() {
    var args = Array.prototype.slice.call(arguments);
    if (args.length >= 1) {
        send('/morph/amount', args[0]);
    }
});

// --- Octave offset ---
Max.addHandler('octave_offset', function() {
    var args = Array.prototype.slice.call(arguments);
    if (args.length >= 1) {
        send('/octave/offset', args[0]);
    }
});

// --- Excitation mode (0=noise, 1=PERI) ---
Max.addHandler('excite_mode', function() {
    var args = Array.prototype.slice.call(arguments);
    if (args.length >= 1) {
        send('/excite/mode', args[0]);
    }
});

Max.post('osc_send.js ready — target ' + HOST + ':' + PORT);
Max.post('  Channels: lorenz, kuramoto_r, kuramoto_phases, veve_preset, resonator_decay, amplitude, root_freq, morph, octave_offset, excite_mode');
