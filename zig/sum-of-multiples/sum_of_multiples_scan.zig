const std = @import("std");
const mem = std.mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    _ = allocator;
    var res: u64 = 0;
    var n: u32 = 1;
    while (n < limit) : (n += 1) {
        for (factors) |f| {
            if (f != 0 and n % f == 0) {
                res += n;
                break;
            }
        }
    }
    return res;
}
