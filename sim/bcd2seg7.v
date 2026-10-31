`ifndef __VCD_FILE__
`define __VCD_FILE__ "bcd2seg7.vcd"
`endif

module tb_bcd2seg7;
    reg [3:0] bcd_in;
    wire [7:0] anode_out;
    wire [7:0] cathode_out;
    integer digit;

    bcd2seg7 anode_dut (
        .bcd_in(bcd_in),
        .seg7_out(anode_out)
    );

    bcd2seg7 #(.is_coanode(0)) cathode_dut (
        .bcd_in(bcd_in),
        .seg7_out(cathode_out)
    );

    function [7:0] expected_cathode;
        input [3:0] value;
        begin
            case (value)
                4'd0: expected_cathode = 8'b00111111;
                4'd1: expected_cathode = 8'b00000110;
                4'd2: expected_cathode = 8'b01011011;
                4'd3: expected_cathode = 8'b01001111;
                4'd4: expected_cathode = 8'b01100110;
                4'd5: expected_cathode = 8'b01101101;
                4'd6: expected_cathode = 8'b01111101;
                4'd7: expected_cathode = 8'b00000111;
                4'd8: expected_cathode = 8'b01111111;
                4'd9: expected_cathode = 8'b01101111;
                default: expected_cathode = 8'b00000000;
            endcase
        end
    endfunction

    initial begin
        bcd_in = 0;

        $dumpfile(`__VCD_FILE__);
        $dumpvars(0, bcd_in, anode_out, cathode_out);

        for (digit = 0; digit < 16; digit = digit + 1) begin
            bcd_in = digit;
            #1;
            if (cathode_out !== expected_cathode(bcd_in))
                $fatal(1, "cathode bcd2seg7: input=%0d got=%b expected=%b",
                       digit, cathode_out, expected_cathode(bcd_in));
            if (anode_out !== ~expected_cathode(bcd_in))
                $fatal(1, "anode bcd2seg7: input=%0d got=%b expected=%b",
                       digit, anode_out, ~expected_cathode(bcd_in));
        end

        $display("PASS: bcd2seg7 anode and cathode, inputs 0-15");
        $finish;
    end
endmodule
