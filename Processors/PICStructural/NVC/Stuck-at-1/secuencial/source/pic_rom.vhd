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

LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity PIC_ROM is
  port (
	 Addr    : in   std_logic_vector(8 downto 0);
	 Data    : out  std_logic_vector(11 downto 0));
end PIC_ROM;


--architecture tbench_prog of PIC_ROM is
--begin
--  Data <=
--        "110000100101" When to_integer(unsigned(Addr)) = 00000 Else
--        "000000101000" When to_integer(unsigned(Addr)) = 00001 Else
--        "110001110010" When to_integer(unsigned(Addr)) = 00002 Else
--        "000111001000" When to_integer(unsigned(Addr)) = 00003 Else
--        "000111101000" When to_integer(unsigned(Addr)) = 00004 Else
--        "000111101000" When to_integer(unsigned(Addr)) = 00005 Else
--        "001001001000" When to_integer(unsigned(Addr)) = 00006 Else
--        "000011101000" When to_integer(unsigned(Addr)) = 00007 Else
--        "001010101000" When to_integer(unsigned(Addr)) = 00008 Else
--        "000100001000" When to_integer(unsigned(Addr)) = 00009 Else
--        "000110101000" When to_integer(unsigned(Addr)) = 00010 Else
--        "000101001000" When to_integer(unsigned(Addr)) = 00011 Else
--        "001101101000" When to_integer(unsigned(Addr)) = 00012 Else
--        "001101101000" When to_integer(unsigned(Addr)) = 00013 Else
--        "001101101000" When to_integer(unsigned(Addr)) = 00014 Else
--        "001100101000" When to_integer(unsigned(Addr)) = 00015 Else
--        "001100101000" When to_integer(unsigned(Addr)) = 00016 Else
--        "001100101000" When to_integer(unsigned(Addr)) = 00017 Else
--        "001110101000" When to_integer(unsigned(Addr)) = 00018 Else
--        "000010101000" When to_integer(unsigned(Addr)) = 00019 Else
--        "000010001000" When to_integer(unsigned(Addr)) = 00020 Else
--        "000001000000" When to_integer(unsigned(Addr)) = 00021 Else
--        "000001101000" When to_integer(unsigned(Addr)) = 00022 Else
--        "001111101000" When to_integer(unsigned(Addr)) = 00023 Else
--        "001011101000" When to_integer(unsigned(Addr)) = 00024 Else
--        "101000011001" When to_integer(unsigned(Addr)) = 00025 Else
--        "001011101000" When to_integer(unsigned(Addr)) = 00026 Else
--        "001111101000" When to_integer(unsigned(Addr)) = 00027 Else
--        "101000011100" When to_integer(unsigned(Addr)) = 00028 Else
--        "010100001000" When to_integer(unsigned(Addr)) = 00029 Else
--        "010101001000" When to_integer(unsigned(Addr)) = 00030 Else
--        "010110001000" When to_integer(unsigned(Addr)) = 00031 Else
--        "010111001000" When to_integer(unsigned(Addr)) = 00032 Else
--        "010001001000" When to_integer(unsigned(Addr)) = 00033 Else
--        "010011001000" When to_integer(unsigned(Addr)) = 00034 Else
--        "011000001000" When to_integer(unsigned(Addr)) = 00035 Else
--        "011000101000" When to_integer(unsigned(Addr)) = 00036 Else
--        "101000100101" When to_integer(unsigned(Addr)) = 00037 Else
--        "011100101000" When to_integer(unsigned(Addr)) = 00038 Else
--        "011100001000" When to_integer(unsigned(Addr)) = 00039 Else
--        "101000101000" When to_integer(unsigned(Addr)) = 00040 Else
--        "110111111111" When to_integer(unsigned(Addr)) = 00041 Else
--        "111011110000" When to_integer(unsigned(Addr)) = 00042 Else
--        "111111110000" When to_integer(unsigned(Addr)) = 00043 Else
--        "110000001000" When to_integer(unsigned(Addr)) = 00044 Else
--        "000000100100" When to_integer(unsigned(Addr)) = 00045 Else
--        "001000000000" When to_integer(unsigned(Addr)) = 00046 Else
--        "101000000000" When to_integer(unsigned(Addr)) = 00511 Else
--        "000000000000";
--end tbench_prog;

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

