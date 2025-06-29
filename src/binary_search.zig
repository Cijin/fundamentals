pub fn search(in: []i64, target: i64) i64 {
    var l: usize = 0;
    var r: usize = in.len - 1;
    var m: usize = 0;
    while (l <= r) {
        m = l + (@divFloor((r - l), 2));

        if (in[m] < target) {
            l = m + 1;
        } else if (in[m] > target) {
            r = m - 1;
        } else {
            return @intCast(m);
        }
    }

    return -1;
}

const std = @import("std");
