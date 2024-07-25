`timescale 1ns / 1ps



module TbTop(

    );
    
  reg clk;
  reg reset;
  reg [7:0]  Din_p0, Din_p3;
  reg [5:0] Intvec;
  reg FinishFlag;
  reg [15:0] RES[19:0];
  
  wire [7:0] p1_o, p2_o;
  
  parameter cycle= 50.000;
  
initial begin
    clk <= 0;
    forever begin
        #(cycle/2) clk = ~clk;
    end
end


integer cnt = 0;
initial begin
    reset <= 1;
    FinishFlag <= 0;
    Intvec <= 0;
    #(5.2*cycle) reset <= 0;
 end

initial begin
    Din_p0 <= 9;
    Din_p3 <= 0;
    
    #(cycle*35000);
    for(cnt=0;cnt<=20;cnt=cnt+1) begin
        Din_p3 <= cnt;
        #(cycle*200);
        RES[cnt][7:0]  <= p1_o;
        RES[cnt][15:8] <= p2_o;
    end
    
    #(cycle*200) FinishFlag <= 1;
     
end

  
  mc8051_top mc8051_top_0
       (
        .clk(clk),
        .reset(reset),
        .int0_i(1'b0),
        .int1_i(1'b0),
        .all_t0_i(1'b0),
        .all_t1_i(1'b0),    
        .all_rxd_i(1'b0),
      
        .all_rxd_o(),
        .all_rxdwr_o(),
        .all_txd_o(),
        
        .p0_i(Din_p0),
        .p0_o(),
        .p1_i(8'b0),
        .p1_o(p1_o),
        .p2_i(8'b0),
        .p2_o(p2_o),
        .p3_i(Din_p3),
        .p3_o()
        );
        
            
    
endmodule
