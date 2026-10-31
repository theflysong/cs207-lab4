module main (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [7:0]  sw,
    input  wire [4:0]  btn,
    output wire [7:0]  seg7_ss0,
    output wire [7:0]  seg7_ss1,
    output wire [7:0]  seg7_cs
);
    // 芯片信息
    localparam [31:0] EGO1CLK_FREQ = 100_000_000;

    // 对 btn[2] 进行消抖
    wire btn2_deb, btn2_debpos, btn2_debneg;

    pulse_debounce #(
        .CLK_FREQ       (EGO1CLK_FREQ)
    ) u_btn2_deb (
        .clk            (clk),
        .rst_n          (rst_n),
        .pulse          (btn[2]),
        .deb_pulse      (btn2_deb),
        .deb_posedge    (btn2_debpos),
        .deb_negedge    (btn2_debneg)
    );

    reg [31 : 0] __cnt;
    always @(posedge clk or negedge rst_n) begin
        if (! rst_n)
            __cnt <= {32'b0};
        else begin
            if (btn2_debpos)
                __cnt <= __cnt + 1;
            else
                __cnt <= __cnt;
        end
    end

    // 将 __cnt 转换为 BCD 码, 再转换为 7 段数码管的段选信号

    localparam integer N = 8;
    localparam integer BCD_WIDTH = 4 * N;
    localparam integer SEG7_WIDTH = 8 * N;

    wire [BCD_WIDTH - 1:0] __bcd_code;
    wire [SEG7_WIDTH - 1:0] __seg_sels;

    bin2bcd #(
        .BIN_WIDTH  (32),
        .BCD_WIDTH  (BCD_WIDTH)
    ) u_bin2bcd (
        .bin_in  (__cnt),
        .bcd_out (__bcd_code)
    );

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : gen_seg7
            bcd2seg7 #(
                .is_coanode(0)
            ) u_seg7 (
                .bcd_in(__bcd_code[i*4 +: 4]),
                .seg7_out(__seg_sels[i*8 +: 8])
            );
        end
    endgenerate

    // 将段选信号送入 7 段数码管驱动模块

    driver_7seg u_driver (
        .clk      (clk),
        .seg_sels (__seg_sels),
        .seg7_ss0 (seg7_ss0),
        .seg7_ss1 (seg7_ss1),
        .seg7_cs  (seg7_cs)
    );
endmodule