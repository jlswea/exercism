const std = @import("std");

pub fn isArmstrongNumber(num: u128) bool {
    if (num == 0) return true;
    const count = std.math.log10_int(num) + 1;
    var sum: u256 = 0;
    var n = num;
    while (n > 0) : (n /= 10) {
        const digit: u256 = n % 10;
        sum += std.math.pow(u256, digit, count);
    }
    return num == sum;
}
