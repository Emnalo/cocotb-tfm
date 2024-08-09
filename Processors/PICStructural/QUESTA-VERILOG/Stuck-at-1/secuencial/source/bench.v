`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2024 20:46:58
// Design Name: 
// Module Name: bench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module bench(

    );
    parameter CLK_PERIOD = 10; // in ns
    
      reg t_clock;
      reg t_reset;
      wire [7:0] t_port_a;
      wire [7:0] t_port_b;
      wire [7:0] t_port_c;
    
    initial begin
        t_clock <= 1'b0;
        t_reset <= 1'b1;
        #5 t_reset <= 1'b0;
        #1000 t_reset <= 1'b1; 
    end

    always begin
        #(CLK_PERIOD/2) t_clock <= ~t_clock;
    end  
      
    initial begin
    $dumpfile("iverilog.vcd");
    $dumpvars(0,bench);
    end
    
  pic_core top 
    (
	   .clock  (t_clock),
	   .reset  (t_reset),
	   .port_a (t_port_a),
	   .port_b (t_port_b),
	   .port_c (t_port_c)
	 ) ;
    
endmodule
