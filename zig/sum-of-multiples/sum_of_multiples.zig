const std = @import("std");
const mem = std.mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    _ = allocator;
    var total: i128 = 0;
    var subset: u64 = 1;
    const end = @as(u64, 1) << @intCast(factors.len);
    next_subset: while (subset < end) : (subset += 1) {
        var divisor: u128 = 1;
        for (factors, 0..) |f, i| {
            if (subset & (@as(u64, 1) << @intCast(i)) == 0) continue;
            if (f == 0) continue :next_subset;
            divisor = std.math.lcm(divisor, @as(u128, f));
            if (divisor >= limit) continue :next_subset;
        }
        const term: i128 = @intCast(sumMultiples(@intCast(divisor), limit));

        // A ∪ B ∪ C  =  A + B + C  −  AB − AC − BC  +  ABC
        if (@popCount(subset) % 2 == 1) total += term else total -= term;
    }
    return @intCast(total);
}

fn sumMultiples(d: u64, limit: u32) u128 {
    if (d == 0 or d >= limit) return 0;
    const m: u128 = (limit - 1) / d;
    return d * (m * (m + 1) / 2); // triangle number
}
