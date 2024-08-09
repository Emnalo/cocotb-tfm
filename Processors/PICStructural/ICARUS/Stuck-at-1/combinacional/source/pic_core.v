`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2024 20:23:19
// Design Name: 
// Module Name: pic_core
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

module pic_core(
    input clock,
    input reset,
    
    inout [7:0] port_a,
    inout [7:0] port_b,
    inout [7:0] port_c
    );
    
    wire [7:0] bus_a, bus_b, bus_out;
    
    wire [8:0] pic_rom_addr;
    wire [11:0] pic_rom_data;
    
    wire carry_new;
    wire carry_old;
    wire zero;
    wire [3:0] alu_op;
    
    wire [4:0] fsr;
    
    wire [4:0] file_addr;
    
    wire [11:0] inst;
    
    wire [7:0] port_a_tri;
    wire [7:0] port_b_tri;
    wire [7:0] port_c_tri;
    
    wire port_a_oen;
    wire port_b_oen;
    wire port_c_oen;
    wire port_a_wen; 
    wire port_b_wen; 
    wire port_c_wen;
    wire tris_a_wen;
    wire tris_b_wen;
    wire tris_c_wen;
    wire w_wen;
    wire w_a_oen;
    wire w_b_oen;
    wire pc_wen;
    wire pc_oen;
    wire pc_push;
    wire pc_pop;
    wire pc_load;
    wire fsr_wen;
    wire fsr_oen;
    wire rtcc_wen;
    wire rtcc_oen;
    wire file_wen;
    wire file_oen;
    wire inst_skip;
    wire imm_oen;
    wire status_oen;
    wire status_wen;
    wire carry_wen;
    wire zero_wen;
    wire const_oen;
    wire const_01;
        
    pic_rom rom
       (
         .Addr (pic_rom_addr),
         .Data (pic_rom_data)
       );
    
    reg_io port_a_reg 
         (
           .clock     (clock),
           .out_en    (port_a_oen),
           .write_en  (port_a_wen),
           .data_in   (bus_out),
           .data_out  (bus_a),
           .inout_sel (port_a_tri),
           .dataport  (port_a)
         );

    reg_io port_b_reg 
         (
           .clock     (clock),
           .out_en    (port_b_oen),
           .write_en  (port_b_wen),
           .data_in   (bus_out),
           .data_out  (bus_a),
           .inout_sel (port_b_tri),
           .dataport  (port_b)
         );
    
    reg_io port_c_reg 
         (
           .clock     (clock),
           .out_en    (port_c_oen),
           .write_en  (port_c_wen),
           .data_in   (bus_out),
           .data_out  (bus_a),
           .inout_sel (port_c_tri),
           .dataport  (port_c)
         );
    
    reg_w working_register 
         (
           .clock      (clock),
           .out_a_en   (w_a_oen),
           .out_b_en   (w_b_oen),
           .write_en   (w_wen),
           .data_in    (bus_out),
           .data_a_out (bus_a),
           .data_b_out (bus_b)
         );
         
    reg_8rst io_conf_port_a 
         (
           .clock     (clock),
           .reset     (reset),
           .write_en  (tris_a_wen),
           .data_in   (bus_out),
           .data_out  (port_a_tri)
         );

    reg_8rst io_conf_port_b 
         (
           .clock     (clock),
           .reset     (reset),
           .write_en  (tris_b_wen),
           .data_in   (bus_out),
           .data_out  (port_b_tri)
         );

       reg_8rst io_conf_port_c 
         (
           .clock     (clock),
           .reset     (reset),
           .write_en  (tris_c_wen),
           .data_in   (bus_out),
           .data_out  (port_c_tri)
         );
 
     reg_inst instruction_register 
         (
           .clock     (clock),
           .reset     (reset),
           .skip      (inst_skip),
           .out_en    (imm_oen),
           .inst_in   (pic_rom_data),
           .inst_out  (inst),
           .imm_out   (bus_b)
         );

    reg_fsr fsr_register 
         (
           .clock     (clock),
           .out_en    (fsr_oen),
           .write_en  (fsr_wen),
           .data_in   (bus_out),
           .data_out  (bus_a),
           .fsr_out   (fsr)
         );

    fadr_mux file_address_mux 
         (
           .inst_5     (inst[4:0]),
           .fsr        (fsr),
           .file_addr  (file_addr)
         );

    reg_file register_file 
         (
           .clock    (clock),
           .write_en (file_wen),
           .out_en   (file_oen),
           .address  (file_addr),
           .data_in  (bus_out),
           .data_out (bus_a)
         );

    reg_pc program_counter 
         (
           .clock     (clock),
           .reset     (reset),
           .out_en    (pc_oen),
           .write_en  (pc_wen),
           .data_in   (bus_out),
           .data_out  (bus_a),
           .addr_in   (inst[8:0]),
           .addr_out  (pic_rom_addr),
           .push      (pc_push),
           .pop       (pc_pop),
           .load      (pc_load)
         );

    reg_s status_register 
         (
           .clock     (clock),
           .reset     (reset),
           .out_en    (status_oen),
           .write_en  (status_wen),
           .data_in   (bus_out),
           .data_out  (bus_a),
           .carry_out (carry_old),
           .carry_in  (carry_new),
           .zero_in   (zero),
           .carry_wr  (carry_wen),
           .zero_wr   (zero_wen)
         );

    reg_cons constants_generator 
         (
           .out_en    (const_oen),
           .const_01  (const_01),
           .data_out  (bus_b)
         );

    reg_8t rtcc 
         (
           .clock     (clock),
           .out_en    (rtcc_oen),
           .write_en  (rtcc_wen),
           .data_in   (bus_out),
           .data_out  (bus_a)
         );

    pic_alu alu 
       (
           .operation  (alu_op),
           .a          (bus_a),
           .b          (bus_b),
           .res        (bus_out),
           .carry_in   (carry_old),
           .carry_out  (carry_new),
           .zero       (zero)
       );

    pic_ctrl controller 
       (
         .inst       (inst),
         .file_addr  (file_addr),
         .zero       (zero),
         .alu_op     (alu_op),
         .tris_a_wen (tris_a_wen),
         .tris_b_wen (tris_b_wen),
         .tris_c_wen (tris_c_wen),
         .port_a_wen (port_a_wen),
         .port_b_wen (port_b_wen),
         .port_c_wen (port_c_wen),
         .w_wen      (w_wen),
         .w_a_oen    (w_a_oen),
         .w_b_oen    (w_b_oen),
         .pc_wen     (pc_wen),
         .pc_oen     (pc_oen),
         .pc_push    (pc_push),
         .pc_pop     (pc_pop),
         .pc_load    (pc_load),
         .fsr_wen    (fsr_wen),
         .fsr_oen    (fsr_oen),
         .rtcc_wen   (rtcc_wen),
         .rtcc_oen   (rtcc_oen),
         .file_wen   (file_wen),
         .file_oen   (file_oen),
         .inst_skip  (inst_skip),
         .imm_oen    (imm_oen),
         .status_oen (status_oen),
         .status_wen (status_wen),
         .carry_wen  (carry_wen),
         .zero_wen   (zero_wen),
         .port_a_oen (port_a_oen),
         .port_b_oen (port_b_oen),
         .port_c_oen (port_c_oen),
         .const_oen  (const_oen),
         .const_01   (const_01)
       );

endmodule
