module main (
    input  wire        clk,
    input  wire [7:0]  sw,
    output wire [7:0]  seg7_ss0,
    output wire [7:0]  seg7_ss1,
    // 片选信号, 高电平有效
    output wire [7:0]  seg7_cs
);
    wire [11:0] __bcd_code;
    wire [63:0] __seg_sels;

    Bin2Bcd #(.BIN_WIDTH(8), .BCD_WIDTH(12)) bcd_converter (
        .bin_in(sw),
        .bcd_out(__bcd_code)
    );

    Bcd2Seg7 #(
        .is_coanode(0)
    ) a7sc_1 (
        .bcd_in(__bcd_code[3:0]),
        .seg7_out(__seg_sels[6:0])
    );

    Bcd2Seg7 #(
        .is_coanode(0)
    ) a7sc_2 (
        .bcd_in(__bcd_code[7:4]),
        .seg7_out(__seg_sels[14:8])
    );

    Bcd2Seg7 #(
        .is_coanode(0)
    ) a7sc_3 (
        .bcd_in(__bcd_code[11:8]),
        .seg7_out(__seg_sels[22:16])
    );

    Driver7Seg driver7seg (
        .clk(clk),
        .seg_sels(__seg_sels),
        .seg7_ss0(seg7_ss0),
        .seg7_ss1(seg7_ss1),
        .seg7_cs(seg7_cs),
    );
endmodule