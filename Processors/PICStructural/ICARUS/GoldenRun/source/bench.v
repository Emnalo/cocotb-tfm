`timescale 1ns / 1ps

module pic_core_test;

    parameter CLK_PERIOD = 10;
    reg t_clock = 0;
    reg t_reset;
    wire [7:0] t_port_a;
    wire [7:0] t_port_b;
    wire [7:0] t_port_c;

    pic_core top (
        .clock(t_clock),
        .reset(t_reset),
        .port_a(t_port_a),
        .port_b(t_port_b),
        .port_c(t_port_c)
    );
    always begin
        #(CLK_PERIOD / 2) t_clock = ~t_clock;
    end

    initial begin
        t_reset = 1;
    	# (CLK_PERIOD/2);
        t_reset = 0;
        # (100 * CLK_PERIOD);
        t_reset = 1;
        # (900 * CLK_PERIOD);
        $finish;
    end
    initial begin
        $dumpfile("pic_core_test.vcd");
        $dumpvars(0, pic_core_test);
    end

endmodule

