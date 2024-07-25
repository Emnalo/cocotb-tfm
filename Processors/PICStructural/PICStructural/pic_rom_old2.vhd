-- This is a sample program for the PIC.  Note that the output of the
-- program "hex2vhdl" doesn't contain these comments.

-- Addr Opcode  Mnemonic
--
-- 0000 0C25    movlw  0x25
-- 0001 0028    movwf  R8
-- 0002 0c72    movlw  0x72
-- 0003 01c8    addwf  R8,w
-- 0004 01e8    addwf  R8
-- 0005 01e8    addwf  R8
-- 0006 0248    comf   R8,w
-- 0007 00e8    decf   R8
-- 0008 02a8    incf   R8
-- 0009 0108    iorwf  R8,w
-- 000a 01a8    xorwf  R8
-- 000b 0148    andwf  R8,w
-- 000c 0368    rlf    R8
-- 000d 0368    rlf    R8
-- 000e 0368    rlf    R8
-- 000f 0328    rrf    R8
-- 0010 0328    rrf    R8
-- 0011 0328    rrf    R8
-- 0012 03a8    swapf  R8
-- 0013 00a8    subwf  R8
-- 0014 0088    subwf  R8,w
-- 0015 0040    clrw
-- 0016 0068    clrf   R8
-- 0017 03e8    incfsz R8
-- 0018 02e8    decfsz R8
-- 0019 0a19    goto   0x19
-- 001a 02e8    decfsz R8
-- 001b 03e8    incsz  R8
-- 001c 0a1c    goto   0x1c
-- 001d 0508    bsf    R8,0
-- 001e 0548    bsf    R8,2
-- 001f 0588    bsf    R8,4
-- 0020 05c8    bsf    R8,6
-- 0021 0448    bcf    R8,2
-- 0022 04c8    bcf    R8,6
-- 0023 0608    btfsc  R8,0
-- 0024 0628    btfsc  R8,2
-- 0025 0a25    goto   0x25
-- 0026 0728    btfss  R8,1
-- 0027 0708    btfss  R8,0
-- 0028 0a28    goto   0x28
-- 0029 0dff    iorlw  0xff
-- 002a 0ef0    andlw  0xf0
-- 002b 0ff0    xorlw  0xf0
-- 002c 0c08    movlw  0x08
-- 002d 0024    movwf  R4
-- 002e 0200    movf   R0,w
--
-- 01ff 0a00    goto   0x00

library IEEE, util, arith;
use IEEE.std_logic_1164.all;
use util.util.all;
use arith.std_logic_arith.all;

entity PIC_ROM is
  port (
	 Addr    : in   std_logic_vector(8 downto 0);
	 Data    : out  std_logic_vector(11 downto 0));
end PIC_ROM;


architecture first of PIC_ROM is
begin
  Data <= 
        "110000100101" When CONV_INTEGER(Addr) = 00000 Else
        "000000101000" When CONV_INTEGER(Addr) = 00001 Else
        "110001110010" When CONV_INTEGER(Addr) = 00002 Else
        "000111001000" When CONV_INTEGER(Addr) = 00003 Else
        "000111101000" When CONV_INTEGER(Addr) = 00004 Else
        "000111101000" When CONV_INTEGER(Addr) = 00005 Else
        "001001001000" When CONV_INTEGER(Addr) = 00006 Else
        "000011101000" When CONV_INTEGER(Addr) = 00007 Else
        "001010101000" When CONV_INTEGER(Addr) = 00008 Else
        "000100001000" When CONV_INTEGER(Addr) = 00009 Else
        "000110101000" When CONV_INTEGER(Addr) = 00010 Else
        "000101001000" When CONV_INTEGER(Addr) = 00011 Else
        "001101101000" When CONV_INTEGER(Addr) = 00012 Else
        "001101101000" When CONV_INTEGER(Addr) = 00013 Else
        "001101101000" When CONV_INTEGER(Addr) = 00014 Else
        "001100101000" When CONV_INTEGER(Addr) = 00015 Else
        "001100101000" When CONV_INTEGER(Addr) = 00016 Else
        "001100101000" When CONV_INTEGER(Addr) = 00017 Else
        "001110101000" When CONV_INTEGER(Addr) = 00018 Else
        "000010101000" When CONV_INTEGER(Addr) = 00019 Else
        "000010001000" When CONV_INTEGER(Addr) = 00020 Else
        "000001000000" When CONV_INTEGER(Addr) = 00021 Else
        "000001101000" When CONV_INTEGER(Addr) = 00022 Else
        "001111101000" When CONV_INTEGER(Addr) = 00023 Else
        "001011101000" When CONV_INTEGER(Addr) = 00024 Else
        "101000011001" When CONV_INTEGER(Addr) = 00025 Else
        "001011101000" When CONV_INTEGER(Addr) = 00026 Else
        "001111101000" When CONV_INTEGER(Addr) = 00027 Else
        "101000011100" When CONV_INTEGER(Addr) = 00028 Else
        "010100001000" When CONV_INTEGER(Addr) = 00029 Else
        "010101001000" When CONV_INTEGER(Addr) = 00030 Else
        "010110001000" When CONV_INTEGER(Addr) = 00031 Else
        "010111001000" When CONV_INTEGER(Addr) = 00032 Else
        "010001001000" When CONV_INTEGER(Addr) = 00033 Else
        "010011001000" When CONV_INTEGER(Addr) = 00034 Else
        "011000001000" When CONV_INTEGER(Addr) = 00035 Else
        "011000101000" When CONV_INTEGER(Addr) = 00036 Else
        "101000100101" When CONV_INTEGER(Addr) = 00037 Else
        "011100101000" When CONV_INTEGER(Addr) = 00038 Else
        "011100001000" When CONV_INTEGER(Addr) = 00039 Else
        "101000101000" When CONV_INTEGER(Addr) = 00040 Else
        "110111111111" When CONV_INTEGER(Addr) = 00041 Else
        "111011110000" When CONV_INTEGER(Addr) = 00042 Else
        "111111110000" When CONV_INTEGER(Addr) = 00043 Else
        "110000001000" When CONV_INTEGER(Addr) = 00044 Else
        "000000100100" When CONV_INTEGER(Addr) = 00045 Else
        "001000000000" When CONV_INTEGER(Addr) = 00046 Else
        "101000000000" When CONV_INTEGER(Addr) = 00511 Else
        "000000000000";
end first;

-- Programa sumatorio de serie aritmetica

-- Addr Opcode  Mnemonic
--
-- 0000 0C0A    movlw  0x10
-- 0001 0028    movwf  R8
-- 0002 0c00    movlw  0x00
-- 0003 01c8    addwf  R8,w
-- 0004 02e8    decfsz R8
-- 0005 0a03    goto   0x03
--
-- 01ff 0a00    goto   0x00

architecture second of PIC_ROM is
begin
  Data <= 
        "110000001010" When CONV_INTEGER(Addr) = 00000 Else
        "000000101000" When CONV_INTEGER(Addr) = 00001 Else
        "110000000000" When CONV_INTEGER(Addr) = 00002 Else
        "000111001000" When CONV_INTEGER(Addr) = 00003 Else
        "001011101000" When CONV_INTEGER(Addr) = 00004 Else
        "101000000011" When CONV_INTEGER(Addr) = 00005 Else
        "101000000000" When CONV_INTEGER(Addr) = 00511 Else
        "000000000000";
end second;
