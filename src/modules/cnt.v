module ScanCounter #(
    // 每个状态持续多少个时钟周期
    parameter integer CYCLES_PER_STEP = 25000,
    // 状态数(这里 4 个状态覆盖 8 个数码管)
    parameter integer STEP_COUNT      = 4,
    // 输出计数的位宽，取能表示 STEP_COUNT 的最小值
    parameter integer CNT_WIDTH       = $clog2(STEP_COUNT)
) (
    input  wire                  clk,
    input  wire                  rst_n,     // 低有效复位，可选
    output reg  [CNT_WIDTH-1:0]  step       // 0 ~ STEP_COUNT-1
);
    // 计算计数器的位宽和最大值
    localparam integer DIV_WIDTH = (CYCLES_PER_STEP > 1) ? $clog2(CYCLES_PER_STEP) : 1;
    localparam [DIV_WIDTH-1:0] DIV_LAST = CYCLES_PER_STEP - 1;

    reg [DIV_WIDTH-1:0] div_cnt;

    // 计数器逻辑
    always @(posedge clk or negedge rst_n) begin
        // 复位信号低有效
        if (!rst_n) begin
            div_cnt <= 0;
            step    <= 0;
        end else if (div_cnt == DIV_LAST) begin
            div_cnt <= 0;
            if (step == STEP_COUNT - 1)
                step <= 0;
            else
                step <= step + 1'b1;
        end else begin
            div_cnt <= div_cnt + 1'b1;
        end
    end
endmodule