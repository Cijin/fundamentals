pub fn search(elements: []i64, target: i64) i32 {
    for (elements, 0..) |el, i| {
        if (el == target) {
            return @intCast(i);
        }
    }

    return -1;
}
