//!pulse.v
//!
//!Author: theflysong (song_of_the_fly@163.com)
//!
//!# 脉冲源相关
//!

//!## 脉冲边沿对齐模块
//!
//!### Parameters
//!
//!### Ports
//!
//! - `input wire clk` : 时钟信号
//! - `input wire rst_n` : 低有效复位信号
//! - `input wire pulse` : 脉冲信号
//! - `output wire posedge_pulse` : 上升沿脉冲信号
//! - `output wire negedge_pulse` : 下降沿脉冲信号
//!
//!### Description
//!
//!对脉冲信号进行边缘检测, 使其与时钟信号对齐, 生成上升沿和下降沿脉冲信号.
//!
module pulse_edge_align (
    input wire clk,
    input wire rst_n,
    input wire pulse,
    output wire posedge_pulse,
    output wire negedge_pulse
);
    // 上一个时钟周期的脉冲信号
    reg pulse_d;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            pulse_d <= 1'b0;
        else
            pulse_d <= pulse;
    end

    assign posedge_pulse = pulse & ~pulse_d; // 上升沿检测
    assign negedge_pulse = ~pulse & pulse_d; // 下降沿检测
endmodule

//!## 脉冲边沿消抖模块
//!
//!### Parameters
//!
//! - `parameter integer CLK_FREQ`: clk 信号的频率(Hz)
//! - `parameter integer DEBOUNCE_TIME`: 消抖时长(ns)
//!
//!### Ports
//!
//! - `input wire clk` : 时钟信号
//! - `input wire rst_n` : 低有效复位信号
//! - `input wire pulse` : 脉冲信号
//! - `output wire deb_pulse` :   消抖后脉冲信号
//! - `output wire deb_posedge` : 上升沿脉冲信号
//! - `output wire deb_negedge` : 下降沿脉冲信号
//!
//!### Description
//!
//!对脉冲信号进行消抖与边缘检测, 使其与时钟信号对齐.
//!
module pulse_debounce#(
    parameter integer CLK_FREQ = 100_000_000,
    parameter integer DEBOUNCE_TIME = 20_000_000
) (
    input clk,
    input wire rst_n,
    input wire pulse,
    output reg deb_pulse,
    output wire deb_posedge,
    output wire deb_negedge
);
    localparam integer DEBOUNCE_CYCLES = (DEBOUNCE_TIME / 1_000) * (CLK_FREQ / 1_000) / 1_000;

    //--- 电平型消抖 ---
    reg [31:0] cnt;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt       <= 31'd0;
            deb_pulse <= 1'b0;
        end
        else if (pulse == deb_pulse)
            cnt <= 31'd0;
        else if (cnt == DEBOUNCE_CYCLES - 1) begin
            deb_pulse <= pulse;
            cnt       <= 31'd0;
        end
        else
            cnt <= cnt + 1'b1;
    end

    pulse_edge_align u_edge(
        .clk(clk),
        .rst_n(rst_n),
        .pulse(deb_pulse),
        .posedge_pulse(deb_posedge),
        .negedge_pulse(deb_negedge)
    );

endmodule