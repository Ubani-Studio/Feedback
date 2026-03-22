// ============================================
// OSC SENDER for Step6 Chaos Resonator
// ============================================
// Node for Max — sends binary OSC to TouchDesigner
//
// MESSAGES (inlet):
//   chaos <x> <y> <z>
//   amplitude <value>
//   attractor <0-4>
//   chaos_gain <value>
//   root_freq <value>
//   tuning_system <value>
//   arp_bpm <value>
//   combine_mode <0-2>
//   decay <value>
//   drive <value>
//   mute <0|1>
//
// OSC ADDRESSES SENT:
//   /chaos/x, /chaos/y, /chaos/z
//   /audio/amplitude
//   /attractor/type
//   /chaos/gain
//   /root/freq
//   /tuning/system
//   /arp/bpm
//   /combine/mode
//   /resonator/decay
//   /resonator/drive
//   /mute
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

function send(address, value) {
    var packet = makeOSC(address, value);
    client.send(packet, PORT, HOST);
}

// --- Chaos XYZ (from snapshot~ via prepend) ---
Max.addHandler('chaos', function() {
    var args = Array.prototype.slice.call(arguments);
    if (args.length >= 3) {
        send('/chaos/x', args[0]);
        send('/chaos/y', args[1]);
        send('/chaos/z', args[2]);
    }
});

// --- Individual axis handlers (from existing prepend /x /y /z chain) ---
Max.addHandler('x', function() {
    var args = Array.prototype.slice.call(arguments);
    if (args.length >= 1) send('/chaos/x', args[0]);
});

Max.addHandler('y', function() {
    var args = Array.prototype.slice.call(arguments);
    if (args.length >= 1) send('/chaos/y', args[0]);
});

Max.addHandler('z', function() {
    var args = Array.prototype.slice.call(arguments);
    if (args.length >= 1) send('/chaos/z', args[0]);
});

// --- Audio amplitude ---
Max.addHandler('amplitude', function() {
    var args = Array.prototype.slice.call(arguments);
    if (args.length >= 1) send('/audio/amplitude', args[0]);
});

Max.addHandler('L', function() {
    var args = Array.prototype.slice.call(arguments);
    if (args.length >= 1) send('/audio/amplitude', args[0]);
});

// --- Attractor type (0=Lorenz, 1=Rossler, 2=Chua, 3=Halvorsen, 4=Aizawa) ---
Max.addHandler('attractor', function() {
    var args = Array.prototype.slice.call(arguments);
    if (args.length >= 1) send('/attractor/type', args[0]);
});

// --- Chaos gain ---
Max.addHandler('chaos_gain', function() {
    var args = Array.prototype.slice.call(arguments);
    if (args.length >= 1) send('/chaos/gain', args[0]);
});

// --- Root frequency ---
Max.addHandler('root_freq', function() {
    var args = Array.prototype.slice.call(arguments);
    if (args.length >= 1) send('/root/freq', args[0]);
});

// --- Tuning system ---
Max.addHandler('tuning_system', function() {
    var args = Array.prototype.slice.call(arguments);
    if (args.length >= 1) send('/tuning/system', args[0]);
});

// --- Arpeggiator BPM ---
Max.addHandler('arp_bpm', function() {
    var args = Array.prototype.slice.call(arguments);
    if (args.length >= 1) send('/arp/bpm', args[0]);
});

// --- Combine mode (0=blend, 1=modulate, 2=route) ---
Max.addHandler('combine_mode', function() {
    var args = Array.prototype.slice.call(arguments);
    if (args.length >= 1) send('/combine/mode', args[0]);
});

// --- Resonator decay ---
Max.addHandler('decay', function() {
    var args = Array.prototype.slice.call(arguments);
    if (args.length >= 1) send('/resonator/decay', args[0]);
});

// --- Drive ---
Max.addHandler('drive', function() {
    var args = Array.prototype.slice.call(arguments);
    if (args.length >= 1) send('/resonator/drive', args[0]);
});

// --- Mute ---
Max.addHandler('mute', function() {
    var args = Array.prototype.slice.call(arguments);
    if (args.length >= 1) send('/mute', args[0]);
});

Max.post('osc_send_step6.js ready — target ' + HOST + ':' + PORT);
Max.post('  Channels: chaos(x/y/z), amplitude, attractor, chaos_gain, root_freq, tuning_system, arp_bpm, combine_mode, decay, drive, mute');
