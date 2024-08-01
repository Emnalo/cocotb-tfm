-- "pic_ctrl.vhd"
--
-- Copyright (C) 1998  Ernesto Romani  (romani@ascu.unian.it)
--     
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--     
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--     
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
--
--
-- Controller & instruction decoder.

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY pic_ctrl IS
    PORT (
           inst       : IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
           file_addr  : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
           zero       : IN  STD_LOGIC;
           alu_op     : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
           tris_a_wen : OUT STD_LOGIC;
           tris_b_wen : OUT STD_LOGIC;
           tris_c_wen : OUT STD_LOGIC;
           port_a_wen : OUT STD_LOGIC;
           port_b_wen : OUT STD_LOGIC;
           port_c_wen : OUT STD_LOGIC;
           port_a_oen : OUT STD_LOGIC;
           port_b_oen : OUT STD_LOGIC;
           port_c_oen : OUT STD_LOGIC;
           w_wen      : OUT STD_LOGIC;
           w_a_oen    : OUT STD_LOGIC;
           w_b_oen    : OUT STD_LOGIC;
           pc_wen     : OUT STD_LOGIC;
           pc_oen     : OUT STD_LOGIC;
           pc_push    : OUT STD_LOGIC;
           pc_pop     : OUT STD_LOGIC;
           pc_load    : OUT STD_LOGIC;
           fsr_wen    : OUT STD_LOGIC;
           fsr_oen    : OUT STD_LOGIC;
           rtcc_wen   : OUT STD_LOGIC;
           rtcc_oen   : OUT STD_LOGIC;
           file_wen   : OUT STD_LOGIC;
           file_oen   : OUT STD_LOGIC;
           inst_skip  : OUT STD_LOGIC;
           imm_oen    : OUT STD_LOGIC;
           status_oen : OUT STD_LOGIC;
           status_wen : OUT STD_LOGIC;
           carry_wen  : OUT STD_LOGIC;
           zero_wen   : OUT STD_LOGIC;
           const_oen  : OUT STD_LOGIC;
           const_01   : OUT STD_LOGIC
         );
END pic_ctrl;

ARCHITECTURE mixed OF pic_ctrl IS

CONSTANT  ALUOP_ADD        : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
CONSTANT  ALUOP_SUB        : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0001";
CONSTANT  ALUOP_AND        : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0010";
CONSTANT  ALUOP_OR         : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0011";
CONSTANT  ALUOP_XOR        : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0100";
CONSTANT  ALUOP_COM        : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0101";
CONSTANT  ALUOP_ROR        : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0110";
CONSTANT  ALUOP_ROL        : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0111";
CONSTANT  ALUOP_SWAP       : STD_LOGIC_VECTOR (3 DOWNTO 0) := "1000";
CONSTANT  ALUOP_BITCLR     : STD_LOGIC_VECTOR (3 DOWNTO 0) := "1001";
CONSTANT  ALUOP_BITSET     : STD_LOGIC_VECTOR (3 DOWNTO 0) := "1010";
CONSTANT  ALUOP_BITTESTCLR : STD_LOGIC_VECTOR (3 DOWNTO 0) := "1011";
CONSTANT  ALUOP_BITTESTSET : STD_LOGIC_VECTOR (3 DOWNTO 0) := "1100";
CONSTANT  ALUOP_PASSA      : STD_LOGIC_VECTOR (3 DOWNTO 0) := "1101";
CONSTANT  ALUOP_PASSB      : STD_LOGIC_VECTOR (3 DOWNTO 0) := "1110";

