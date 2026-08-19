const std = @import("std");

pub fn isIsogram(str: []const u8) bool {
    std.debug.print("{s}\n", .{str});

    var hist: u32 = 0; // store 26 bits
    for (str) |c| {
        if (std.ascii.isAlphabetic(c)) {
            const shift: u5 = @intCast(std.ascii.toLower(c) - 'a');
            const mask = @as(u32, 1) << shift;
            if (hist & mask != 0) return false; // we have seen this char before
            hist |= mask;
        }
    }

    return true;
}
