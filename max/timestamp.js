function bang() {
    var d = new Date();
    var y = d.getFullYear();
    var mo = ("0" + (d.getMonth() + 1)).slice(-2);
    var dy = ("0" + d.getDate()).slice(-2);
    var h = ("0" + d.getHours()).slice(-2);
    var mi = ("0" + d.getMinutes()).slice(-2);
    var s = ("0" + d.getSeconds()).slice(-2);
    outlet(0, "chaos_" + y + mo + dy + "_" + h + mi + s + ".wav");
}
