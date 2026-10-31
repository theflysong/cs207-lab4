`ifndef __VCD_FILE__
`define __VCD_FILE__ "main.vcd"
`endif

module tb_main;
    reg        clk;
    always #5 clk = ~clk; // 100 MHz

    reg rst_n;
    reg [4:0] btn;

    wire [7:0]  sw;
    assign sw = 8'b0000_0000;

    wire  [7:0]  seg7_ss0;
    wire  [7:0]  seg7_ss1;
    // 片选信号, 高电平有效
    wire  [7:0]  seg7_cs;

    main dut (
        .clk      (clk),
        .rst_n    (rst_n),
        .sw       (sw),
        .btn      (btn),
        .seg7_ss0 (seg7_ss0),
        .seg7_ss1 (seg7_ss1),
        .seg7_cs  (seg7_cs)
    );

    initial begin
        clk = 1'b0;
        rst_n = 1'b0;
        btn = 5'b0;
        $display("t=%0t clk=%b", $time, clk);
        $dumpfile(`__VCD_FILE__);
        $dumpvars(0, rst_n, btn, seg7_ss0, seg7_ss1, seg7_cs);

        #100;
        rst_n = 1'b1;
        #100;
        btn[2] = 1'b1;
        #21_000_000;
        btn[2] = 1'b0;
        #21_000_000;

        $display("main reset and button stimulus completed");
        $finish;
    end
endmodule
