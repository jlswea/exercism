const std = @import("std");

pub fn score(s: []const u8) u32 {
    var res: u32 = 0;
    for (s) |c| {
        if (std.mem.findScalar(u8, "AEIOULNRST", std.ascii.toUpper(c)) != null) res += 1;
        if (std.mem.findScalar(u8, "DG", std.ascii.toUpper(c)) != null) res += 2;
        if (std.mem.findScalar(u8, "BCMP", std.ascii.toUpper(c)) != null) res += 3;
        if (std.mem.findScalar(u8, "FHVWY", std.ascii.toUpper(c)) != null) res += 4;
        if (std.mem.findScalar(u8, "K", std.ascii.toUpper(c)) != null) res += 5;
        if (std.mem.findScalar(u8, "JX", std.ascii.toUpper(c)) != null) res += 8;
        if (std.mem.findScalar(u8, "QZ", std.ascii.toUpper(c)) != null) res += 10;
    }
    return res;
}
