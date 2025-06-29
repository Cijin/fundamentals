pub fn ball_breaker(floors: []bool) i64 {
    const jump: u64 = @intCast(math.floor(@intCast((math.sqrt(floors.len)))));
    var i: usize = 0;
    while (i < floors.len) {
        if (floors[i]) {
            break;
        }
        i += jump;
    }

    const j: usize = i;
    i -= jump;
    while (i <= j and i < floors.len) : (i += 1) {
        if (floors[i]) {
            return i;
        }
    }
    return -1;
}

const std = @import("std");
const math = std.math;