CONSTANT NOP    : STD_LOGIC_VECTOR (11 DOWNTO 0) := "000000000000";
CONSTANT MOVWF  : STD_LOGIC_VECTOR (6 DOWNTO 0)  := "0000001";
CONSTANT CLRW   : STD_LOGIC_VECTOR (6 DOWNTO 0)  := "0000010";
CONSTANT CLRF   : STD_LOGIC_VECTOR (6 DOWNTO 0)  := "0000011";
CONSTANT SUBWF  : STD_LOGIC_VECTOR (5 DOWNTO 0)  := "000010";
CONSTANT DECF   : STD_LOGIC_VECTOR (5 DOWNTO 0)  := "000011";
CONSTANT IORWF  : STD_LOGIC_VECTOR (5 DOWNTO 0)  := "000100";
CONSTANT ANDWF  : STD_LOGIC_VECTOR (5 DOWNTO 0)  := "000101";
CONSTANT XORWF  : STD_LOGIC_VECTOR (5 DOWNTO 0)  := "000110";
CONSTANT ADDWF  : STD_LOGIC_VECTOR (5 DOWNTO 0)  := "000111";
CONSTANT MOVF   : STD_LOGIC_VECTOR (5 DOWNTO 0)  := "001000";
CONSTANT COMF   : STD_LOGIC_VECTOR (5 DOWNTO 0)  := "001001";
CONSTANT INCF   : STD_LOGIC_VECTOR (5 DOWNTO 0)  := "001010";
CONSTANT DECFSZ : STD_LOGIC_VECTOR (5 DOWNTO 0)  := "001011";
CONSTANT RRF    : STD_LOGIC_VECTOR (5 DOWNTO 0)  := "001100";
CONSTANT RLF    : STD_LOGIC_VECTOR (5 DOWNTO 0)  := "001101";
CONSTANT SWAPF  : STD_LOGIC_VECTOR (5 DOWNTO 0)  := "001110";
CONSTANT INCFSZ : STD_LOGIC_VECTOR (5 DOWNTO 0)  := "001111";
CONSTANT BCF    : STD_LOGIC_VECTOR (3 DOWNTO 0)   := "0100";
CONSTANT BSF    : STD_LOGIC_VECTOR (3 DOWNTO 0)   := "0101";
CONSTANT BTFSC  : STD_LOGIC_VECTOR (3 DOWNTO 0)   := "0110";
CONSTANT BTFSS  : STD_LOGIC_VECTOR (3 DOWNTO 0)   := "0111";
CONSTANT OPTION : STD_LOGIC_VECTOR (11 DOWNTO 0)  := "000000000010";
CONSTANT SLEEP  : STD_LOGIC_VECTOR (11 DOWNTO 0)  := "000000000011";
CONSTANT CLRWDT : STD_LOGIC_VECTOR (11 DOWNTO 0)  := "000000000100";
CONSTANT TRIS   : STD_LOGIC_VECTOR (9 DOWNTO 0)   := "0000000001";
CONSTANT RETLW  : STD_LOGIC_VECTOR (3 DOWNTO 0)   := "1000";
CONSTANT CALL   : STD_LOGIC_VECTOR (3 DOWNTO 0)   := "1001";
CONSTANT GOTO   : STD_LOGIC_VECTOR (2 DOWNTO 0)   := "101";
CONSTANT MOVLW  : STD_LOGIC_VECTOR (3 DOWNTO 0)   := "1100";
CONSTANT IORLW  : STD_LOGIC_VECTOR (3 DOWNTO 0)   := "1101";
CONSTANT ANDLW  : STD_LOGIC_VECTOR (3 DOWNTO 0)   := "1110";
CONSTANT XORLW  : STD_LOGIC_VECTOR (3 DOWNTO 0)   := "1111";

-- Master output- and write-enable for the "file" registers.
SIGNAL file_moen : STD_LOGIC;
SIGNAL file_mwen : STD_LOGIC;

-- Destination selector ('0' = W, '1' = FILE).
SIGNAL dest : STD_LOGIC;

