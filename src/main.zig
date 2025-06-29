pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer {
        const heap_check = gpa.deinit();
        if (heap_check == .leak) {
            @panic("Memory leak");
        }
    }

    const q = queue.New(allocator);
    defer allocator.destroy(q);

    q.enqueue(1);
    q.enqueue(2);
    q.enqueue(3);
    q.enqueue(4);

    for (0..q.len) |_| {
        std.debug.print("{d}\n", .{q.deque()});
    }
}

const std = @import("std");

const queue = @import("queue.zig");