--architecture sumatorio of PIC_ROM is
--begin
--  Data <=
--        "110000001010" When to_integer(unsigned(Addr)) = 00000 Else
--        "000000101000" When to_integer(unsigned(Addr)) = 00001 Else
--        "110000000000" When to_integer(unsigned(Addr)) = 00002 Else
--        "000111001000" When to_integer(unsigned(Addr)) = 00003 Else
--        "001011101000" When to_integer(unsigned(Addr)) = 00004 Else
--        "101000000011" When to_integer(unsigned(Addr)) = 00005 Else
--        "101000000000" When to_integer(unsigned(Addr)) = 00511 Else
--        "000000000000";
--end sumatorio;


-- Algoritmo de ordenaci�n basado en burbuja

-- Addr Opcode Label   Mnemonic		Comentario
-- 0000   0C09 datos:  movlw    9		;datos a ordenar d1 a d10
-- 0001   0028         movwf    R8
-- 0002   0C08         movlw    8
-- 0003   0029         movwf    R9
-- 0004   0C07         movlw    7
-- 0005   002A         movwf    R10
-- 0006   0C06         movlw    6
-- 0007   002B         movwf    R11
-- 0008   0C05         movlw    5
-- 0009   002C         movwf    R12
-- 000A   0C04         movlw    4
-- 000B   002D         movwf    R13
-- 000C   0C03         movlw    3
-- 000D   002E         movwf    R14
-- 000E   0C02         movlw    2
-- 000F   002F         movwf    R15
-- 0010   0C01         movlw    1
-- 0011   0030         movwf    R16
-- 0012   0C00         movlw    0
-- 0013   0031         movwf    R17
--
-- 0014   0C08 bubble: movlw    8		;�ndice del registro d1
-- 0015   0024         movwf    FSR		
-- 0016   0C09         movlw    9
-- 0017   0033         movwf    i		;i=n-1 se usar� como �ndice
-- 0018   01E4         addwf    FSR		;apuntar al �ltimo dato d10
--
--
-- 0019   0200 loop1   movf     INDF,w  	;for i = 9 to 1 'd10 a d2
-- 001A   0032         movwf    tmp     	;tmp = d[d1+i]
--
-- 001B   00E4 loop2   decf     FSR,f   	;for R4 = (d1+i-1) to d1
--
-- 001C   0212         movf     tmp,w  		
-- 001D   0080         subwf    INDF,w		;comparacion
-- 001E   0743         BTFSS    STATUS, carry  	;cambiar a btfsc para invertir el sentido de la ordenaci�n
-- 001F   0A25         goto     noswap
--
-- 0020   0212 swap    movf     tmp,w		; w<-tmp
-- 0021   01A0         xorwf    INDF,f		;
-- 0022   0180         xorwf    INDF,w		; swap indf<->w	ALGORTIMO DE SWAP
-- 0023   01A0         xorwf    INDF,f		; 
-- 0024   0032         movwf    tmp		; w->tmp
--
-- 0025   0C08 noswap  movlw    d1
-- 0026   0184         xorwf    FSR,w
-- 0027   0703         skpz
-- 0028   0A1B         goto     loop2
--
-- 0029   0C08         movlw    d1
-- 002A   01D3         addwf    i,w
-- 002B   0024         movwf    FSR
-- 002C   0212         movf     tmp,w
-- 002D   0020         movwf    INDF    	;d[d1+i] = tmp
-- 002E   00E4         decf     FSR,f
-- 002F   02F3         decfsz   i
-- 0030   0A19         goto     loop1
--
-- 0031   0000 fin     nop



-- Tabla de s�mbolos
-- Etiqueta Valor
--
-- d1       0008
-- d2       0009
-- d3       000A
-- d4       000B
-- d5       000C
-- d6       000D
-- d7       000E
-- d8       000F
-- d9       0010
-- d10      0011
-- tmp      0012
-- i        0013
--
-- loop1    0004
-- loop2    0006
-- noswap   0010
-- swap     000B

