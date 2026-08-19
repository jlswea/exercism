pub fn convert(buffer: []u8, n: u32) []const u8 {
    const len: usize = 5;
    var idx: usize = 0;
    if (n % 3 == 0) {
        @memcpy(buffer[idx..][0..len], "Pling");
        idx += len;
    }
    if (n % 5 == 0) {
        @memcpy(buffer[idx..][0..len], "Plang");
        idx += len;
    }
    if (n % 7 == 0) {
        @memcpy(buffer[idx..][0..len], "Plong");
        idx += len;
    }
    if (idx == 0) {
        var digits_buffer: [10]u8 = undefined;
        const digits = u32ToString(&digits_buffer, n);
        @memcpy(buffer[0..][0..digits.len], digits);
        idx = digits.len;
    }

    return buffer[0..idx];
}

fn u32ToString(buffer: []u8, n: u32) []const u8 {
    if (n == 0) {
        buffer[0] = '0';
        return buffer[0..1];
    }

    var digits: [maxDigits(u32)]u8 = undefined; // u32 max has 10 digits
    var count: usize = 0;
    var value = n;

    while (value > 0) {
        digits[count] = '0' + @as(u8, @intCast(value % 10));
        value /= 10;
        count += 1;
    }

    // digits were collected in reverse (least significant first), so flip into buffer
    for (0..count) |i| {
        buffer[i] = digits[count - 1 - i];
    }

    return buffer[0..count];
}

fn maxDigits(comptime T: type) usize {
    comptime var max_val: T = 0;
    max_val = ~max_val;
    comptime var count: usize = 1;
    while (max_val >= 10) {
        max_val /= 10;
        count += 1;
    }
    return count;
}
