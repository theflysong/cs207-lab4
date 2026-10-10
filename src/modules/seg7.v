module Driver7Seg #(
    parameter integer SEG7CLK_CYCLES = 25000
) (
    input  wire        clk,
    input  wire [63:0] seg_sels,
    output wire [7:0]  seg7_ss0,
    output wire [7:0]  seg7_ss1,
    // 片选信号, 高电平有效
    output wire [7:0]  seg7_cs
);
    // 实例化化扫描计数器, 4 个状态, 每状态 SEG7CLK_CYCLES 个时钟
    wire [1:0] inner_cnt;

    ScanCounter #(
        .CYCLES_PER_STEP (SEG7CLK_CYCLES),
        .STEP_COUNT      (4),
        .CNT_WIDTH       (2)
    ) u_scan (
        .clk   (clk),
        .rst_n (1'b1),      // 无复位信号, 直接接 1
        .step  (inner_cnt)
    );

    reg [7:0] __ss0, __ss1, __cs;
    assign seg7_ss0 = __ss0;
    assign seg7_ss1 = __ss1;
    assign seg7_cs  = __cs;

    always @(*) begin
        __ss0 = 8'b0;
        __ss1 = 8'b0;
        __cs  = 8'b0;
        case (inner_cnt)
            2'd0: begin
                __ss0 = seg_sels[39:32];
                __ss1 = seg_sels[7:0];
                __cs  = 8'b00010001;
            end
            2'd1: begin
                __ss0 = seg_sels[47:40];
                __ss1 = seg_sels[15:8];
                __cs  = 8'b00100010;
            end
            2'd2: begin
                __ss0 = seg_sels[55:48];
                __ss1 = seg_sels[23:16];
                __cs  = 8'b01000100;
            end
            default: begin
                __ss0 = seg_sels[63:56];
                __ss1 = seg_sels[31:24];
                __cs  = 8'b10001000;
            end
        endcase
    end

endmodule