`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2024 19:41:20
// Design Name: 
// Module Name: pic_ctrl
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


module pic_ctrl(
       input [11:0] inst,
       input [4:0] file_addr,
       input zero,
       output reg [3:0] alu_op,
       output reg tris_a_wen,
       output reg tris_b_wen,
       output reg tris_c_wen,
       output reg port_a_wen,
       output reg port_b_wen,
       output reg port_c_wen,
       output reg port_a_oen,
       output reg port_b_oen,
       output reg port_c_oen,
       output reg w_wen     ,
       output reg w_a_oen   ,
       output reg w_b_oen   ,
       output reg pc_wen    ,
       output reg pc_oen    ,
       output reg pc_push   ,
       output reg pc_pop    ,
       output reg pc_load   ,
       output reg fsr_wen   ,
       output reg fsr_oen   ,
       output reg rtcc_wen  ,
       output reg rtcc_oen  ,
       output reg file_wen  ,
       output reg file_oen  ,
       output reg inst_skip ,
       output reg imm_oen   ,
       output reg status_oen,
       output reg status_wen,
       output reg carry_wen ,
       output reg zero_wen  ,
       output reg const_oen ,
       output reg const_01  
    );
    
    localparam [3:0] ALUOP_ADD        = 4'b0000;
    localparam [3:0] ALUOP_SUB        = 4'b0001;
    localparam [3:0] ALUOP_AND        = 4'b0010;
    localparam [3:0] ALUOP_OR         = 4'b0011;
    localparam [3:0] ALUOP_XOR        = 4'b0100;
    localparam [3:0] ALUOP_COM        = 4'b0101;
    localparam [3:0] ALUOP_ROR        = 4'b0110;
    localparam [3:0] ALUOP_ROL        = 4'b0111;
    localparam [3:0] ALUOP_SWAP       = 4'b1000;
    localparam [3:0] ALUOP_BITCLR     = 4'b1001;
    localparam [3:0] ALUOP_BITSET     = 4'b1010;
    localparam [3:0] ALUOP_BITTESTCLR = 4'b1011;
    localparam [3:0] ALUOP_BITTESTSET = 4'b1100;
    localparam [3:0] ALUOP_PASSA      = 4'b1101;
    localparam [3:0] ALUOP_PASSB      = 4'b1110;
    
    localparam [11:0] NOP   = 12'b000000000000;
    localparam [6:0] MOVWF  = 7'b0000001;
    localparam [6:0] CLRW   = 7'b0000010;
    localparam [6:0] CLRF   = 7'b0000011;
    localparam [5:0] SUBWF  = 6'b000010;
    localparam [5:0] DECF   = 6'b000011;
    localparam [5:0] IORWF  = 6'b000100;
    localparam [5:0] ANDWF  = 6'b000101;
    localparam [5:0] XORWF  = 6'b000110;
    localparam [5:0] ADDWF  = 6'b000111;
    localparam [5:0] MOVF   = 6'b001000;
    localparam [5:0] COMF   = 6'b001001;
    localparam [5:0] INCF   = 6'b001010;
    localparam [5:0] DECFSZ = 6'b001011;
    localparam [5:0] RRF    = 6'b001100;
    localparam [5:0] RLF    = 6'b001101;
    localparam [5:0] SWAPF  = 6'b001110;
    localparam [5:0] INCFSZ = 6'b001111;
    localparam [3:0] BCF    = 4'b0100;
    localparam [3:0] BSF    = 4'b0101;
    localparam [3:0] BTFSC  = 4'b0110;
    localparam [3:0] BTFSS  = 4'b0111;
    localparam [11:0] OPTION = 12'b000000000010;
    localparam [11:0] SLEEP  = 12'b000000000011;
    localparam [11:0] CLRWDT = 12'b000000000100;
    localparam [9:0] TRIS   = 10'b0000000001;
    localparam [3:0] RETLW  = 4'b1000;
    localparam [3:0] CALL   = 4'b1001;
    localparam [2:0] GOTO   = 3'b101;
    localparam [3:0] MOVLW  = 4'b1100;
    localparam [3:0] IORLW  = 4'b1101;
    localparam [3:0] ANDLW  = 4'b1110;
    localparam [3:0] XORLW  = 4'b1111;

    reg file_moen;
    reg file_mwen;

    wire dest;

    wire [1:0] tris_sel;

    assign dest = inst[5];
    assign tris_sel = inst[1:0];

    always @(file_moen, file_mwen, file_addr) begin
        rtcc_oen   <= 1'b0;  
        pc_oen     <= 1'b0;
        status_oen <= 1'b0;
        fsr_oen    <= 1'b0;
        port_a_oen <= 1'b0;
        port_b_oen <= 1'b0;
        port_c_oen <= 1'b0;
        file_oen   <= 1'b0;
        rtcc_wen   <= 1'b0;
        pc_wen     <= 1'b0;
        status_wen <= 1'b0;
        fsr_wen    <= 1'b0;
        port_a_wen <= 1'b0;
        port_b_wen <= 1'b0;
        port_c_wen <= 1'b0;
        file_wen   <= 1'b0;
        
		if (file_moen == 1'b1) begin
            case (file_addr)
                5'b00001 : rtcc_oen   <= 1'b1;
                5'b00010 : pc_oen     <= 1'b1;
                5'b00011 : status_oen <= 1'b1;
                5'b00100 : fsr_oen    <= 1'b1;
                5'b00101 : port_a_oen <= 1'b1;
                5'b00110 : port_b_oen <= 1'b1;
                5'b00111 : port_c_oen <= 1'b1;
                default  : file_oen   <= 1'b1;
            endcase
        end

        if (file_mwen == 1'b1) begin
            case (file_addr) 
                5'b00001 : rtcc_wen   <= 1'b1;
                5'b00010 : pc_wen     <= 1'b1;
                5'b00011 : status_wen <= 1'b1;
                5'b00100 : fsr_wen    <= 1'b1;
                5'b00101 : port_a_wen <= 1'b1;
                5'b00110 : port_b_wen <= 1'b1;
                5'b00111 : port_c_wen <= 1'b1;
                default  : file_wen   <= 1'b1;
            endcase
        end        
    end
        
    always @(inst, dest, zero, tris_sel) begin
        tris_a_wen <= 1'b0;  
        tris_b_wen <= 1'b0;  
        tris_c_wen <= 1'b0;  
        w_wen      <= 1'b0;
        w_a_oen    <= 1'b0;
        w_b_oen    <= 1'b0;
        pc_push    <= 1'b0;
        pc_pop     <= 1'b0;
        pc_load    <= 1'b0;
        inst_skip  <= 1'b0;
        imm_oen    <= 1'b0;
        carry_wen  <= 1'b0;
        zero_wen   <= 1'b0;
        const_oen  <= 1'b0;
        const_01   <= 1'b0;
        file_moen  <= 1'b0;
        file_mwen  <= 1'b0;
        alu_op     <= 4'bx;

        if (inst[11:0] == NOP) begin
			;
		end
        else if (inst[11:6] == ADDWF) begin
            w_b_oen <= 1'b1;                    
            file_moen <= 1'b1;                  
            alu_op <= ALUOP_ADD;               
            carry_wen <= 1'b1;                  
            zero_wen <= 1'b1;                   
            if (dest == 1'b0) begin
                w_wen <= 1'b1;                  
            end
            else begin
                file_mwen <= 1'b1;              
            end                          
        end
        else if (inst[11:6] == ANDWF) begin
            w_b_oen <= 1'b1;                    
            file_moen <= 1'b1;                  
            alu_op <= ALUOP_AND;               
            zero_wen <= 1'b1;                   
            if (dest == 1'b0) begin
                w_wen <= 1'b1;                  
            end
            else begin
                file_mwen <= 1'b1;              
            end                          
        end
        else if (inst[11:5] == CLRF) begin
            const_oen <= 1'b1;
            const_01  <= 1'b0;                  
            alu_op <= ALUOP_PASSB;             
            file_mwen <= 1'b1;                  
            zero_wen <= 1'b1;                   
        end
        else if (inst[11:5] == CLRW) begin
            const_oen <= 1'b1;
            const_01  <= 1'b0;                  
            alu_op <= ALUOP_PASSB;             
            w_wen <= 1'b1;                      
            zero_wen <= 1'b1;                   
        end
        else if (inst[11:6] == COMF) begin
            file_moen <= 1'b1;                  
            alu_op <= ALUOP_COM;               
            if (dest == 1'b0) begin
                w_wen <= 1'b1;                  
            end
            else begin
                file_mwen <= 1'b1;              
            end                          
            zero_wen <= 1'b1;                   
        end
        else if (inst[11:6] == DECF) begin
            file_moen <= 1'b1;                  
            const_oen <= 1'b1;
            const_01  <= 1'b1;                  
            alu_op <= ALUOP_SUB;               
            if (dest == 1'b0) begin
                w_wen <= 1'b1;                  
            end
            else begin
                file_mwen <= 1'b1;              
            end                          
            zero_wen <= 1'b1;                   
        end
        else if (inst[11:6] == DECFSZ) begin
            file_moen <= 1'b1;                  
            const_oen <= 1'b1;
            const_01  <= 1'b1;                  
            alu_op <= ALUOP_SUB;               
            if (dest == 1'b0) begin
                w_wen <= 1'b1;                  
            end
            else begin
                file_mwen <= 1'b1;              
            end                          
            if (zero == 1'b1) begin
                inst_skip <= 1'b1;              
            end
        end
        else if (inst[11:6] == INCF) begin
            file_moen <= 1'b1;                  
            const_oen <= 1'b1;
            const_01  <= 1'b1;                  
            alu_op <= ALUOP_ADD;               
            if (dest == 1'b0) begin
                w_wen <= 1'b1;                  
            end
            else begin
                file_mwen <= 1'b1;              
            end                          
            zero_wen <= 1'b1;                   
        end
        else if (inst[11:6] == INCFSZ) begin
            file_moen <= 1'b1;                  
            const_oen <= 1'b1;
            const_01  <= 1'b1;                  
            alu_op <= ALUOP_ADD;               
            if (dest == 1'b0) begin
                w_wen <= 1'b1;                  
            end
            else begin
                file_mwen <= 1'b1;              
            end                          
            if (zero == 1'b1) begin
                inst_skip <= 1'b1;              
            end
        end
        else if (inst[11:6] == IORWF) begin
            w_b_oen <= 1'b1;                    
            file_moen <= 1'b1;                  
            alu_op <= ALUOP_OR;                
            zero_wen <= 1'b1;                   
            if (dest == 1'b0) begin
                w_wen <= 1'b1;                  
            end
            else begin
                file_mwen <= 1'b1;              
            end                          
        end
        else if (inst[11:6] == MOVF) begin
            file_moen <= 1'b1;                  
            alu_op <= ALUOP_PASSA;             
            zero_wen <= 1'b1;                   
            if (dest == 1'b0) begin
                w_wen <= 1'b1;                  
            end
            else begin
                file_mwen <= 1'b1;              
            end                          
        end
        else if (inst[11:5] == MOVWF) begin
            w_a_oen <= 1'b1;                    
            alu_op <= ALUOP_PASSA;             
            file_mwen <= 1'b1;                  
        end
        else if (inst[11:6] == RLF) begin
            file_moen <= 1'b1;                  
            alu_op <= ALUOP_ROL;               
            carry_wen <= 1'b1;                  
            if (dest == 1'b0) begin
                w_wen <= 1'b1;                  
            end
            else begin
                file_mwen <= 1'b1;              
            end                          
        end
        else if (inst[11:6] == RRF) begin
            file_moen <= 1'b1;                  
            alu_op <= ALUOP_ROR;               
            carry_wen <= 1'b1;                  
            if (dest == 1'b0) begin
                w_wen <= 1'b1;                  
            end
            else begin
                file_mwen <= 1'b1;              
            end                          
        end
        else if (inst[11:6] == SUBWF) begin
            w_b_oen <= 1'b1;                    
            file_moen <= 1'b1;                  
            alu_op <= ALUOP_SUB;               
            carry_wen <= 1'b1;                  
            zero_wen <= 1'b1;                   
            if (dest == 1'b0) begin
                w_wen <= 1'b1;                  
            end
            else begin
                file_mwen <= 1'b1;              
            end                          
        end
        else if (inst[11:6] == SWAPF) begin
            file_moen <= 1'b1;                  
            alu_op <= ALUOP_SWAP;              
            if (dest == 1'b0) begin
                w_wen <= 1'b1;                  
            end
            else begin
                file_mwen <= 1'b1;              
            end                          
        end
        else if (inst[11:6] == XORWF) begin
            w_b_oen <= 1'b1;                    
            file_moen <= 1'b1;                  
            alu_op <= ALUOP_XOR;               
            zero_wen <= 1'b1;                   
            if (dest == 1'b0) begin
                w_wen <= 1'b1;                  
            end
            else begin
                file_mwen <= 1'b1;              
            end                          
        end
        else if (inst[11:8] == BCF) begin
            file_moen <= 1'b1;                  
            imm_oen <= 1'b1;                    
            alu_op <= ALUOP_BITCLR;            
            file_mwen <= 1'b1;                  
        end
        else if (inst[11:8] == BSF) begin
            file_moen <= 1'b1;                  
            imm_oen <= 1'b1;                    
            alu_op <= ALUOP_BITSET;            
            file_mwen <= 1'b1;                  
        end
        else if (inst[11:8] == BTFSC) begin
            file_moen <= 1'b1;                  
            imm_oen <= 1'b1;                    
            alu_op <= ALUOP_BITTESTCLR;        
            if (zero == 1'b1) begin
                inst_skip <= 1'b1;              
            end
        end
        else if (inst[11:8] == BTFSS) begin
            file_moen <= 1'b1;                  
            imm_oen <= 1'b1;                    
            alu_op <= ALUOP_BITTESTSET;        
            if (zero == 1'b1) begin
                inst_skip <= 1'b1;              
            end
        end
        else if (inst[11:8] == ANDLW) begin
            w_a_oen <= 1'b1;                    
            imm_oen <= 1'b1;                    
            alu_op <= ALUOP_AND;               
            zero_wen <= 1'b1;                   
            w_wen <= 1'b1;                      
        end
        else if (inst[11:8] == IORLW) begin
            w_a_oen <= 1'b1;                    
            imm_oen <= 1'b1;                    
            alu_op <= ALUOP_OR;                
            zero_wen <= 1'b1;                   
            w_wen <= 1'b1;                      
        end
        else if (inst[11:8] == XORLW) begin
            w_a_oen <= 1'b1;                    
            imm_oen <= 1'b1;                    
            alu_op <= ALUOP_XOR;               
            zero_wen <= 1'b1;                   
            w_wen <= 1'b1;                      
        end
        else if (inst[11:8] == MOVLW) begin
            imm_oen <= 1'b1;                    
            alu_op <= ALUOP_PASSB;             
            w_wen <= 1'b1;                      
        end
        else if (inst[11:9] == GOTO) begin
            pc_load <= 1'b1;
            inst_skip <= 1'b1;                  
        end
        else if (inst[11:8] == CALL) begin
            imm_oen <= 1'b1;                    
            alu_op <= ALUOP_PASSB;             
            pc_push <= 1'b1;                    
            inst_skip <= 1'b1;                  
        end
        else if (inst[11:8] == RETLW) begin
            pc_pop <= 1'b1;                     
            imm_oen <= 1'b1;                    
            alu_op <= ALUOP_PASSB;             
            w_wen <= 1'b1;                      
            inst_skip <= 1'b1;                  
        end
        else if (inst[11:2] == TRIS) begin
            w_a_oen <= 1'b1;                    
            alu_op <= ALUOP_PASSA;             
            case (tris_sel)
              2'b01 : tris_a_wen <= 1'b1;  
              2'b10 : tris_b_wen <= 1'b1;
              2'b11 : tris_c_wen <= 1'b1;
              default : ;
            endcase
        end
        else if (inst[11:0] == OPTION) begin
            ;
        end
        else if (inst[11:0] == SLEEP) begin
            ;
        end
        else if (inst[11:0] == CLRWDT) begin
            ;
        end
                
    end
            
endmodule
