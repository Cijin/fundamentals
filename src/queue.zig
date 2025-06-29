fn new_node(val: u64, allocator: std.mem.Allocator) *Node {
    const n = allocator.create(Node) catch unreachable;
    n.* = Node{ .val = val, .next = null };

    return n;
}

const Node = struct {
    val: u64,
    next: ?*Node,
};

const Queue = struct {
    head: ?*Node,
    tail: ?*Node,
    len: u64,
    allocator: std.mem.Allocator,

    pub fn enqueue(self: *Queue, val: u64) void {
        const node = new_node(val, self.allocator);
        self.len += 1;
        if (self.len == 1) {
            self.head = node;
            self.tail = node;
            return;
        }

        if (self.tail) |t| {
            t.next = node;
            self.tail = node;
        }
    }

    pub fn deque(self: *Queue) u64 {
        assert(self.len >= 1);

        self.len -= 1;
        if (self.head) |h| {
            defer self.allocator.destroy(h);

            self.head = h.next;
            return h.val;
        } else unreachable;
    }

    pub fn peek(self: *Queue) ?u64 {
        return self.head.?.val;
    }
};

pub fn New(allocator: std.mem.Allocator) *Queue {
    const q = allocator.create(Queue) catch unreachable;
    q.* = Queue{
        .head = null,
        .tail = null,
        .len = 0,
        .allocator = allocator,
    };

    return q;
}

const std = @import("std");
const assert = std.debug.assert;
