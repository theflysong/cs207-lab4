//!bcd.v
//!
//!Author: theflysong (song_of_the_fly@163.com)
//!
//!# BCD 相关模块
//!

//!## Binary 转换为 BCD 模块
//!
//!### Parameters
//!
//! - `parameter BIN_WIDTH` : 输入二进制数的位宽, 默认值为 8, 即 0~255
//! - `parameter BCD_WIDTH` : 输出 BCD 数的位宽, 默认值为 12, 即 3 位 BCD 数
//!
//! Static Assertion: 2^BIN_WIDTH <= 10^(ceil(BCD_WIDTH/4))
//!
//!### Ports
//!
//! - `input [BIN_WIDTH-1:0] bin_in` : 输入二进制数
//! - `output reg [BCD_WIDTH-1:0] bcd_out` : 输出 BCD 数
//!
//!### Description
//!
//!使用 Double Dabble 算法将二进制数转换为 BCD 数.
//!
module bin2bcd #(
    parameter integer BIN_WIDTH = 8,
    parameter integer BCD_WIDTH = 12
)(
    input  [BIN_WIDTH-1:0] bin_in,
    output reg [BCD_WIDTH-1:0] bcd_out
);

    integer i, k;
    reg [BCD_WIDTH-1:0] bcd;
    reg [BIN_WIDTH-1:0] bin;

    always @(*) begin
        bcd = {BCD_WIDTH{1'b0}};
        bin = bin_in;

        for (i = 0; i < BIN_WIDTH; i = i + 1) begin
            // 对每个 BCD 位检查是否 >= 5，是则加 3
            for (k = 0; k < BCD_WIDTH/4; k = k + 1) begin
                if (bcd[k*4 +: 4] >= 4'd5)
                    bcd[k*4 +: 4] = bcd[k*4 +: 4] + 4'd3;
            end

            // 整体左移，二进制最高位进入 BCD 最低位
            bcd = (bcd << 1) | bin[BIN_WIDTH-1];
            bin = bin << 1;
        end

        bcd_out = bcd;
    end
endmodule
