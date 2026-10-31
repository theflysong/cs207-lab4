//!bcd2seg7.v
//!
//!Author: theflysong (song_of_the_fly@163.com)
//!
//!# BCD转7段数码管模块
//!

//!## BCD 转 7-Segment 模块
//!
//!### Parameters
//!
//! - `parameter is_coanode` : 选择共阳极或共阴极的 7 段数码管, 默认值为 1, 即共阳极
//!
//!### Ports
//!
//! - `input [3:0] bcd_in` : 输入 BCD 数
//! - `output reg [7:0] seg7_out` : 输出 7-Seg 数码管的段选信号
//!
//!### Description
//!
//!将 BCD 数转换为 7 段数码管的段选信号, 支持共阳极和共阴极两种类型的数码管.
//!
module bcd2seg7 #(
    parameter integer is_coanode = 1
)(
    input [3:0] bcd_in,
    output reg [7:0] seg7_out
);
    // 共阴极编码: 1 表示点亮, 0 表示熄灭
    // 位序：abcdefg
    always @(*) begin
        case (bcd_in)
            4'd0: seg7_out = 8'b00111111;
            4'd1: seg7_out = 8'b00000110;
            4'd2: seg7_out = 8'b01011011;
            4'd3: seg7_out = 8'b01001111;
            4'd4: seg7_out = 8'b01100110;
            4'd5: seg7_out = 8'b01101101;
            4'd6: seg7_out = 8'b01111101;
            4'd7: seg7_out = 8'b00000111;
            4'd8: seg7_out = 8'b01111111;
            4'd9: seg7_out = 8'b01101111;
            default: seg7_out = 8'b00000000; // 非 BCD 输入, 熄灭
        endcase

        // 共阳极低电平点亮, 因此对共阴极编码取反
        if (is_coanode)
            seg7_out = ~seg7_out;
    end
endmodule