-- TRIS registers selector.
SIGNAL tris_sel : STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN

    dest <= inst(5);
    tris_sel <= inst(1 DOWNTO 0);
    
    -- This process generates the write- and output-enable signals for all
    -- the registers belonging to the "register file".
    -- This process is pure combinational.

    register_select: PROCESS (file_moen, file_mwen, file_addr)
    BEGIN
        rtcc_oen   <= '0';  -- We assign the default values for every signal.
        pc_oen     <= '0';
        status_oen <= '0';
        fsr_oen    <= '0';
        port_a_oen <= '0';
        port_b_oen <= '0';
        port_c_oen <= '0';
        file_oen   <= '0';
        rtcc_wen   <= '0';
        pc_wen     <= '0';
        status_wen <= '0';
        fsr_wen    <= '0';
        port_a_wen <= '0';
        port_b_wen <= '0';
        port_c_wen <= '0';
        file_wen   <= '0';
        
        IF file_moen = '1' THEN
            CASE file_addr IS
                WHEN "00001" => rtcc_oen   <= '1';
                WHEN "00010" => pc_oen     <= '1';
                WHEN "00011" => status_oen <= '1';
                WHEN "00100" => fsr_oen    <= '1';
                WHEN "00101" => port_a_oen <= '1';
                WHEN "00110" => port_b_oen <= '1';
                WHEN "00111" => port_c_oen <= '1';
                WHEN OTHERS  => file_oen   <= '1';
            END CASE;
        END IF;

        IF file_mwen = '1' THEN
            CASE file_addr IS
                WHEN "00001" => rtcc_wen   <= '1';
                WHEN "00010" => pc_wen     <= '1';
                WHEN "00011" => status_wen <= '1';
                WHEN "00100" => fsr_wen    <= '1';
                WHEN "00101" => port_a_wen <= '1';
                WHEN "00110" => port_b_wen <= '1';
                WHEN "00111" => port_c_wen <= '1';
                WHEN OTHERS  => file_wen   <= '1';
            END CASE;
        END IF;
    END PROCESS;

    -- This is the main control process. It generates all the control signals 
    -- depending on which instruction has to be executed.
    -- This process is pure combinational.
    -- It could be written using concurrent statements, but I think that this
    -- solution is more compact and elegant :)

    main: PROCESS (inst, dest, zero, tris_sel)
    BEGIN
        tris_a_wen <= '0';  -- We assign the default values for every signal.
        tris_b_wen <= '0';  -- This way below we have to assign
        tris_c_wen <= '0';  -- only the signals required by each instruction.
        w_wen      <= '0';
        w_a_oen    <= '0';
        w_b_oen    <= '0';
        pc_push    <= '0';
        pc_pop     <= '0';
        pc_load    <= '0';
        inst_skip  <= '0';
        imm_oen    <= '0';
        carry_wen  <= '0';
        zero_wen   <= '0';
        const_oen  <= '0';
        const_01   <= '0';
        file_moen  <= '0';
        file_mwen  <= '0';
        alu_op     <= "----";

        IF inst(11 DOWNTO 0) = NOP THEN
        -- A NOP is implemented just not issuing any control signal.
        ELSIF inst(11 DOWNTO 6) = ADDWF  THEN
            w_b_oen <= '1';                    -- W on the B bus.
            file_moen <= '1';                  -- FILE on the A bus.
            alu_op <= ALUOP_ADD;               -- Perform an ADDITION.
            carry_wen <= '1';                  -- Update the CARRY flag.
            zero_wen <= '1';                   -- Update the ZERO flag.
            IF dest = '0' THEN
                w_wen <= '1';                  -- Store the result in W.      
            ELSE
                file_mwen <= '1';              -- Store the result in the register file.
            END IF;                          
        ELSIF inst(11 DOWNTO 6) = ANDWF  THEN
            w_b_oen <= '1';                    -- W on the B bus.
            file_moen <= '1';                  -- FILE on the A bus.
            alu_op <= ALUOP_AND;               -- Perform a logical AND.
            zero_wen <= '1';                   -- Update the ZERO flag.
            IF dest = '0' THEN
                w_wen <= '1';                  -- Store the result in W.      
            ELSE
                file_mwen <= '1';              -- Store the result in the register file.
            END IF;                          
        ELSIF inst(11 DOWNTO 5) = CLRF   THEN
            const_oen <= '1';
            const_01  <= '0';                  -- "0" on the B bus.
            alu_op <= ALUOP_PASSB;             -- Copy B to the output.
            file_mwen <= '1';                  -- Store in the register file.            
            zero_wen <= '1';                   -- Update the ZERO flag.
        ELSIF inst(11 DOWNTO 5) = CLRW   THEN
            const_oen <= '1';
            const_01  <= '0';                  -- "0" on the B bus.
            alu_op <= ALUOP_PASSB;             -- Copy B to the output.
            w_wen <= '1';                      -- Store in W.
            zero_wen <= '1';                   -- Update the ZERO flag.
        ELSIF inst(11 DOWNTO 6) = COMF   THEN
            file_moen <= '1';                  -- FILE on the A bus.
            alu_op <= ALUOP_COM;               -- Invert.
            IF dest = '0' THEN
                w_wen <= '1';                  -- Store the result in W.      
            ELSE
                file_mwen <= '1';              -- Store the result in the register file.
            END IF;                          
            zero_wen <= '1';                   -- Update the ZERO flag.
        ELSIF inst(11 DOWNTO 6) = DECF   THEN
            file_moen <= '1';                  -- FILE on the A bus.
            const_oen <= '1';
            const_01  <= '1';                  -- "1" on the B bus.
            alu_op <= ALUOP_SUB;               -- Subtract.
            IF dest = '0' THEN
                w_wen <= '1';                  -- Store the result in W.      
            ELSE
                file_mwen <= '1';              -- Store the result in the register file.
            END IF;                          
            zero_wen <= '1';                   -- Update the ZERO flag.
        ELSIF inst(11 DOWNTO 6) = DECFSZ THEN
            file_moen <= '1';                  -- FILE on the A bus.
            const_oen <= '1';
            const_01  <= '1';                  -- "1" on the B bus.
            alu_op <= ALUOP_SUB;               -- Perform a substraction.
            IF dest = '0' THEN
                w_wen <= '1';                  -- Store the result in W.      
            ELSE
                file_mwen <= '1';              -- Store the result in the register file.
            END IF;                          
            IF zero = '1' THEN
                inst_skip <= '1';              -- Skip next instruction if result is ZERO.
            END IF;
        ELSIF inst(11 DOWNTO 6) = INCF   THEN
            file_moen <= '1';                  -- FILE on the A bus.
            const_oen <= '1';
            const_01  <= '1';                  -- "1" on the B bus.
            alu_op <= ALUOP_ADD;               -- Add.
            IF dest = '0' THEN
                w_wen <= '1';                  -- Store the result in W.      
            ELSE
                file_mwen <= '1';              -- Store the result in the register file.
            END IF;                          
            zero_wen <= '1';                   -- Update the ZERO flag.
        ELSIF inst(11 DOWNTO 6) = INCFSZ THEN
            file_moen <= '1';                  -- FILE on the A bus.
            const_oen <= '1';
            const_01  <= '1';                  -- "1" on the B bus.
            alu_op <= ALUOP_ADD;               -- Add.
            IF dest = '0' THEN
                w_wen <= '1';                  -- Store the result in W.      
            ELSE
                file_mwen <= '1';              -- Store the result in the register file.
            END IF;                          
            IF zero = '1' THEN
                inst_skip <= '1';              -- Skip next instruction if result is ZERO flag.
            END IF;
        ELSIF inst(11 DOWNTO 6) = IORWF  THEN
            w_b_oen <= '1';                    -- W on the B bus.
            file_moen <= '1';                  -- FILE on the A bus.
            alu_op <= ALUOP_OR;                -- Perform a logical OR.
            zero_wen <= '1';                   -- Update the ZERO flag.
            IF dest = '0' THEN
                w_wen <= '1';                  -- Store the result in W.      
            ELSE
                file_mwen <= '1';              -- Store the result in the register file.
            END IF;                          
        ELSIF inst(11 DOWNTO 6) = MOVF   THEN
            file_moen <= '1';                  -- FILE on the A bus.
            alu_op <= ALUOP_PASSA;             -- Copy A to the output.
            zero_wen <= '1';                   -- Update the ZERO flag.
            IF dest = '0' THEN
                w_wen <= '1';                  -- Store the result in W.      
            ELSE
                file_mwen <= '1';              -- Store the result in the register file.
            END IF;
        ELSIF inst(11 DOWNTO 5) = MOVWF  THEN
            w_a_oen <= '1';                    -- W on the A bus.
            alu_op <= ALUOP_PASSA;             -- Copy A to the output.
            file_mwen <= '1';                  -- Store the result in the register file.
        ELSIF inst(11 DOWNTO 6) = RLF    THEN
            file_moen <= '1';                  -- FILE on the A bus.
            alu_op <= ALUOP_ROL;               -- Shift left.
            carry_wen <= '1';                  -- Update the CARRY flag.
            IF dest = '0' THEN
                w_wen <= '1';                  -- Store the result in W.      
            ELSE
                file_mwen <= '1';              -- Store the result in the register file.
            END IF;
        ELSIF inst(11 DOWNTO 6) = RRF    THEN
            file_moen <= '1';                  -- FILE on the A bus.
            alu_op <= ALUOP_ROR;               -- Shift right.
            carry_wen <= '1';                  -- Update the CARRY flag.
            IF dest = '0' THEN
                w_wen <= '1';                  -- Store the result in W.      
            ELSE
                file_mwen <= '1';              -- Store the result in the register file.
            END IF;
        ELSIF inst(11 DOWNTO 6) = SUBWF  THEN
            w_b_oen <= '1';                    -- W on the B bus.
            file_moen <= '1';                  -- FILE on the A bus.
            alu_op <= ALUOP_SUB;               -- Perform a SUBTRACTION.
            carry_wen <= '1';                  -- Update the CARRY flag.
            zero_wen <= '1';                   -- Update the ZERO flag.
            IF dest = '0' THEN
                w_wen <= '1';                  -- Store the result in W.      
            ELSE
                file_mwen <= '1';              -- Store the result in the register file.
            END IF;                          
        ELSIF inst(11 DOWNTO 6) = SWAPF  THEN
            file_moen <= '1';                  -- FILE on the A bus.
            alu_op <= ALUOP_SWAP;              -- Swap the upper and lower nibbles.
            IF dest = '0' THEN
                w_wen <= '1';                  -- Store the result in W.      
            ELSE
                file_mwen <= '1';              -- Store the result in the register file.
            END IF;
        ELSIF inst(11 DOWNTO 6) = XORWF  THEN
            w_b_oen <= '1';                    -- W on the B bus.
            file_moen <= '1';                  -- FILE on the A bus.
            alu_op <= ALUOP_XOR;               -- Perform a logical XOR.
            zero_wen <= '1';                   -- Update the ZERO flag.
            IF dest = '0' THEN
                w_wen <= '1';                  -- Store the result in W.      
            ELSE
                file_mwen <= '1';              -- Store the result in the register file.
            END IF;                          
        ELSIF inst(11 DOWNTO 8) = BCF    THEN
            file_moen <= '1';                  -- FILE on the A bus.
            imm_oen <= '1';                    -- IMMEDIATE on the B bus.
            alu_op <= ALUOP_BITCLR;            -- Bit clear.
            file_mwen <= '1';                  -- Store the result in the register file.
        ELSIF inst(11 DOWNTO 8) = BSF    THEN
            file_moen <= '1';                  -- FILE on the A bus.
            imm_oen <= '1';                    -- IMMEDIATE on the B bus.
            alu_op <= ALUOP_BITSET;            -- Bit set.
            file_mwen <= '1';                  -- Store the result in the register file.
        ELSIF inst(11 DOWNTO 8) = BTFSC  THEN
            file_moen <= '1';                  -- FILE on the A bus.
            imm_oen <= '1';                    -- IMMEDIATE on the B bus.
            alu_op <= ALUOP_BITTESTCLR;        -- Test if the bit is clear.
            IF zero = '1' THEN
                inst_skip <= '1';              -- Skip next instruction if bit is clear.
            END IF;
        ELSIF inst(11 DOWNTO 8) = BTFSS  THEN
            file_moen <= '1';                  -- FILE on the A bus.
            imm_oen <= '1';                    -- IMMEDIATE on the B bus.
            alu_op <= ALUOP_BITTESTSET;        -- Test if the bit is set.
            IF zero = '1' THEN
                inst_skip <= '1';              -- Skip next instruction if bit is set.
            END IF;
        ELSIF inst(11 DOWNTO 8) = ANDLW  THEN
            w_a_oen <= '1';                    -- W on the A bus.
            imm_oen <= '1';                    -- IMMEDIATE on the B bus.
            alu_op <= ALUOP_AND;               -- Perform a logical AND.
            zero_wen <= '1';                   -- Update the ZERO flag.
            w_wen <= '1';                      -- Store the result in W.      
        ELSIF inst(11 DOWNTO 8) = IORLW  THEN
            w_a_oen <= '1';                    -- W on the A bus.
            imm_oen <= '1';                    -- IMMEDIATE on the B bus.
            alu_op <= ALUOP_OR;                -- Perform a logical OR.
            zero_wen <= '1';                   -- Update the ZERO flag.
            w_wen <= '1';                      -- Store the result in W.      
        ELSIF inst(11 DOWNTO 8) = XORLW  THEN
            w_a_oen <= '1';                    -- W on the A bus.
            imm_oen <= '1';                    -- IMMEDIATE on the B bus.
            alu_op <= ALUOP_XOR;               -- Perform a logical XOR.
            zero_wen <= '1';                   -- Update the ZERO flag.
            w_wen <= '1';                      -- Store the result in W.      
        ELSIF inst(11 DOWNTO 8) = MOVLW  THEN
            imm_oen <= '1';                    -- IMMEDIATE on the B bus.
            alu_op <= ALUOP_PASSB;             -- Copy B to the output.
            w_wen <= '1';                      -- Store the result in W.      
        ELSIF inst(11 DOWNTO 9) = GOTO   THEN
            pc_load <= '1';
            inst_skip <= '1';                  -- Force a NOP in the instruction register.
        ELSIF inst(11 DOWNTO 8) = CALL   THEN
            imm_oen <= '1';                    -- IMMEDIATE on the B bus.
            alu_op <= ALUOP_PASSB;             -- Copy B to the output.
            pc_push <= '1';                    -- Push the PC on the stack & load new value.
            inst_skip <= '1';                  -- Force a NOP in the instruction register.
        ELSIF inst(11 DOWNTO 8) = RETLW  THEN
            pc_pop <= '1';                     -- Pop the PC from the stack.
            imm_oen <= '1';                    -- IMMEDIATE on the B bus.
            alu_op <= ALUOP_PASSB;             -- Copy B to the output.
            w_wen <= '1';                      -- Store the result in W.      
            inst_skip <= '1';                  -- Force a NOP in the instruction register.
        ELSIF inst(11 DOWNTO 2) = TRIS   THEN
            w_a_oen <= '1';                    -- W on the A bus.
            alu_op <= ALUOP_PASSA;             -- Copy A to the output.
            CASE tris_sel IS
              WHEN "01" => tris_a_wen <= '1';  -- Store in the appropriate TRIS register.
              WHEN "10" => tris_b_wen <= '1';
              WHEN "11" => tris_c_wen <= '1';
              WHEN OTHERS => NULL;
            END CASE;
        ELSIF inst(11 DOWNTO 0) = OPTION THEN
        -- Not implemented.
        ELSIF inst(11 DOWNTO 0) = SLEEP  THEN
        -- Not implemented.
        ELSIF inst(11 DOWNTO 0) = CLRWDT THEN
        -- Not implemented.
        END IF;
    END PROCESS;
END mixed;

