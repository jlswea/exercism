const std = @import("std");
const mem = std.mem;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var list: std.ArrayList(u8) = .empty;
    defer list.deinit(allocator);

    var is_new_word = true;
    for (words) |char| {
        if (std.ascii.isWhitespace(char) or char == '-') {
            is_new_word = true;
        } else if (is_new_word and std.ascii.isAlphabetic(char)) {
            try list.append(allocator, std.ascii.toUpper(char));
            is_new_word = false;
        }
    }

    return list.toOwnedSlice(allocator);
}