architecture bubblesort of PIC_ROM is
 begin
  Data <=
        "110000001001" When to_integer(unsigned(Addr)) = 00000 Else	-- 0000
        "000000101000" When to_integer(unsigned(Addr)) = 00001 Else     -- 0001
        "110000001000" When to_integer(unsigned(Addr)) = 00002 Else     -- 0002
        "000000101001" When to_integer(unsigned(Addr)) = 00003 Else     -- 0003
        "110000000111" When to_integer(unsigned(Addr)) = 00004 Else     -- 0004
        "000000101010" When to_integer(unsigned(Addr)) = 00005 Else     -- 0005
        "110000000110" When to_integer(unsigned(Addr)) = 00006 Else     -- 0006
        "000000101011" When to_integer(unsigned(Addr)) = 00007 Else     -- 0007
        "110000000101" When to_integer(unsigned(Addr)) = 00008 Else     -- 0008
        "000000101100" When to_integer(unsigned(Addr)) = 00009 Else     -- 0009
        "110000000100" When to_integer(unsigned(Addr)) = 00010 Else     -- 000A
        "000000101101" When to_integer(unsigned(Addr)) = 00011 Else     -- 000B
        "110000000011" When to_integer(unsigned(Addr)) = 00012 Else     -- 000C
        "000000101110" When to_integer(unsigned(Addr)) = 00013 Else     -- 000D
        "110000000010" When to_integer(unsigned(Addr)) = 00014 Else     -- 000E
        "000000101111" When to_integer(unsigned(Addr)) = 00015 Else     -- 000F
        "110000000001" When to_integer(unsigned(Addr)) = 00016 Else     -- 0010
        "000000110000" When to_integer(unsigned(Addr)) = 00017 Else     -- 0011
        "110000000000" When to_integer(unsigned(Addr)) = 00018 Else     -- 0012
        "000000110001" When to_integer(unsigned(Addr)) = 00019 Else     -- 0013
        "110000001000" When to_integer(unsigned(Addr)) = 00020 Else     -- 0014    
        "000000100100" When to_integer(unsigned(Addr)) = 00021 Else     -- 0015
        "110000001001" When to_integer(unsigned(Addr)) = 00022 Else     -- 0016
        "000000110011" When to_integer(unsigned(Addr)) = 00023 Else     -- 0017
        "000111100100" When to_integer(unsigned(Addr)) = 00024 Else     -- 0018
        "001000000000" When to_integer(unsigned(Addr)) = 00025 Else     -- 0019
        "000000110010" When to_integer(unsigned(Addr)) = 00026 Else     -- 001A    
        "000011100100" When to_integer(unsigned(Addr)) = 00027 Else     -- 001B    
        "001000010010" When to_integer(unsigned(Addr)) = 00028 Else     -- 001C
        "000010000000" When to_integer(unsigned(Addr)) = 00029 Else     -- 001D
        "011101000011" When to_integer(unsigned(Addr)) = 00030 Else     -- 001E    
        "101000100101" When to_integer(unsigned(Addr)) = 00031 Else     -- 001F
        "001000010010" When to_integer(unsigned(Addr)) = 00032 Else     -- 0020    
        "000110100000" When to_integer(unsigned(Addr)) = 00033 Else     -- 0021
        "000110000000" When to_integer(unsigned(Addr)) = 00034 Else     -- 0022
        "000110100000" When to_integer(unsigned(Addr)) = 00035 Else     -- 0023
        "000000110010" When to_integer(unsigned(Addr)) = 00036 Else     -- 0024
        "110000001000" When to_integer(unsigned(Addr)) = 00037 Else     -- 0025
        "000110000100" When to_integer(unsigned(Addr)) = 00038 Else     -- 0026
        "011100000011" When to_integer(unsigned(Addr)) = 00039 Else     -- 0027
        "101000011011" When to_integer(unsigned(Addr)) = 00040 Else     -- 0028
        "110000001000" When to_integer(unsigned(Addr)) = 00041 Else     -- 0029
        "000111010011" When to_integer(unsigned(Addr)) = 00042 Else     -- 002A
        "000000100100" When to_integer(unsigned(Addr)) = 00043 Else     -- 002B
        "001000010010" When to_integer(unsigned(Addr)) = 00044 Else     -- 002C
        "000000100000" When to_integer(unsigned(Addr)) = 00045 Else     -- 002D
        "000011100100" When to_integer(unsigned(Addr)) = 00046 Else     -- 002E
        "001011110011" When to_integer(unsigned(Addr)) = 00047 Else     -- 002F
        "101000011001" When to_integer(unsigned(Addr)) = 00048 Else     -- 0030    
        "000000000000";                                         -- 0031
end bubblesort;                                                     
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
