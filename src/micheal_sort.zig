pub fn bubble(comptime T: type, in: []T) []T {
    var j: usize = 0;
    var tmp: T = 0;
    for (in, 0..) |_, i| {
        j = 0;
        while (j < in.len - 1 - i) : (j += 1) {
            if (in[j + 1] < in[j]) {
                tmp = in[j];
                in[j] = in[j + 1];
                in[j + 1] = tmp;
            }
        }
    }

    return in;
}

const std = @import("std");
