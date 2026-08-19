const std = @import("std");

pub fn isPangram(str: []const u8) bool {
    var hist: u32 = 0;
    for (str) |c| {
        if (std.ascii.isAlphabetic(c)) {
            const shift: u5 = @intCast(std.ascii.toLower(c) - 'a');
            const mask = @as(u32, 1) << shift;
            if (hist & mask == 1) continue;
            hist |= mask;
        }
    }

    if (hist == (1 << 26) - 1) return true;
    return false;
}
