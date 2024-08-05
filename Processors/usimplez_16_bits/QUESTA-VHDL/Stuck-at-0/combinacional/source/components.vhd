library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

package COMPONENTS is

CONSTANT WIDTH_WORD: natural:= 16;
CONSTANT WIDTH_ADDRESS: natural:= 9;
CONSTANT WIDTH_OPERATION_CODE: natural:=3;
CONSTANT MEM_DEPTH: integer := 512;
  
-- Functional $log2 of CW_lza
function log2 (i: NATURAL) return INTEGER;

function F_GREATER (DATA_IN_WIDTH: integer; DATA_OUT_WIDTH: integer) return integer;
function F_CWARE_LOG2_X (X: integer) return Integer;
function F_CWARE_LOG2_X_PLUS_1(X: integer) return Integer;
function F_CWARE_MINCHKB_X (X: integer) return Integer;


-------------------------------------------------------------------------
-- bit_width returns the min number of bits required to represent a number
-- in binary
-------------------------------------------------------------------------
function bit_width (
  constant num : integer)
  return integer;

-------------------------------------------------------------------------
-- max returns the maximum of two integers
-------------------------------------------------------------------------
function max (constant num1,num2 : integer) return integer;

-------------------------------------------------------------------------
-- min returns the minimum of two integers
-------------------------------------------------------------------------
function min (constant num1,num2 : integer) return integer;
  
-------------------------------------------------------------------------
-- CW_REPORT_BUG
-- prints report bug message and stops simulation
-------------------------------------------------------------------------
procedure CW_REPORT_BUG;

-------------------------------------------------------------------------
-- reduce_xor returns the reduction xor of a number
-------------------------------------------------------------------------
function reduce_xor (constant num : std_logic_vector) return std_logic;

-------------------------------------------------------------------------
-- reduce_or returns the reduction or of a number
-------------------------------------------------------------------------
function reduce_or (constant num : std_logic_vector) return std_logic;

-------------------------------------------------------------------------
-- return the left shif value of 1 by input value
-------------------------------------------------------------------------
function shift_left_1 (constant  num : integer ; constant index:  integer) return std_logic_vector;
function to_integer1  (constant num_index:std_logic_vector; constant index : integer) return integer;

-------------------------------------------------------------------------
-- reduce_and returns the reduction and of a number
-------------------------------------------------------------------------
function reduce_and (
  constant num : std_logic_vector)
  return std_logic;

component CW_absval 
  generic (
    wA      : positive             := 8
    );
  port (
    A   : in  std_logic_vector(wA-1 downto 0);
    Z   : out std_logic_vector(wA-1 downto 0)
    );
end component;

component CW_addsub
  generic (
    wA      : positive             := 4 
    );
  port (
    A   : in  std_logic_vector(wA-1 downto 0);
    B   : in  std_logic_vector(wA-1 downto 0);
    CI  : in  std_logic;
    SUB : in  std_logic;
    Z   : out std_logic_vector(wA-1 downto 0);
    CO  : out std_logic
    );
end component;

component CW_add 
  generic (
    wA : positive := 4
    );
  port (
    A   : in  std_logic_vector(wA-1 downto 0);
    B   : in  std_logic_vector(wA-1 downto 0);
    CI  : in  std_logic;
    Z   : out std_logic_vector(wA-1 downto 0);
    CO  : out std_logic
    );
end component;

component CW_bin2gray 
    generic (
        WIDTH: integer := 4 
    );
    port ( 
        b:	   in    std_logic_vector(WIDTH - 1 downto 0) ; 
        g:	  out   std_logic_vector(WIDTH - 1 downto 0) 
    ) ;
end component;

component CW_blend
  generic (
    wX      : positive := 8;
    wA      : positive := 8
    );
  port (
    X0     : in  std_logic_vector(wX-1 downto 0);
    X1     : in  std_logic_vector(wX-1 downto 0);
    TC     : in  std_logic;
    Alpha  : in  std_logic_vector(wA-1 downto 0);
    Alpha1 : in  std_logic;
    Z      : out std_logic_vector(wX+wA-1 downto 0)
    );
end component;

component CW_dec
  generic (
    wA : positive := 8
    );
  port (
    A   : in  std_logic_vector(wA-1 downto 0);
    Z   : out std_logic_vector(wA-1 downto 0)
    );
end component;

component CW_extend
  generic (
    wA : positive := 8;
    wZ : positive := 8
    );
  port (
    A   : in  std_logic_vector(wA-1 downto 0);
    TC  : in  std_logic;
    Z   : out std_logic_vector(wZ-1 downto 0)
    );
end component;

component CW_gray2bin 
    generic (
        WIDTH: integer := 3 
    );
    port (
        g: in  std_logic_vector( (WIDTH-1) downto 0 ) ;
        b: out std_logic_vector( (WIDTH-1) downto 0 ) 
    );
end component;

component CW_incdec
  generic (
    wA      : positive             := 8
    );
  port (
    A   : in  std_logic_vector(wA-1 downto 0);
    DEC : in  std_logic;
    Z   : out std_logic_vector(wA-1 downto 0)
    );
end component;

component CW_inc
  generic (
    wA : positive := 8
    );
  port (
    A   : in  std_logic_vector(wA-1 downto 0);
    Z   : out std_logic_vector(wA-1 downto 0)
    );
end component;

component CW_mult
  generic (
    wA      : positive             := 8;
    wB      : positive             := 8
    );
  port (
    A   : in  std_logic_vector(wA-1 downto 0);
    B   : in  std_logic_vector(wB-1 downto 0);
    TC  : in  std_logic;
    Z   : out std_logic_vector(wA+wB-1 downto 0)
    );
end component;

component CW_pipe_reg
  generic (
     stages : natural := 1;
     wD     : positive := 1
    );
  port (
    D   : in  std_logic_vector(wD-1 downto 0);
    CLK : in  std_logic;
    Q   : out std_logic_vector(wD-1 downto 0)
    );
end component;

component CW_square
  generic (
    wA      : positive             := 8
    );
  port (
    A   : in  std_logic_vector(wA-1 downto 0);
    TC  : in  std_logic;
    Z   : out std_logic_vector(2*wA-1 downto 0)
    );
end component;

component CW_sub
  generic (
    wA : positive := 8
    );
  port (
    A   : in  std_logic_vector(wA-1 downto 0);
    B   : in  std_logic_vector(wA-1 downto 0);
    CI  : in  std_logic;
    Z   : out std_logic_vector(wA-1 downto 0);
    CO  : out std_logic
    );
end component;

component CW_ashiftr
  generic (
    wA       : natural range 2 to natural'high := 2;
    wSH      : natural range 1 to natural'high := 1
    );
  port (
    A   : in  std_logic_vector(wA -1 downto 0);
    SH  : in  std_logic_vector(wSH-1 downto 0);
    Z   : out std_logic_vector(wA -1 downto 0)
    );
end component;

component CW_ash 
  generic (
    wA  : integer := 4;
    wSH : integer := 2
  );
  port (
    A        : in std_logic_vector(wA - 1 downto 0);
    DATA_TC  : in std_logic;
    SH       : in std_logic_vector(wSH - 1 downto 0);
    SH_TC    : in std_logic;
    Z        : out std_logic_vector(wA - 1 downto 0)
  );
end component;

component CW_lshiftl
  generic (
    wA       : natural range 2 to natural'high := 2;
    wSH      : natural range 1 to natural'high := 1
    );
  port (
    A   : in  std_logic_vector(wA -1 downto 0);
    SH  : in  std_logic_vector(wSH-1 downto 0);
    Z   : out std_logic_vector(wA -1 downto 0)
    );
end component;

component CW_lshiftr
  generic (
    wA       : natural range 2 to natural'high := 2;
    wSH      : natural range 1 to natural'high := 1
    );
  port (
    A   : in  std_logic_vector(wA -1 downto 0);
    SH  : in  std_logic_vector(wSH-1 downto 0);
    Z   : out std_logic_vector(wA -1 downto 0)
    );
end component;

component CW_shiftdir
  generic (
    wA       : natural range 2 to natural'high := 2;
    wSH      : natural range 1 to natural'high := 1
    );
  port (
    A    : in  std_logic_vector(wA-1 downto 0);
    SH   : in  std_logic_vector(wSH-1 downto 0);
    LEFT : in  std_logic;
    TC   : in  std_logic;
    Z    : out std_logic_vector(wA-1 downto 0)
    );
end component;

component CW_cmp6
  generic (
    wA      : positive             := 8
    );
  port (
    A   : in  std_logic_vector(wA-1 downto 0);
    B   : in  std_logic_vector(wA-1 downto 0);
    TC  : in  std_logic;
    LT  : out std_logic;
    EQ  : out std_logic;
    GT  : out std_logic;
    LE  : out std_logic;
    GE  : out std_logic;
    NE  : out std_logic
    );
end component;

component CW_compge
  generic (
    wA      : positive             := 8
    );
  port (
    A   : in  std_logic_vector(wA-1 downto 0);
    B   : in  std_logic_vector(wA-1 downto 0);
    TC  : in  std_logic;
    AGB : out std_logic;
    AEB : out std_logic
    );
end component;

component CW_bictr_dcnto
  generic (
    WIDTH: integer := 3 
    );
  port (
    data:      in std_logic_vector( (WIDTH-1) downto 0 ) ;
    count_to:  in std_logic_vector( (WIDTH-1) downto 0 ) ;
    up_dn:     in std_logic ;
    load:      in std_logic ;
    cen:       in std_logic ;
    clk:       in std_logic ;
    reset:     in std_logic ;
    count:     out std_logic_vector( (WIDTH-1) downto 0) ;
    tercnt:    out std_logic 
    );
end component ;

component CW_bictr_decode
  generic (
    WIDTH: integer := 3 
  );
  port (
    data:  in std_logic_vector( (WIDTH-1) downto 0 ) ;
    up_dn: in std_logic ;
    load:  in std_logic ;
    cen:   in std_logic ;
    clk:   in std_logic ;
    reset: in std_logic ;
    count_dec: out std_logic_vector( ((2**WIDTH)-1) downto 0) ;
    tercnt:    out std_logic 
  );
end component ;

component CW_bictr_scnto
  generic (
    WIDTH: integer := 3 ; 
    COUNT_TO: integer := 2 
  );
  port (
    data:  in std_logic_vector( (WIDTH-1) downto 0 ) ;
    up_dn: in std_logic ;
    load:  in std_logic ;
    cen:   in std_logic ;
    clk:   in std_logic ;
    reset: in std_logic ;
    count:  out std_logic_vector( (WIDTH-1) downto 0) ;
    tercnt: out std_logic 
  );
end component ;

component CW_decode
  generic (
    wA  : positive := 4
    );
  port (
    A   : in  std_logic_vector(wA-1 downto 0);
    Z   : out std_logic_vector((2**wA)-1 downto 0)
    );
end component;


component CW_logicop
  generic (
    wS  : positive := 8
    );
  port (
    S   : in  std_logic_vector(wS-1 downto 0);
    D   : in  std_logic_vector(wS-1 downto 0);
    OP  : in  std_logic_vector(4-1 downto 0);
    Z   : out std_logic_vector(wS-1 downto 0)
    );
end component;

component CW_reg_s_pl
  generic (
    WIDTH: integer := 8;
    RESET_VALUE: integer := 0
  );
  port (
    D: in std_logic_vector(WIDTH - 1 downto 0);
    CLK: in std_logic;
    RESET_N: in std_logic;
    ENABLE: in std_logic;
    Q: out std_logic_vector(WIDTH - 1 downto 0)
  );
end component;

component CW_updn_ctr
  generic (
    WIDTH: integer := 3 
    );
  port (
    data:  in std_logic_vector( (WIDTH-1) downto 0 ) ;
    up_dn: in std_logic ;
    load:  in std_logic ;
    cen:   in std_logic ;
    clk:   in std_logic ;
    reset: in std_logic ;
    count:  out std_logic_vector( (WIDTH-1) downto 0) ;
    tercnt: out std_logic 
    );
end component ;

component CW_prienc
  generic (
    wA : positive range 2 to positive'high := 2;
    wZ : positive range 2 to positive'high := 2
    );
  port (
    A    : in  std_logic_vector(wA-1 downto 0);
    Z    : out std_logic_vector(wZ-1 downto 0)
    );
end component;

component CW_rotatel
  generic (
    wA       : natural range 2 to natural'high := 2;
    wSH      : natural range 1 to natural'high := 1
    );
  port (
    A   : in  std_logic_vector(wA-1 downto 0);
    SH  : in  std_logic_vector(wSH-1 downto 0);
    Z   : out std_logic_vector(wA-1 downto 0)
    );
end component;

component CW_rotater
  generic (
    wA       : natural range 2 to natural'high := 2;
    wSH      : natural range 1 to natural'high := 1
    );
  port (
    A   : in  std_logic_vector(wA-1 downto 0);
    SH  : in  std_logic_vector(wSH-1 downto 0);
    Z   : out std_logic_vector(wA-1 downto 0)
    );
end component;

component CW_shftreg
  generic (
    LENGTH: integer := 4
  );
  port (
    CLK: in std_logic;
    S_IN: in std_logic;
    P_IN: in std_logic_vector(LENGTH - 1 downto 0);
    SHIFT_N: in std_logic;
    LOAD_N: in std_logic;
    P_OUT: out std_logic_vector(LENGTH - 1 downto 0)
  );
end component;

component CW_multadd
  generic (
    wA      : positive             := 8;
    wB      : positive             := 8;
    wC      : positive             :=16;
    wZ      : positive             :=16
    );
  port (
    A   : in  std_logic_vector(wA-1 downto 0);
    B   : in  std_logic_vector(wB-1 downto 0);
    C   : in  std_logic_vector(wC-1 downto 0);
    TC  : in  std_logic;
    Z   : out std_logic_vector(wZ-1 downto 0)
    );
end component;

component CW_prod_sum
  generic (
    wAi       : positive := 4;
    wBi       : positive := 5;
    numinputs : positive := 4;
    wZ        : positive := 12
    );
  port (
    A   : in  std_logic_vector(wAi*numinputs-1 downto 0);
    B   : in  std_logic_vector(wBi*numinputs-1 downto 0);
    TC  : in  std_logic;
    Z   : out std_logic_vector(wZ-1 downto 0)
    );
end component;

component CW_sum
  generic (
    nI : positive range 2 to positive'high := 2;
    wAi       : positive                          := 8;
    wZ        : positive                          := 8
    );
  port (
    A   : in  std_logic_vector(wAi*nI-1 downto 0);
    TC  : in  std_logic;
    Z   : out std_logic_vector(wZ-1 downto 0)
    );
end component;

component CW_minmax
  generic (
    width: integer := 4; 
    num_inputs: integer := 2
    );
  port (
    a      : in std_logic_vector( ((num_inputs*width)-1) downto 0 ) ;	
    tc     : in std_logic ;							    
    min_max: in std_logic ;							    
    value  : out std_logic_vector( (width-1) downto 0 ) ; 
    index  : out std_logic_vector( (F_CWARE_LOG2_X(num_inputs)-1) downto 0 ) 
    );
end component;

component CW_mux_any
  generic (
    wA        : positive := 8;
    wS        : positive := 2;
    wZ        : positive := 2
  );
  port (
    A   : in  std_logic_vector(wA-1 downto 0);
    S   : in  std_logic_vector(wS-1 downto 0);
    Z   : out std_logic_vector(wZ-1 downto 0)
  );
end component;

component CW_multp 
  generic (
    a_width   : integer := 8; 
    b_width   : integer := 8; 
    out_width : integer := 18
  );
  port( 
    a    :  in std_logic_vector(a_width - 1 downto 0); 
    b    :  in std_logic_vector(b_width - 1 downto 0); 
    tc   :  in std_logic;
    out0 : out std_logic_vector(out_width -1 downto 0);
    out1 : out std_logic_vector(out_width -1 downto 0)
  );
end component;

component CW_tree 
  generic (
    num_inputs: integer := 8; 
    input_width: integer := 8
  );
  port( 
    INPUT     :  in std_logic_vector(( num_inputs *input_width ) - 1 downto 0);  
    OUT0      : out std_logic_vector( input_width - 1 downto 0); 
    OUT1      : out std_logic_vector( input_width - 1 downto 0) 
  );
end component;

component CW_squarep 
  generic (
    width: integer := 8
  );
  port( 
    a    :  in std_logic_vector(width - 1 downto 0);  
    tc   :  in std_logic;                  
    out0 : out std_logic_vector((width*2) -1 downto 0); 
    out1 : out std_logic_vector((width*2) -1 downto 0) 
  );
end component;

component CW_csa
  generic (
    width : positive := 8
    );
  port (
    a     : in  std_logic_vector(width-1 downto 0);
    b     : in  std_logic_vector(width-1 downto 0);
    c     : in  std_logic_vector(width-1 downto 0);
    ci    : in  std_logic;
    carry : out std_logic_vector(width-1 downto 0);
    sum   : out std_logic_vector(width-1 downto 0);
    co    : out std_logic
    );
end component;









component CW_mult_n_stage
  generic (
    wA      : positive             := 8;
    wB      : positive             := 8;
    stages  : positive             := 2
    );
  port (
    A   : in  std_logic_vector(wA-1 downto 0);
    B   : in  std_logic_vector(wB-1 downto 0);
    TC  : in  std_logic;
    CLK : in  std_logic;
    Z   : out std_logic_vector(wA+wB-1 downto 0)
    );
end component;









component CW_ffen
  generic (
    wD  : positive := 1
    );
  port (
    CLK : in  std_logic;
    EN  : in  std_logic;
    D   : in  std_logic_vector(wD-1 downto 0);
    Q   : out std_logic_vector(wD-1 downto 0)
    );
end component;

component CW_ffrsten
  generic (
    wD   : positive := 1
    );
  port (
    CLK  : in  std_logic;
    RST  : in  std_logic;
    EN   : in  std_logic;
    D    : in  std_logic_vector(wD-1 downto 0);
    RSTD : in  std_logic_vector(wD-1 downto 0);
    Q    : out std_logic_vector(wD-1 downto 0)
    );
end component;

component CW_ffrst
  generic (
    wD   : positive := 1
    );
  port (
    CLK  : in  std_logic;
    RST  : in  std_logic;
    D    : in  std_logic_vector(wD-1 downto 0);
    RSTD : in  std_logic_vector(wD-1 downto 0);
    Q    : out std_logic_vector(wD-1 downto 0)
    );
end component;

component CW_fftapsen
  generic (
    wD     : positive := 1;
    stages : positive := 1
    );
  port (
    CLK : in  std_logic;
    EN  : in  std_logic;
    D   : in  std_logic_vector(wD-1 downto 0);
    Q   : out std_logic_vector(stages*wD-1 downto 0)
    );
end component;

component CW_fftaps
  generic (
    wD     : positive := 1;
    stages : positive := 1
    );
  port (
    CLK : in  std_logic;
    D   : in  std_logic_vector(wD-1 downto 0);
    Q   : out std_logic_vector(stages*wD-1 downto 0)
    );
end component;

component CW_ff
  generic (
    wD  : positive := 1
    );
  port (
    CLK : in  std_logic;
    D   : in  std_logic_vector(wD-1 downto 0);
    Q   : out std_logic_vector(wD-1 downto 0)
    );
end component;

component CW_ram_r_w_s_dff
  generic (
    data_width:integer := 16 ; 
    depth:integer := 8 ; 
    rst_mode:integer := 0
  );
  port (
    clk:       IN    std_logic ; 
    rst_n:     IN    std_logic ; 
    cs_n:      IN    std_logic ; 
    wr_n:      IN    std_logic ; 
    rd_addr:   IN    std_logic_vector(F_CWARE_LOG2_X(depth)-1 DOWNTO 0) ; 
    wr_addr:   IN    std_logic_vector(F_CWARE_LOG2_X(depth)-1 DOWNTO 0) ; 
    data_in:   IN    std_logic_vector(data_width - 1 DOWNTO 0) ; 
    data_out:  OUT   std_logic_vector(data_width - 1 DOWNTO 0) 
  ) ;
end component ;


component CW_ram_r_w_s_lat
  generic (
    data_width:integer := 16 ; 
    depth:integer := 8 
  );
  port (
    clk:      in std_logic ;
    cs_n:     in std_logic ;
    wr_n:     in std_logic ;
    rd_addr:  in std_logic_vector( (F_CWARE_LOG2_X(depth) - 1) downto 0 ) ;
    wr_addr:  in std_logic_vector( (F_CWARE_LOG2_X(depth) - 1) downto 0 ) ;
    data_in:  in std_logic_vector( (data_width-1) downto 0 ) ;
    data_out: out std_logic_vector( (data_width-1) downto 0 ) 
  );
end component ;

component CW_ram_r_w_a_dff
  generic (
    data_width:integer := 16 ; 
    depth:integer := 8 ; 
    rst_mode:integer := 0 
  );
  port (
    rst_n:	   in	 std_logic ; 
    cs_n:	   in    std_logic ; 
    wr_n:	   in    std_logic ; 
    test_mode:   in    std_logic ; 
    test_clk:	   in    std_logic ; 
    rd_addr:	   in    std_logic_vector((F_CWARE_LOG2_X(depth) - 1) downto 0) ; 
    wr_addr:	   in    std_logic_vector((F_CWARE_LOG2_X(depth) - 1) downto 0) ; 
    data_in:	   in    std_logic_vector(data_width - 1 downto 0) ; 
    data_out:	   out   std_logic_vector(data_width - 1 downto 0) 
  ) ;
end component ;

component CW_ram_r_w_a_lat
  generic (
    data_width: integer := 16 ; 
    depth: integer := 8 ; 
    rst_mode: integer := 0 
  ) ;
  port (
    rst_n:    in std_logic ;
    cs_n:     in std_logic ;
    wr_n:     in std_logic ;
    rd_addr:  in std_logic_vector( (F_CWARE_LOG2_X(depth) - 1) downto 0 ) ;
    wr_addr:  in std_logic_vector( (F_CWARE_LOG2_X(depth) - 1) downto 0 ) ;
    data_in:  in std_logic_vector( (data_width-1) downto 0 ) ;
    data_out: out std_logic_vector( (data_width-1) downto 0 ) 
  );
end component ;

component CW_ram_rw_s_dff
  generic (
    data_width : integer := 16 ; 
    depth      : integer RANGE 0 TO 2**24 := 8 ; 
    rst_mode   : integer RANGE 0 TO 1 := 0 
  );
  port (
    clk:       IN    std_logic ; 
    rst_n:     IN    std_logic ; 
    cs_n:      IN    std_logic ; 
    wr_n:      IN    std_logic ; 
    rw_addr:   IN    std_logic_vector((F_CWARE_LOG2_X(depth) - 1) DOWNTO 0) ; 
    data_in:   IN    std_logic_vector(data_width - 1 DOWNTO 0) ; 
    data_out:  OUT   std_logic_vector(data_width - 1 DOWNTO 0) 
  ) ;
end component ;

component CW_ram_rw_s_lat
  port (
    clk:      in std_logic ;
    cs_n:     in std_logic ;
    wr_n:     in std_logic ;
    rw_addr:  in std_logic_vector( (F_CWARE_LOG2_X(MEM_DEPTH) - 1) downto 0 ) ;
    data_in:  in std_logic_vector( (WIDTH_WORD-1) downto 0 ) ;
    data_out: out std_logic_vector( (WIDTH_WORD-1) downto 0 ) 
  );
end component ;

component CW_ram_rw_a_dff
  generic (
    data_width:integer := 16 ; 
    depth:integer := 8 ; 
    rst_mode:integer := 0
  );
  port ( rst_n:	    in	  std_logic ; 
    cs_n:	   in    std_logic ; 
    wr_n:	   in    std_logic ; 
    test_mode:   in    std_logic ; 
    test_clk:	   in    std_logic ; 
    rw_addr:	   in    std_logic_vector( (F_CWARE_LOG2_X(depth) - 1)  downto 0) ; 
    data_in:	   in    std_logic_vector(data_width - 1 downto 0) ; 
    data_out:	   out   std_logic_vector(data_width - 1 downto 0) 
  ) ;
end component ;

component CW_ram_rw_a_lat
  generic (
    data_width: integer := 16 ; 
    depth: integer := 8 ; 
    rst_mode: integer := 0 
  ) ;
  port (
    rst_n:    in std_logic ;
    cs_n:     in std_logic ;
    wr_n:     in std_logic ;
    rw_addr:  in std_logic_vector( (F_CWARE_LOG2_X(depth) - 1) downto 0 ) ;
    data_in:  in std_logic_vector( (data_width-1) downto 0 ) ;
    data_out: out std_logic_vector( (data_width-1) downto 0 ) 
  );
end component ;

component CW_ram_2r_w_s_dff
  generic (
    data_width:integer := 16 ; 
    depth:integer := 8 ; 
    rst_mode:integer := 0
  );
  port(
    clk:           IN    std_logic ; 
    rst_n:         IN    std_logic ; 
    cs_n:          IN    std_logic ; 
    wr_n:          IN    std_logic ; 
    rd1_addr:      IN    std_logic_vector((F_CWARE_LOG2_X(depth) - 1) DOWNTO 0) ; 
    rd2_addr:      IN    std_logic_vector((F_CWARE_LOG2_X(depth) - 1) DOWNTO 0) ; 
    wr_addr:       IN    std_logic_vector((F_CWARE_LOG2_X(depth) - 1) DOWNTO 0) ; 
    data_in:       IN    std_logic_vector(data_width - 1 DOWNTO 0) ; 
    data_rd1_out:  OUT   std_logic_vector(data_width - 1 DOWNTO 0) ;
    data_rd2_out:  OUT   std_logic_vector(data_width - 1 DOWNTO 0) 
  ) ;
end component ;

component CW_ram_2r_w_s_lat
  generic (
    data_width:integer := 16 ; 
    depth:integer := 8 
  );
  port (
    clk:       in std_logic ;
    cs_n:      in std_logic ;
    wr_n:      in std_logic ;
    rd1_addr:  in std_logic_vector( (F_CWARE_LOG2_X(depth) - 1) downto 0 ) ;
    rd2_addr:  in std_logic_vector( (F_CWARE_LOG2_X(depth) - 1) downto 0 ) ;
    wr_addr:   in std_logic_vector( (F_CWARE_LOG2_X(depth) - 1) downto 0 ) ;
    data_in:   in std_logic_vector( (data_width-1) downto 0 ) ;
    data_rd1_out: out std_logic_vector( (data_width-1) downto 0 ) ;
    data_rd2_out: out std_logic_vector( (data_width-1) downto 0 ) 
  );
end component ;

component CW_ram_2r_w_a_dff  
  generic (
    data_width: integer := 16 ; 
    depth: integer := 8 ; 
    rst_mode: integer := 0 
  );
  port (
    rst_n:     in std_logic ;
    cs_n:      in std_logic ;
    wr_n:      in std_logic ;
    test_mode: in std_logic ;
    test_clk:  in std_logic ;
    rd1_addr:  in std_logic_vector( (F_CWARE_LOG2_X(depth) - 1) downto 0 ) ;
    rd2_addr:  in std_logic_vector( (F_CWARE_LOG2_X(depth) - 1) downto 0 ) ;
    wr_addr:   in std_logic_vector( (F_CWARE_LOG2_X(depth) - 1) downto 0 ) ;
    data_in:   in std_logic_vector( (data_width-1) downto 0 ) ;
    data_rd1_out: out std_logic_vector( (data_width-1) downto 0 ) ;
    data_rd2_out: out std_logic_vector( (data_width-1) downto 0 ) 
  );
end component;

component CW_ram_2r_w_a_lat
  generic (
    data_width: integer := 16 ; 
    depth: integer := 8 ; 
    rst_mode: integer := 0 
  );
  port (
    rst_n:     in std_logic ;
    cs_n:      in std_logic ;
    wr_n:      in std_logic ;
    rd1_addr:  in std_logic_vector( (F_CWARE_LOG2_X(depth) - 1) downto 0 ) ;
    rd2_addr:  in std_logic_vector( (F_CWARE_LOG2_X(depth) - 1) downto 0 ) ;
    wr_addr:   in std_logic_vector( (F_CWARE_LOG2_X(depth) - 1) downto 0 ) ;
    data_in:   in std_logic_vector( (data_width-1) downto 0 ) ;
    data_rd1_out: out std_logic_vector( (data_width-1) downto 0 ) ;
    data_rd2_out: out std_logic_vector( (data_width-1) downto 0 ) 
  ) ;
end component ;

component CW_binenc 
  generic (
    wA : positive range 2 to positive'high := 2;
    wZ : positive := 1
    );
  port (
    A   : in  std_logic_vector(wA-1 downto 0);
    Z   : out std_logic_vector(wZ-1 downto 0);
    ERR : out std_logic
    );
end component;

component CW_lzcount 
  generic (
    wA : positive range 2 to positive'high := 2;
    wZ : positive                          := 1);
  port (
    A    : in  std_logic_vector (wA-1 downto 0);
    Z    : out std_logic_vector(wZ-1 downto 0);
    All0 : out std_logic);
end component;

component CW_satrnd 
  generic (
    W   : positive := 16;
    M : positive := 15;
    L : natural :=  0 
    );
  port (
    din  : in std_logic_vector (W-1 downto 0);
    tc   : in std_logic;
    sat  : in std_logic;
    rnd  : in std_logic;
    ov   : out std_logic;
    dout : out std_logic_vector (M-L downto 0)
    );
end component;

component CW_fifoctl_s1_df
  generic
    (
      depth    : integer range 2 to 16777216 := 4;
      err_mode : integer range 0 to 2 := 0;
      rst_mode : integer range 0 to 1 := 0
      );

  port
    (
      clk          : in std_logic;
      rst_n        : in std_logic;
      push_req_n   : in std_logic;
      pop_req_n    : in std_logic;
      diag_n       : in std_logic;
      ae_level     : in std_logic_vector( bit_width(depth)-1 downto 0 );
      af_thresh    : in std_logic_vector( bit_width(depth)-1 downto 0 );
      we_n         : out std_logic;
      empty        : out std_logic;
      almost_empty : out std_logic;
      half_full    : out std_logic;
      almost_full  : out std_logic;
      full         : out std_logic;
      error        : out std_logic;
      wr_addr      : out std_logic_vector( bit_width(depth)-1 downto 0 );
      rd_addr      : out std_logic_vector( bit_width(depth)-1 downto 0 )
      );
end component;

component CW_fifoctl_s1_sf
 generic (
   depth    : integer range 2 to 16777216 := 4;
   ae_level : integer range 1 to 16777215 := 1;
   af_level : integer range 1 to 16777215 := 1;
   err_mode : integer range 0 to 2 := 0;
   rst_mode : integer range 0 to 1 := 0
  );

 port    (
   clk          : in std_logic;
   rst_n        : in std_logic;
   push_req_n   : in std_logic;
   pop_req_n    : in std_logic;
   diag_n       : in std_logic;
   we_n         : out std_logic;
   empty        : out std_logic;
   almost_empty : out std_logic;
   half_full    : out std_logic;
   almost_full  : out std_logic;
   full         : out std_logic;
   error        : out std_logic;
   wr_addr      : out std_logic_vector( bit_width(depth)-1 downto 0 );
   rd_addr      : out std_logic_vector( bit_width(depth)-1 downto 0 )
  );
end component;

component CW_lfsr_load
  generic(width : integer range 1 to 50 := 8);
  port (data  : in std_logic_vector(width-1 downto 0);
        load  : in std_logic;
        cen   : in std_logic;
        clk   : in std_logic;
        reset : in std_logic;
        count : out std_logic_vector(width-1 downto 0));
end component;

component CW_lfsr_updn
  generic(width : integer range 2 to 50 := 8);
  port (updn   : in std_logic;
        cen    : in std_logic;
        clk    : in std_logic;
        reset  : in std_logic;
        count  : out std_logic_vector(width-1 downto 0);
        tercnt : out std_logic);
end component;

component CW_lfsr_scnto
  generic(width    : integer range 2 to 50 := 8;
          count_to : integer := 5);
  port ( data   : in std_logic_vector(width-1 downto 0);
         load   : in std_logic;
         cen    : in std_logic;
         clk    : in std_logic;
         reset  : in std_logic;
         count  : out std_logic_vector(width-1 downto 0);
         tercnt : out std_logic);
end component;

component CW_lfsr_dcnto
  generic(width : integer range 1 to 50 := 8);
  port (data     : in std_logic_vector(width-1 downto 0);
        count_to : in std_logic_vector(width-1 downto 0);
        load     : in std_logic;
        cen      : in std_logic;
        clk      : in std_logic;
        reset    : in std_logic;
        count    : out std_logic_vector(width-1 downto 0);
        tercnt   : out std_logic);
end component;

component CW_div
  generic (
    a_width : integer range 2 to INTEGER'RIGHT := 8;
    b_width : integer range 2 to INTEGER'RIGHT := 8;
    tc_mode : integer range 0 to 1             := 0;
    rem_mode: integer range 0 to 1             := 1);
   port (
     a           : in  std_logic_vector (a_width-1 downto 0);
     b           : in  std_logic_vector (b_width-1 downto 0);
     quotient    : out std_logic_vector (a_width-1 downto 0);
     remainder   : out std_logic_vector (b_width-1 downto 0);
     divide_by_0 : out std_logic);  
end component;

component CW_fifo_s1_df
  generic (
    width    : integer range 1 to 256 := 8;
    depth    : integer range 2 to 256 := 4;
    err_mode : integer range 0 to 2 := 0;
    rst_mode : integer range 0 to 3 := 0
    );

  port    (
    clk          : in std_logic;
    rst_n        : in std_logic;
    push_req_n   : in std_logic;
    pop_req_n    : in std_logic;
    diag_n       : in std_logic;
    ae_level     : in std_logic_vector( bit_width(depth)-1 downto 0 );
    af_thresh    : in std_logic_vector( bit_width(depth)-1 downto 0 );
    data_in      : in std_logic_vector( width-1 downto 0 );
    empty        : out std_logic;
    almost_empty : out std_logic;
    half_full    : out std_logic;
    almost_full  : out std_logic;
    full         : out std_logic;
    error        : out std_logic;
    data_out     : out std_logic_vector( width-1 downto 0 )
    );
end component;

component CW_fifo_s1_sf
  generic (
    width    : integer range 1 to 256 := 8;
    depth    : integer range 2 to 256 := 4;
    ae_level : integer range 1 to 255 := 1;
    af_level : integer range 1 to 255 := 1;
    err_mode : integer range 0 to 2 := 0;
    rst_mode : integer range 0 to 3 := 0
    );
  port    (
    clk          : in std_logic;
    rst_n        : in std_logic;
    push_req_n   : in std_logic;
    pop_req_n    : in std_logic;
    diag_n       : in std_logic;
    data_in      : in std_logic_vector( width-1 downto 0 );
    empty        : out std_logic;
    almost_empty : out std_logic;
    half_full    : out std_logic;
    almost_full  : out std_logic;
    full         : out std_logic;
    error        : out std_logic;
    data_out     : out std_logic_vector( width-1 downto 0 )
    );
end component;

component CW_fifoctl_s2_sf
  generic (
    depth       : integer range 4 to 16777216 := 8;
    push_ae_lvl : integer range 1 to 16777215 := 2;
    push_af_lvl : integer range 1 to 16777215 := 2;
    pop_ae_lvl  : integer range 1 to 16777215 := 2;
    pop_af_lvl  : integer range 1 to 16777215 := 2;
    err_mode    : integer range 0 to 1 := 0;
    push_sync   : integer range 1 to 3 := 2;
    pop_sync    : integer range 1 to 3 := 2;
    rst_mode    : integer range 0 to 1 := 0;
    tst_mode    : integer range 0 to 1 := 0
    );

  port    (
    clk_push        : in std_logic;
    clk_pop         : in std_logic;
    rst_n           : in std_logic;
    push_req_n      : in std_logic;
    pop_req_n       : in std_logic;
    we_n            : out std_logic;
    push_empty      : out std_logic;
    push_ae         : out std_logic;
    push_hf         : out std_logic;
    push_af         : out std_logic;
    push_full       : out std_logic;
    push_error      : out std_logic;
    pop_empty       : out std_logic;
    pop_ae          : out std_logic;
    pop_hf          : out std_logic;
    pop_af          : out std_logic;
    pop_full        : out std_logic;
    pop_error       : out std_logic;
    wr_addr         : out std_logic_vector( bit_width(depth)-1 downto 0 );
    rd_addr         : out std_logic_vector( bit_width(depth)-1 downto 0 );
    push_word_count : out std_logic_vector( bit_width(depth+1)-1 downto 0 );
    pop_word_count  : out std_logic_vector( bit_width(depth+1)-1 downto 0 );
    test            : in std_logic
    );
end component;

component CW_fifo_s2_sf
  generic (
    width       : integer range 1 to 256 := 8;
    depth       : integer range 4 to 256 := 8;
    push_ae_lvl : integer range 1 to 16777215 := 2;
    push_af_lvl : integer range 1 to 16777215 := 2;
    pop_ae_lvl  : integer range 1 to 16777215 := 2;
    pop_af_lvl  : integer range 1 to 16777215 := 2;
    err_mode    : integer range 0 to 1 := 0;
    push_sync   : integer range 1 to 3 := 2;
    pop_sync    : integer range 1 to 3 := 2;
    rst_mode    : integer range 0 to 3 := 0
    );

  port    (
    clk_push   : in std_logic;
    clk_pop    : in std_logic;
    rst_n      : in std_logic;
    push_req_n : in std_logic;
    pop_req_n  : in std_logic;
    data_in    : in std_logic_vector(width-1 downto 0);
    push_empty : out std_logic;
    push_ae    : out std_logic;
    push_hf    : out std_logic;
    push_af    : out std_logic;
    push_full  : out std_logic;
    push_error : out std_logic;
    pop_empty  : out std_logic;
    pop_ae     : out std_logic;
    pop_hf     : out std_logic;
    pop_af     : out std_logic;
    pop_full   : out std_logic;
    pop_error  : out std_logic;
    data_out   : out std_logic_vector( width-1 downto 0 )
    );
end component;

component CW_asymfifoctl_s1_df
  generic (
    data_in_width  : integer range 1 to 256 := 4;
    data_out_width : integer range 1 to 256 := 16;
    depth          : integer range 2 to 16777216 := 10;
    err_mode       : integer range 0 to 2 := 1;
    rst_mode       : integer range 0 to 1 := 1;
    byte_order     : integer range 0 to 1 := 0);
	
  port (
    clk          : in std_logic;
    rst_n        : in std_logic;
    push_req_n   : in std_logic;
    flush_n      : in std_logic;
    pop_req_n    : in std_logic;
    diag_n       : in std_logic;
    data_in      : in std_logic_vector(data_in_width-1 downto 0);
    rd_data      : in std_logic_vector(max(data_in_width,data_out_width)-1 downto 0);
    ae_level     : in std_logic_vector(bit_width(depth)-1 downto 0 );
    af_thresh    : in std_logic_vector(bit_width(depth)-1 downto 0 );
    we_n         : out std_logic;
    empty        : out std_logic;
    almost_empty : out std_logic;
    half_full    : out std_logic;
    almost_full  : out std_logic;
    full         : out std_logic;
    ram_full     : out std_logic;
    error        : out std_logic;
    part_wd      : out std_logic;
    wr_data      : out std_logic_vector( max(data_in_width,data_out_width)-1 downto 0);
    wr_addr      : out std_logic_vector( bit_width(depth)-1 downto 0 );
    rd_addr      : out std_logic_vector( bit_width(depth)-1 downto 0 );
    data_out     : out std_logic_vector( data_out_width-1 downto 0)
    );
end component;

component CW_asymfifoctl_s1_sf
  generic (
            data_in_width  : integer range 1 to 256 := 4;
            data_out_width : integer range 1 to 256 := 16;
            depth          : integer range 2 to 16777216 := 10;
            ae_level       : integer range 1 to 16777215 := 1;
            af_level       : integer range 1 to 16777215 := 9;
            err_mode       : integer range 0 to 2 := 1;
            rst_mode       : integer range 0 to 1 := 1;
            byte_order     : integer range 0 to 1 := 0);

   port (
            clk          : in std_logic;
            rst_n        : in std_logic;
            push_req_n   : in std_logic;
            flush_n      : in std_logic;
            pop_req_n    : in std_logic;
            diag_n       : in std_logic;
            data_in      : in std_logic_vector(data_in_width-1 downto 0);
            rd_data      : in std_logic_vector(max(data_in_width,data_out_width)-1 downto 0);
            we_n         : out std_logic;
            empty        : out std_logic;
            almost_empty : out std_logic;
            half_full    : out std_logic;
            almost_full  : out std_logic;
            full         : out std_logic;
            ram_full     : out std_logic;
            error        : out std_logic;
            part_wd      : out std_logic;
            wr_data      : out std_logic_vector( max(data_in_width,data_out_width)-1 downto 0);
            wr_addr      : out std_logic_vector( bit_width(depth)-1 downto 0 );
            rd_addr      : out std_logic_vector( bit_width(depth)-1 downto 0 );
            data_out     : out std_logic_vector( data_out_width-1 downto 0)
            );
end component;

component CW_asymfifo_s1_df 
  generic (
    data_in_width       : integer range 1 to 256 := 4;
    data_out_width      : integer range 1 to 256 := 16;
    depth               : integer range 2 to 256 := 10;
    err_mode            : integer range 0 to 2   := 1;
    rst_mode            : integer range 0 to 3   := 1;
    byte_order          : integer range 0 to 1   := 0
    );

  port (
    clk               : in std_logic;
    rst_n             : in std_logic;
    push_req_n        : in std_logic;
    flush_n           : in std_logic;
    pop_req_n         : in std_logic;
    diag_n            : in std_logic;
    data_in           : in std_logic_vector(data_in_width-1 downto 0);
    ae_level          : in std_logic_vector(bit_width(depth)-1 downto 0);
    af_thresh         : in std_logic_vector(bit_width(depth)-1 downto 0);
    empty             : out std_logic;
    almost_empty      : out std_logic;
    half_full         : out std_logic;
    almost_full       : out std_logic;
    full              : out std_logic;
    ram_full          : out std_logic;
    error             : out std_logic;
    part_wd           : out std_logic;
    data_out          : out std_logic_vector(data_out_width-1 downto 0));
end component;

component CW_asymfifo_s1_sf
  generic (
             data_in_width   : integer range 1 to 256 := 4;
             data_out_width  : integer range 1 to 256 := 16;
             depth           : integer range 2 to 256 := 10;
             ae_level        : integer range 1 to 255 := 1;
             af_level        : integer range 1 to 255 := 9;
             err_mode        : integer range 0 to 2   := 2;
             rst_mode        : integer range 0 to 3   := 1;
             byte_order      : integer range 0 to 1   := 0
           );

  port    (
               clk          : in std_logic;
               rst_n        : in std_logic;
               push_req_n   : in std_logic;
               flush_n      : in std_logic;
               pop_req_n    : in std_logic;
               diag_n       : in std_logic;
               data_in      : in std_logic_vector( data_in_width-1 downto 0 );
               empty        : out std_logic;
               almost_empty : out std_logic;
               half_full    : out std_logic;
               almost_full  : out std_logic;
               full         : out std_logic;
               ram_full     : out std_logic;
               error        : out std_logic;
               part_wd      : out std_logic;
               data_out     : out std_logic_vector( data_out_width-1 downto 0 )
    );
end component;

component CW_asymfifoctl_s2_sf
  generic (
    data_in_width  : integer range 1 to 256 ;
    data_out_width : integer range 1 to 256 ;
    depth          : integer range 4 to 16777216 := 8;
    push_ae_lvl    : integer range 1 to 16777215 := 2;
    push_af_lvl    : integer range 1 to 16777215 := 2;
    pop_ae_lvl     : integer range 1 to 16777215 := 2;
    pop_af_lvl     : integer range 1 to 16777215 := 2;
    err_mode       : integer range 0 to 1 := 0;
    push_sync      : integer range 1 to 3 := 2;
    pop_sync       : integer range 1 to 3 := 2;
    rst_mode       : integer range 0 to 1 := 0;
    byte_order     : integer range 0 to 1 := 0
    );

  port    (
    clk_push   : in std_logic;
    clk_pop    : in std_logic;
    rst_n      : in std_logic;
    push_req_n : in std_logic;
    flush_n    : in std_logic;
    pop_req_n  : in std_logic;
    data_in    : in std_logic_vector(data_in_width-1 downto 0);
    rd_data    : in std_logic_vector(max(data_in_width,data_out_width)-1 downto 0);
    we_n       : out std_logic;
    push_empty : out std_logic;
    push_ae    : out std_logic;
    push_hf    : out std_logic;
    push_af    : out std_logic;
    push_full  : out std_logic;
    ram_full   : out std_logic;
    part_wd    : out std_logic;
    push_error : out std_logic;
    pop_empty  : out std_logic;
    pop_ae     : out std_logic;
    pop_hf     : out std_logic;
    pop_af     : out std_logic;
    pop_full   : out std_logic;
    pop_error  : out std_logic;
    wr_data    : out std_logic_vector(max(data_in_width,data_out_width)-1 downto 0);
    wr_addr    : out std_logic_vector( bit_width(depth)-1 downto 0 );
    rd_addr    : out std_logic_vector( bit_width(depth)-1 downto 0 );
    data_out   : out std_logic_vector(data_out_width-1 downto 0)
    );
end component;

component CW_sqrt 
  generic (
    width  : positive             := 8;
    tc_mode  : natural range 0 to 1 :=0
    );
  port (
    a    : in  std_logic_vector(width-1 downto 0);
    root : out std_logic_vector((width+1)/2-1 downto 0)
    );
end component;

component CW_asymfifo_s2_sf 
  generic (
    data_in_width  : integer range 1 to 256;
    data_out_width : integer range 1 to 256;
    depth          : integer range 4 to 256 := 8;
    push_ae_lvl    : integer range 1 to 16777215 := 2;
    push_af_lvl    : integer range 1 to 16777215 := 2;
    pop_ae_lvl     : integer range 1 to 16777215 := 2;
    pop_af_lvl     : integer range 1 to 16777215 := 2;
    err_mode       : integer range 0 to 1 := 0;
    push_sync      : integer range 1 to 3 := 2;
    pop_sync       : integer range 1 to 3 := 2;
    rst_mode       : integer range 0 to 3 := 1;
    byte_order     : integer range 0 to 1 := 0
    );

  port    (
    clk_push   : in std_logic;
    clk_pop    : in std_logic;
    rst_n      : in std_logic;
    push_req_n : in std_logic;
    flush_n    : in std_logic;
    pop_req_n  : in std_logic;
    data_in    : in std_logic_vector(data_in_width-1 downto 0);
    push_empty : out std_logic;
    push_ae    : out std_logic;
    push_hf    : out std_logic;
    push_af    : out std_logic;
    push_full  : out std_logic;
    ram_full   : out std_logic;
    part_wd    : out std_logic;
    push_error : out std_logic;
    pop_empty  : out std_logic;
    pop_ae     : out std_logic;
    pop_hf     : out std_logic;
    pop_af     : out std_logic;
    pop_full   : out std_logic;
    pop_error  : out std_logic;
    data_out   : out std_logic_vector(data_out_width-1 downto 0 )
    );
end component;

component CW_shifter
  generic (
    data_width     : integer range 2 to INTEGER'RIGHT := 8;
    sh_width       : integer range 1 to INTEGER'RIGHT := 3;
    inv_mode       : integer range 0 to 3 := 0
    );

  port (
    data_in  : in  std_logic_vector(data_width-1 downto 0);
    data_tc  : in  std_logic;
    sh       : in  std_logic_vector(sh_width-1 downto 0);
    sh_tc    : in  std_logic;
    sh_mode  : in  std_logic;
    data_out : out std_logic_vector(data_width-1 downto 0)
    );
end component;

component CW_inc_gray 
  generic(width : integer range 1 to 2**30 := 8);
  port (a     : in std_logic_vector(width-1 downto 0);
        ci    : in std_logic;
        z     : out std_logic_vector(width-1 downto 0));
end component;

component CW_cntr_gray 

  generic (
    width : integer range 1 to 2**30 := 4);

  port (
    clk    : in  std_logic;
    rst_n  : in  std_logic;
    init_n : in  std_logic;
    load_n : in  std_logic;
    data   : in  std_logic_vector(width-1 downto 0);
    cen    : in  std_logic;
    count   : out std_logic_vector(width-1 downto 0));
end component;

component CW_ecc 
  generic(width    : integer := 32;
          chkbits  : integer := 7;
          synd_sel : integer := 0);
  port(gen        : in std_logic;
       correct_n  : in std_logic;
       datain     : in std_logic_vector(width-1 downto 0);
       chkin      : in std_logic_vector(chkbits-1 downto 0);
       err_detect : out std_logic;
       err_multpl : out std_logic;
       dataout    : out std_logic_vector(width-1 downto 0);
       chkout     : out std_logic_vector(chkbits-1 downto 0)
       );
end component;

component CW_8b10b_enc
  generic (
    bytes      : integer range 1 to 16 := 2;
    k28_5_only : integer range 0 to 1  := 0;
    en_mode    : integer  range 0 to 1 :=0;
    init_mode  :  integer range 0 to 1 :=0;
    rst_mode   : integer range 0 to 1 :=0 ;
    op_iso_mode: integer :=0
    );

  port (
    clk         : in  std_logic;
    rst_n       : in  std_logic;
    init_rd_n   : in  std_logic;
    init_rd_val : in  std_logic;
    k_char      : in  std_logic_vector(bytes-1 downto 0);
    data_in     : in  std_logic_vector(bytes*8-1 downto 0);
    rd          : out std_logic;
    data_out    : out std_logic_vector(bytes*10-1 downto 0);
    enable      : in std_logic);
end component;

component CW_bc_3 
  port ( capture_clk : in std_logic;
         capture_en  : in std_logic;
         shift_dr    : in std_logic;
         mode        : in std_logic;
         si          : in std_logic;
         data_in     : in std_logic;
         data_out    : out std_logic;
         so          : out std_logic);
end component;

component CW_bc_4 
  port ( capture_clk : in std_logic;
         capture_en  : in std_logic;
         shift_dr    : in std_logic;
         si          : in std_logic;
         data_in     : in std_logic;
         so          : out std_logic;
         data_out    : out std_logic);
end component;

component CW_bc_1 
  port ( capture_clk : in std_logic;
         update_clk  : in std_logic;
         capture_en  : in std_logic;
         update_en   : in std_logic;
         shift_dr    : in std_logic;
         mode        : in std_logic;
         si          : in std_logic;
         data_in     : in std_logic;
         data_out    : out std_logic;
         so          : out std_logic);
end component;

component CW_bc_2
    port ( capture_clk : in std_logic;
           update_clk  : in std_logic;
           capture_en  : in std_logic;
           update_en   : in std_logic;
           shift_dr    : in std_logic;
           mode        : in std_logic;
           si          : in std_logic;
           data_in     : in std_logic;
           data_out    : out std_logic;
           so          : out std_logic);
end component;

component CW_bc_5 
  port (
         capture_clk  : in std_logic;
         update_clk   : in std_logic;
         capture_en   : in std_logic;
         update_en    : in std_logic;
         shift_dr     : in std_logic;
         mode         : in std_logic;
         intest       : in std_logic;
         si           : in std_logic;
         data_in      : in std_logic;
         data_out     : out std_logic;
         so           : out std_logic
          );
end component;

component CW_bc_7 

  port (
    capture_clk : in std_logic;
    update_clk  : in std_logic;
    capture_en  : in std_logic;
    update_en   : in std_logic;
    shift_dr    : in std_logic;
    mode1       : in std_logic;
    mode2       : in std_logic;
    si          : in std_logic;
    pin_input   : in std_logic;
    control_out : in std_logic;
    output_data : in std_logic;
    ic_input    : out std_logic;
    data_out    : out std_logic;
    so          : out std_logic);

end component;

component CW_bc_8 

  port (
    capture_clk : in  std_logic;
    update_clk  : in  std_logic;
    capture_en  : in  std_logic;
    update_en   : in  std_logic;
    shift_dr    : in  std_logic;
    mode        : in  std_logic;
    si          : in  std_logic;
    pin_input   : in  std_logic;
    output_data : in  std_logic;
    ic_input    : out  std_logic;
    data_out    : out std_logic;
    so          : out std_logic);

end component;

component CW_bc_9 
  port (
    capture_clk : in  std_logic;
    update_clk  : in  std_logic;
    capture_en  : in  std_logic;
    update_en   : in  std_logic;
    shift_dr    : in  std_logic;
    mode1       : in  std_logic;
    mode2       : in  std_logic;
    si          : in  std_logic;
    pin_input   : in  std_logic;
    output_data : in  std_logic;
    data_out    : out std_logic;
    so          : out std_logic);
end component;

component CW_bc_10 
  port (
         capture_clk  : in std_logic;
         update_clk   : in std_logic;
         capture_en   : in std_logic;
         update_en    : in std_logic;
         shift_dr     : in std_logic;
         mode         : in std_logic;
         si           : in std_logic;
         pin_input    : in std_logic;
         output_data  : in std_logic;
         data_out     : out std_logic;
         so           : out std_logic
          );
end component;

component CW_cmp_dx 

  generic (
    width    : integer range 4 to (2**30) := 8;
    p1_width : integer range 2 to (2**30)-2 := 4 );

  port (
    a    : in  std_logic_vector(width-1 downto 0);
    b    : in  std_logic_vector(width-1 downto 0);
    tc   : in  std_logic;
    dplx : in  std_logic;
    lt1  : out std_logic;
    eq1  : out std_logic;
    gt1  : out std_logic;
    lt2  : out std_logic;
    eq2  : out std_logic;
    gt2  : out std_logic);

end component;

component CW_8b10b_dec 

  generic (
      bytes      :integer range 1 to 16 := 2;
      k28_5_only :integer range 0 to 1 := 0;
      en_mode    : integer range 0 to 1 := 0;
      init_mode  : integer range 0 to 1 := 0;
      rst_mode   : integer range 0 to 1 := 0;
      op_iso_mode :integer range 0 to 4 := 0);

  port (
    clk        :in std_logic;
    rst_n      :in std_logic;
    init_rd_n  :in std_logic;
    init_rd_val:in std_logic;
    data_in    :in std_logic_vector((bytes*10-1) downto 0);
    error      :out std_logic;
    rd         :out std_logic;
    k_char     :out std_logic_vector((bytes-1) downto 0);
    data_out   : out std_logic_vector((bytes*8 - 1) downto 0);
    rd_err     :out std_logic;
    code_err   :out std_logic;
    enable     : in std_logic;
    rd_err_bus :out std_logic_vector((bytes-1) downto 0);
    code_err_bus :out std_logic_vector((bytes-1) downto 0));
end component;

component CW_par_gen 

  generic (
    width    : integer range 1 to 256 := 8;
    par_type : integer range 0 to 1   := 0);

  port (
    datain : in  std_logic_vector(width-1 downto 0);
    parity : out std_logic);

end component;

component CW_8b10b_unbal 
  generic (
    k28_5_only :integer range 0 to 1 := 0);
  port (
    k_char   : in std_logic;
    data_in  : in std_logic_vector(7 downto 0);
    unbal    : out std_logic);
end component;

component CW_stackctl

  generic (
    depth    : integer range 2 to 2**24 := 8;
    err_mode : integer range 0 to 1 := 0;
    rst_mode : integer range 0 to 1 := 0);

  port (
    clk        : in  std_logic;
    rst_n      : in  std_logic;
    push_req_n : in  std_logic;
    pop_req_n  : in  std_logic;
    we_n       : out std_logic;
    empty      : out std_logic;
    full       : out std_logic;
    error      : out std_logic;
    wr_addr    : out std_logic_vector(bit_width(depth)-1 downto 0);
    rd_addr    : out std_logic_vector(bit_width(depth)-1 downto 0));

end component;

component CW_arbiter_fcfs

  generic (
    n           : integer range 2 to 32 := 4;
    park_mode   : integer range 0 to 1  := 1;
    park_index  : integer range 0 to 31  := 0;
    output_mode : integer range 0 to 1  := 1
    );

  port (
    clk         : in std_logic;
    rst_n       : in std_logic;
    request     : in std_logic_vector(n-1 downto 0);
    lock        : in std_logic_vector(n-1 downto 0);
    mask        : in std_logic_vector(n-1 downto 0);
    parked      : out std_logic;
    granted     : out std_logic;
    locked      : out std_logic;
    grant       : out std_logic_vector(n-1 downto 0);
    grant_index : out std_logic_vector(bit_width(n)-1 downto 0)
    );

end component;

component CW_shad_reg 

 generic (
   width        : integer range 1 to 512 := 8;
   bld_shad_reg : integer range 0 to 1   := 0);

 port (
   datain   : in  std_logic_vector(width-1 downto 0);
   sys_clk  : in  std_logic;
   shad_clk : in  std_logic;
   reset    : in  std_logic;
   SI       : in  std_logic;
   SE       : in  std_logic;
   sys_out  : out std_logic_vector(width-1 downto 0);
   shad_out : out std_logic_vector(width-1 downto 0);
   SO       : out std_logic);
end component;

component CW_stack
  generic (
    width    : integer range 1 to 256 := 8;
    depth    : integer range 2 to 256 := 4;
    err_mode : integer range 0 to 1   := 0;
    rst_mode : integer range 0 to 3   := 0
    );

  port  (
    clk        : in std_logic;
    rst_n      : in std_logic;
    push_req_n : in std_logic;
    pop_req_n  : in std_logic;
    data_in    : in std_logic_vector( width-1 downto 0 );
    empty      : out std_logic;
    full       : out std_logic;
    error      : out std_logic;
    data_out   : out std_logic_vector( width-1 downto 0 )
    );
end component;

component CW_addsub_dx 
  generic (
    width    : integer range 4 to (2**30) := 4;
    p1_width : integer range 2 to (2**30)-2 := 2 );
  port (
    a    : in  std_logic_vector(width-1 downto 0);
    b    : in  std_logic_vector(width-1 downto 0);
    ci1  : in std_logic;
    ci2  : in std_logic;
    addsub  : in std_logic;
    tc   : in  std_logic;
    sat  : in std_logic;
    avg  : in std_logic;
    dplx : in  std_logic;
    sum  : out std_logic_vector(width-1 downto 0);
    co1  : out std_logic;
    co2  : out std_logic);

end component;


component CW_crc_p 
   generic (
    data_width : integer range 1 to 512   := 16;
    poly_size  : integer range 2 to 64    := 16;
    crc_cfg    : integer range 0 to 7     := 7;
    bit_order  : integer range 0 to 3     := 3;
    poly_coef0 : integer range 1 to 65535 := 4129;
    poly_coef1 : integer range 0 to 65535 := 0;
    poly_coef2 : integer range 0 to 65535 := 0;
    poly_coef3 : integer range 0 to 65535 := 0);

  port (
    data_in : in  std_logic_vector(data_width-1 downto 0);
    crc_in  : in  std_logic_vector(poly_size-1 downto 0);
    crc_ok  : out std_logic;
    crc_out : out std_logic_vector(poly_size-1 downto 0));

end component;

component CW_arbiter_dp 

  generic (
    n           : integer range 2 to 32 := 4;
    park_mode   : integer range 0 to 1  := 1;
    park_index  : integer range 0 to 31  := 0;
    output_mode : integer range 0 to 1  := 1
    );

  port (
    clk         : in std_logic;
    rst_n       : in std_logic;
    request     : in std_logic_vector(n-1 downto 0);
    priority    : in std_logic_vector(((n*bit_width(n))-1) downto 0);
    lock        : in std_logic_vector(n-1 downto 0);
    mask        : in std_logic_vector(n-1 downto 0);
    parked      : out std_logic;
    granted     : out std_logic;
    locked      : out std_logic;
    grant       : out std_logic_vector(n-1 downto 0);
    grant_index : out std_logic_vector(bit_width(n)-1 downto 0)
    );

end component;

component CW_arbiter_sp 

  generic (
    n           : integer range 2 to 32 := 4;
    park_mode   : integer range 0 to 1  := 1;
    park_index  : integer range 0 to 31  := 0;
    output_mode : integer range 0 to 1  := 1
    );

  port (
    clk         : in std_logic;
    rst_n       : in std_logic;
    request     : in std_logic_vector(n-1 downto 0);
    lock        : in std_logic_vector(n-1 downto 0);
    mask        : in std_logic_vector(n-1 downto 0);
    parked      : out std_logic;
    granted     : out std_logic;
    locked      : out std_logic;
    grant       : out std_logic_vector(n-1 downto 0);
    grant_index : out std_logic_vector(bit_width(n)-1 downto 0)
    );

end component;

component CW_arbiter_2t 

  generic (
    n           : integer range 2 to 32 := 4;
    p_width     : integer range 1 to 5 := 2;
    park_mode   : integer range 0 to 1  := 1;
    park_index  : integer range 0 to 31  := 0;
    output_mode : integer range 0 to 1  := 1
    );

  port (
    clk         : in std_logic;
    rst_n       : in std_logic;
    request     : in std_logic_vector(n-1 downto 0);
    priority    : in std_logic_vector((p_width * n)-1 downto 0);
    lock        : in std_logic_vector(n-1 downto 0);
    mask        : in std_logic_vector(n-1 downto 0);
    parked      : out std_logic;
    granted     : out std_logic;
    locked      : out std_logic;
    grant       : out std_logic_vector(n-1 downto 0);
    grant_index : out std_logic_vector(bit_width(n)-1 downto 0)
    );

end component;


component CW_sin
  generic (
    A_width      : INTEGER range 2 to 34 := 8;
    sin_width    : INTEGER range 2 to 64 := 8
    );
  port (
    A    : in  std_logic_vector(A_width-1 downto 0);
    SIN  : out std_logic_vector(sin_width-1 downto 0)
    );
end component;

component CW_cos
  generic (
    A_width      : INTEGER range 2 to 34 := 8;
    cos_width    : INTEGER range 2 to 64 := 8
    );
  port (
    A    : in  std_logic_vector(A_width-1 downto 0);
    COS  : out std_logic_vector(cos_width-1 downto 0)
    );
end component;

component CW_sincos
  generic (
    A_width      : INTEGER range 2 to 34 := 8;
    wave_width   : INTEGER range 2 to 64 := 8
    );
  port (
    A         : in  std_logic_vector(A_width-1 downto 0);
    SIN_COS   : in  std_logic;
    WAVE      : out std_logic_vector(wave_width-1 downto 0)
    );
end component;

component CW_crc_s 
  generic (
    data_width : integer range 1 to 64    := 16;
    poly_size  : integer range 2 to 64    := 16;
    crc_cfg    : integer range 0 to 7     := 7;
    bit_order  : integer range 0 to 3     := 3;
    poly_coef0 : integer range 1 to 65535 := 4129;
    poly_coef1 : integer range 0 to 65535 := 0;
    poly_coef2 : integer range 0 to 65535 := 0;
    poly_coef3 : integer range 0 to 65535 := 0);
  port (
    clk        : in  std_logic;
    rst_n      : in  std_logic;
    init_n     : in  std_logic;
    enable     : in  std_logic;
    drain      : in  std_logic;
    ld_crc_n   : in  std_logic;
    data_in    : in  std_logic_vector(data_width-1 downto 0);
    crc_in     : in  std_logic_vector(poly_size-1 downto 0);
    draining   : out std_logic;
    drain_done : out std_logic;
    crc_ok     : out std_logic;
    data_out   : out std_logic_vector(data_width-1 downto 0);
    crc_out    : out std_logic_vector(poly_size-1 downto 0));
end component;

component CW_sqrt_seq
  generic (
    width       : integer range 6 to (2**30) := 6;
    tc_mode     : integer range 0 to 1 := 0;
    num_cyc     : integer range 3 to (2**30) := 3;
    rst_mode    : integer range 0 to 1 := 0;
    input_mode  : integer range 0 to 1 := 1;
    output_mode : integer range 0 to 1 := 1;
    early_start : integer range 0 to 1 := 0);

  port (
    clk      : in  std_logic;
    rst_n    : in  std_logic;
    hold     : in  std_logic;
    start    : in  std_logic;
    a        : in  std_logic_vector(width-1 downto 0);
    complete : out std_logic;
    root     : out std_logic_vector((width+1)/2-1 downto 0));
end component;

component CW_tap

  generic (
    width     : integer range 2 to 32:= 2;
    id        : integer range 0 to 1:= 0;
    version   : integer range 0 to 15:= 0;
    part      : integer range 0 to 65535:= 0;
    man_num   : integer range 0 to 2047:= 0;
    sync_mode : integer range 0 to 1:= 0);

  port (
    tck             : in  std_logic;
    trst_n          : in  std_logic;
    tms             : in  std_logic;
    tdi             : in  std_logic;
    so              : in  std_logic;
    bypass_sel      : in  std_logic;
    test            : in  std_logic;
    sentinel_val    : in  std_logic_vector( width-2 downto 0);
    clock_dr        : out std_logic;
    shift_dr        : out std_logic;
    update_dr       : out std_logic;
    tdo             : out std_logic;
    tdo_en          : out std_logic;
    tap_state       : out std_logic_vector(15 downto 0);
    extest          : out std_logic;
    samp_load       : out std_logic;
    instructions    : out std_logic_vector( width-1 downto 0);
    sync_capture_en : out std_logic;
    sync_update_dr  : out std_logic);


end component;

component CW_tap_uc

  generic (
    width         : integer range 2 to 32:= 2;
    id            : integer range 0 to 1 := 0;
    idcode_opcode : integer              := 1;
    version       : integer range 0 to 15:= 0;
    part          : integer range 0 to 65535:= 0;
    man_num       : integer range 0 to 2047:= 0;
    sync_mode     : integer range 0 to 1:= 0);

  port (
    tck             : in  std_logic;
    trst_n          : in  std_logic;
    tms             : in  std_logic;
    tdi             : in  std_logic;
    so              : in  std_logic;
    bypass_sel      : in  std_logic;
    sentinel_val    : in  std_logic_vector( width-2 downto 0);
    device_id_sel   : in  std_logic;
    user_code_sel   : in  std_logic;
    user_code_val   : in  std_logic_vector(31 downto 0);
    ver             : in  std_logic_vector(3 downto 0);
    ver_sel         : in  std_logic;
    part_num        : in  std_logic_vector(15 downto 0);
    part_num_sel    : in  std_logic;
    mnfr_id         : in  std_logic_vector(10 downto 0);
    mnfr_id_sel     : in  std_logic;
    clock_dr        : out std_logic;
    shift_dr        : out std_logic;
    update_dr       : out std_logic;
    tdo             : out std_logic;
    tdo_en          : out std_logic;
    tap_state       : out std_logic_vector(15 downto 0);
    instructions    : out std_logic_vector( width-1 downto 0);
    sync_capture_en : out std_logic;
    sync_update_dr  : out std_logic);


end component;

component CW_fir

  generic (
    data_in_width  : integer range 1 to 2**30  := 8;
    coef_width     : integer range 1 to 2**30 := 8;
    data_out_width : integer range 1 to 2**30 := 16;
    order          : integer range 2 to 256 := 6
    );
  port (
    clk            : in std_logic;
    rst_n          : in std_logic;
    coef_shift_en  : in std_logic;
    tc             : in std_logic;
    data_in        : in std_logic_vector(data_in_width-1 downto 0);
    coef_in        : in std_logic_vector(coef_width-1 downto 0);
    init_acc_val   : in std_logic_vector(data_out_width-1 downto 0);
    data_out       : out std_logic_vector(data_out_width-1 downto 0);
    coef_out       : out std_logic_vector(coef_width -1 downto 0)
    );

end component;

component CW_mult_seq
  generic (
    a_width     :     integer range 3 to (2**30):= 3;
    b_width     :     integer range 3 to (2**30):= 3;
    tc_mode     :     integer range 0 to 1 := 0;
    num_cyc     :     integer range 3 to (2**30):= 3;
    rst_mode    :     integer range 0 to 1 := 0;
    input_mode  :     integer range 0 to 1 := 1;
    output_mode :     integer range 0 to 1 := 1;
    early_start :     integer range 0 to 1 := 0);
  port (
    clk         : in  std_logic;
    rst_n       : in  std_logic;
    hold        : in  std_logic;
    start       : in  std_logic;
    a           : in  std_logic_vector(a_width -1 downto 0);
    b           : in  std_logic_vector(b_width -1 downto 0);
    complete    : out std_logic;
    product     : out std_logic_vector(a_width+b_width-1 downto 0));
end component;

component CW_add_seq
  generic (
    a_width     :     integer range 3 to (2**30):= 3;
    b_width     :     integer range 3 to (2**30):= 3;
    num_cyc     :     integer range 3 to (2**30):= 3;
    rst_mode    :     integer range 0 to 1 := 0;
    input_mode  :     integer range 0 to 1 := 1;
    output_mode :     integer range 0 to 1 := 1;
    early_start :     integer range 0 to 1 := 0);
  port (
    clk         : in  std_logic;
    rst_n       : in  std_logic;
    hold        : in  std_logic;
    start       : in  std_logic;
    a           : in  std_logic_vector(a_width -1 downto 0);
    b           : in  std_logic_vector(b_width -1 downto 0);
    complete    : out std_logic;
    sum		: out std_logic_vector(max(a_width,b_width)-1 downto 0));
end component;

component CW_sub_seq
  generic (
    a_width     :     integer range 3 to (2**30):= 3;
    b_width     :     integer range 3 to (2**30):= 3;
    num_cyc     :     integer range 3 to (2**30):= 3;
    rst_mode    :     integer range 0 to 1 := 0;
    input_mode  :     integer range 0 to 1 := 1;
    output_mode :     integer range 0 to 1 := 1;
    early_start :     integer range 0 to 1 := 0);
  port (
    clk         : in  std_logic;
    rst_n       : in  std_logic;
    hold        : in  std_logic;
    start       : in  std_logic;
    a           : in  std_logic_vector(a_width -1 downto 0);
    b           : in  std_logic_vector(b_width -1 downto 0);
    complete    : out std_logic;
    diff        : out std_logic_vector(max(a_width,b_width)-1 downto 0));
end component;


component CW_fp_exp2
  generic (
    sig_width   : integer :=23;
    exp_width   : integer :=8;
    ieee_compliance : integer range 0 to 1 := 1;
    arch        : integer range 0 to 1 := 0);
  port (
    a           : in  std_logic_vector((exp_width+sig_width) downto 0); 
    z		: out std_logic_vector((exp_width+sig_width) downto 0);
    status      : out std_logic_vector(7 downto 0));
end component;

component CW_fp_log2
  generic (
    sig_width   : integer :=23;
    exp_width   : integer :=8;
    ieee_compliance : integer range 0 to 1 := 1;
    arch        : integer range 0 to 1 := 0);
  port (
    a           : in  std_logic_vector((exp_width+sig_width) downto 0);
    z           : out std_logic_vector((exp_width+sig_width) downto 0);
    status      : out std_logic_vector(7 downto 0));
end component;

component CW_fp_i2flt
  generic (
    sig_width   : integer :=23;
    exp_width   : integer :=8;
    isize       : integer :=32;
    isign       : integer range 0 to 1 := 1);
  port (
    a           : in  std_logic_vector((isize-1) downto 0);
    rnd         : in  std_logic_vector(2 downto 0);
    z           : out std_logic_vector((exp_width+sig_width) downto 0);
    status      : out std_logic_vector(7 downto 0));
end component;

component CW_fp_flt2i
  generic (
    sig_width   : integer :=23;
    exp_width   : integer :=8;
    isize       : integer :=32;
    ieee_compliance       : integer range 0 to 1 := 1);
  port (
    a           : in  std_logic_vector((exp_width+sig_width) downto 0);
    rnd         : in  std_logic_vector(2 downto 0);
    z           : out std_logic_vector((isize-1) downto 0);
    status      : out std_logic_vector(7 downto 0));
end component;

component CW_fp_div
  generic (
    sig_width   : integer :=23;
    exp_width   : integer :=8;
    ieee_compliance : integer range 0 to 1 := 0;
    faithful_round        : integer range 0 to 1 := 0);
  port (
    a           : in  std_logic_vector((exp_width+sig_width) downto 0);
    b           : in  std_logic_vector((exp_width+sig_width) downto 0);
    rnd 	: in  std_logic_vector(2 downto 0);
    z           : out std_logic_vector((exp_width+sig_width) downto 0);
    status      : out std_logic_vector(7 downto 0));
end component;


component CW_norm
  generic (
    a_width     : integer :=8;
    srch_wind   : integer :=8;
    exp_width   : integer :=4;
    exp_ctr     : integer range 0 to 1 := 1);
  port (
    a           : in  std_logic_vector((a_width-1)   downto 0);
    exp_offset  : in  std_logic_vector((exp_width-1) downto 0);
    no_detect   : out std_logic;
    ovfl        : out std_logic;
    b           : out std_logic_vector((a_width-1) downto 0);
    exp_adj     : out std_logic_vector((exp_width-1) downto 0));
end component;


component CW_fir_seq 

  generic
         (
           data_in_width   : integer range 1 to 2**30 := 8;
           coef_width      : integer range 1 to 2**30 := 8;
           data_out_width  : integer range 1 to 2**30 := 16;
           order           : integer range 2 to 256   := 6
           );

  port
      (
        clk            : in std_logic;
        rst_n          : in std_logic;
        coef_shift_en  : in std_logic;
        tc             : in std_logic;
        run            : in std_logic;
        data_in        : in std_logic_vector(data_in_width-1 downto 0);
        coef_in        : in std_logic_vector(coef_width-1 downto 0);
        init_acc_val   : in std_logic_vector(data_out_width-1 downto 0);
        start          : out std_logic;
        hold           : out std_logic;
        data_out       : out std_logic_vector (data_out_width-1 downto 0)
        );
end component;

component CW_iir_dc  

  generic (
    data_in_width       : integer range 2 to (2**30) := 8;
    data_out_width      : integer range 2 to (2**30) := 16;
    frac_data_out_width : integer range 0 to (2**30) := 4;
    feedback_width      : integer range 2 to (2**30) := 12;
    max_coef_width      : integer range 2 to (2**30) := 8;
    frac_coef_width     : integer range 0 to (2**30) := 4;
    saturation_mode     : integer range 0 to 1 := 0;
    out_reg             : integer range 0 to 1 := 1);

  port (
    clk        : in  std_logic;
    rst_n      : in  std_logic;
    init_n     : in  std_logic;
    enable     : in  std_logic;
    A1_coef    : in  std_logic_vector(max_coef_width-1 downto 0);
    A2_coef    : in  std_logic_vector(max_coef_width-1 downto 0);
    B0_coef    : in  std_logic_vector(max_coef_width-1 downto 0);
    B1_coef    : in  std_logic_vector(max_coef_width-1 downto 0);
    B2_coef    : in  std_logic_vector(max_coef_width-1 downto 0);
    data_in    : in  std_logic_vector(data_in_width-1 downto 0);
    data_out   : out std_logic_vector(data_out_width-1 downto 0);
    saturation : out std_logic
    );

end component;

component CW_dpll_sd 
  generic (
   width            : integer range 1 to 16  := 1;
   divisor          : integer range 4 to 256 := 4;
   gain             : integer range 1 to 2   := 1;
   filter           : integer range 0 to 8   := 2;
   windows          : integer range 1 to 128 := 1
   );
  port (
    clk       : in std_logic;
    rst_n     : in std_logic;
    stall     : in std_logic;
    squelch   : in std_logic;
    window    : in std_logic_vector(bit_width(windows) -1 downto 0);
    data_in   : in std_logic_vector(width -1 downto 0);
    clk_out   : out std_logic;
    bit_ready : out std_logic;
    data_out  : out std_logic_vector(width-1 downto 0)
    );
end component;

component CW_iir_sc  

  generic (
    data_in_width       : integer range 2 to (2**30) := 8;
    data_out_width      : integer range 2 to (2**30) := 16;
    frac_data_out_width : integer range 0 to (2**30) := 4;
    feedback_width      : integer range 2 to (2**30) := 12;
    max_coef_width      : integer range 2 to 31      := 8;
    frac_coef_width     : integer range 0 to (2**30) := 4;
    saturation_mode     : integer range 0 to 1 := 0;
    out_reg             : integer range 0 to 1 := 1;
    A1_coef             : integer range -(2**30) to (2**30) := 0;
    A2_coef             : integer range -(2**30) to (2**30) := 0;
    B0_coef             : integer range -(2**30) to (2**30) := 0;
    B1_coef             : integer range -(2**30) to (2**30) := 0;
    B2_coef             : integer range -(2**30) to (2**30) := 0);

  port (
    clk        : in  std_logic;
    rst_n      : in  std_logic;
    init_n     : in  std_logic;
    enable     : in  std_logic;
    data_in    : in  std_logic_vector(data_in_width-1 downto 0);
    data_out   : out std_logic_vector(data_out_width-1 downto 0);
    saturation : out std_logic);

end component;

component CW_iir_sc_vsum  

  generic (
    data_in_width       : integer range 2 to (2**30) := 8;
    data_out_width      : integer range 2 to (2**30) := 16;
    frac_data_out_width : integer range 0 to (2**30) := 4;
    feedback_width      : integer range 2 to (2**30) := 12;
    max_coef_width      : integer range 2 to 31      := 8;
    frac_coef_width     : integer range 0 to (2**30) := 4;
    saturation_mode     : integer range 0 to 1 := 0;
    out_reg             : integer range 0 to 1 := 1;
    A1_coef             : integer range -(2**30) to (2**30) := 0;
    A2_coef             : integer range -(2**30) to (2**30) := 0;
    B0_coef             : integer range -(2**30) to (2**30) := 0;
    B1_coef             : integer range -(2**30) to (2**30) := 0;
    B2_coef             : integer range -(2**30) to (2**30) := 0);

  port (
    clk        : in  std_logic;
    rst_n      : in  std_logic;
    init_n     : in  std_logic;
    enable     : in  std_logic;
    data_in    : in  std_logic_vector(data_in_width-1 downto 0);
    data_out   : out std_logic_vector(data_out_width-1 downto 0);
    saturation : out std_logic);

end component;

component CW_mult_dx
  generic (
    width    : integer range 4 to (2**30) := 8;
    p1_width : integer range 2 to (2**30)-2 := 4 );
  port (
    a        : in  std_logic_vector(width-1 downto 0);
    b        : in  std_logic_vector(width-1 downto 0);
    tc       : in  std_logic;
    dplx     : in  std_logic;
    product  : out std_logic_vector(2*width-1 downto 0));
end component;

component CW_div_seq 

  generic (
    a_width     : integer range 3 to 2**30 :=3;
    b_width     : integer range 3 to 2**30 :=3;
    tc_mode     : integer range 0 to 1     :=0;
    num_cyc     : integer range 3 to 2**30 :=3;
    rst_mode    : integer range 0 to 1     :=0;
    input_mode  : integer range 0 to 1     :=1;
    output_mode : integer range 0 to 1     :=1;
    early_start : integer range 0 to 1     :=0);

     port (
       clk        : in std_logic;
       rst_n      : in std_logic;
       hold       : in std_logic;
       start      : in std_logic;
       a          : in std_logic_vector(a_width -1 downto 0);
       b          : in std_logic_vector(b_width -1 downto 0);
       complete   : out std_logic;
       divide_by_0 : out std_logic;
       quotient   : out std_logic_vector(a_width -1 downto 0);
       remainder  : out std_logic_vector(b_width -1 downto 0));

end component;

component CW_mult_pipe
    generic (
        a_width    : integer := 2;
        b_width    : integer := 2;
        num_stages : integer := 2;
        stall_mode : integer := 1;
        rst_mode   : integer := 1;
        op_iso_mode   : integer := 0);

    port (
         clk     : in std_logic;
         rst_n   : in std_logic;
         a       : in std_logic_vector(a_width - 1 downto 0);
         b       : in std_logic_vector(b_width - 1 downto 0);
         tc      : in std_logic;
         en      : in std_logic;
         product : out std_logic_vector((a_width + b_width) - 1 downto 0));

end component;

component CW_sqrt_pipe
    generic (
        width      : integer := 2;
        tc_mode    : integer := 0;
        num_stages : integer := 2;
        stall_mode : integer := 1;
        rst_mode   : integer := 1;
        op_iso_mode : integer:= 0);

    port (
         clk     : in std_logic;
         rst_n   : in std_logic;
         en      : in std_logic;
         a       : in std_logic_vector(width - 1 downto 0);
         root    : out std_logic_vector(((width+1)/2)-1 downto 0));

end component;

component CW_div_pipe 
    generic (
        a_width    : integer := 2;
        b_width    : integer := 2;
        tc_mode    : integer := 0;
        rem_mode   : integer := 1;
        num_stages : integer := 2;
        stall_mode : integer := 1;
        rst_mode   : integer := 1;
        op_iso_mode   : integer := 0;
        arch   : integer := 1);

    port (
         clk         : in std_logic;
         rst_n       : in std_logic;
         en          : in std_logic;
         a           : in std_logic_vector(a_width - 1 downto 0);
         b           : in std_logic_vector(b_width - 1 downto 0);
         quotient    : out std_logic_vector(a_width - 1 downto 0);
         remainder   : out std_logic_vector(b_width - 1 downto 0);
         divide_by_0 : out std_logic);
end component;

component CW_lod
   generic (
     a_width  : positive := 8);

   port (
     a   : in  std_logic_vector(a_width-1 downto 0);      
     enc : out std_logic_vector(bit_width(a_width) downto 0);  
     dec : out std_logic_vector(a_width-1 downto 0)           
        );
end component;

component CW_lzd
   generic (
     a_width  : positive := 8);  

   port (
     a   : in  std_logic_vector(a_width-1 downto 0);     
     enc : out std_logic_vector(bit_width(a_width) downto 0); 
     dec : out std_logic_vector(a_width-1 downto 0)           
        );
end component;

component CW_lsd
  generic (
     a_width  : positive := 8);   

   port (
     a   : in  std_logic_vector(a_width-1 downto 0);     
     enc : out std_logic_vector(bit_width(a_width)-1 downto 0);  
     dec : out std_logic_vector(a_width-1 downto 0));            

end component;

component CW_debugger
   generic (
     rd_bits_width : integer range 8 to 2048 := 8;
     wr_bits_width : integer range 8 to 2048 := 8;
     clk_freq      : positive := 1;
     baud_rate     : integer range 300 to 19200 := 19200;
     mark_parity   : integer range 0 to 1 := 1);
   port (
     clk             : in std_logic;
     reset_N         : in std_logic;
     rd_bits         : in std_logic_vector(rd_bits_width-1 downto 0);
     rxd             : in std_logic;
     wr_bits         : out std_logic_vector(wr_bits_width-1 downto 0);
     txd             : out std_logic;
     div_bypass_mode : in std_logic);

end component;

component CW_mac 
    generic (
        A_width: integer := 8;
        B_width: integer := 8);
    port (
        A: in std_logic_vector(A_width - 1 downto 0);
        B: in std_logic_vector(B_width - 1 downto 0);
        C: in std_logic_vector(A_width + B_width - 1 downto 0);
        TC: in std_logic;
        MAC: out std_logic_vector(A_width + B_width - 1 downto 0));
end component;

component CW_prod_sum_pipe
    generic (
        a_width    : integer := 2;
        b_width    : integer := 2;
        num_inputs : integer := 2;
        sum_width  : integer := 4;
        num_stages : integer := 2;
        stall_mode : integer := 1;
        rst_mode   : integer := 1;
        op_iso_mode   : integer := 0);

    port (
         clk     : in std_logic;
         rst_n   : in std_logic;
         a       : in  std_logic_vector(a_width*num_inputs-1 downto 0);
         b       : in  std_logic_vector(b_width*num_inputs-1 downto 0);
         tc      : in std_logic;
         en      : in std_logic;
         sum     : out std_logic_vector(sum_width - 1 downto 0));

end component;

component CW_bsh
   generic (
     A_width: integer := 8;
     SH_width: integer := 3);
   port (
     A: in std_logic_vector(A_width - 1 downto 0);
     SH: in std_logic_vector(SH_width - 1 downto 0);
     B: out std_logic_vector(A_width - 1 downto 0));
end component;

component CW_rash
   generic (
     wA: integer := 4;
     wSH: integer := 2);
   port (
     A        : in std_logic_vector(wA - 1 downto 0);
     DATA_TC  : in std_logic;
     SH       : in std_logic_vector(wSH - 1 downto 0);
     SH_TC    : in std_logic;
     Z        : out std_logic_vector(wA - 1 downto 0));
end component;

component CW_lbsh
   generic (
     A_width: integer := 8;
     SH_width: integer := 3);
   port (
     A        : in std_logic_vector(A_width - 1 downto 0);
     SH       : in std_logic_vector(SH_width - 1 downto 0);
     SH_TC    : in std_logic;
     B        : out std_logic_vector(A_width - 1 downto 0));
end component;

component CW_rbsh
   generic (
     A_width: integer := 8;
     SH_width: integer := 3);
   port (
     A        : in std_logic_vector(A_width - 1 downto 0);
     SH       : in std_logic_vector(SH_width - 1 downto 0);
     SH_TC    : in std_logic;
     B        : out std_logic_vector(A_width - 1 downto 0));
end component;

component CW_pricod
   generic (
     a_width: integer := 8);
   port (
     a        : in std_logic_vector(a_width - 1 downto 0);
     cod      : out std_logic_vector(a_width - 1 downto 0);
     zero     : out std_logic);
end component;

component CW_sync
    generic(
	width: integer:=8;
        f_sync_type: integer:=2;
        tst_mode: integer :=0;
        verif_en: integer :=0);
    port (
        data_s   : in std_logic_vector(width-1 downto 0);
        clk_d    : in std_logic;
        rst_d_n  : in std_logic;
        init_d_n : in std_logic;
        test     : in std_logic;
        data_d   : out std_logic_vector(width-1 downto 0));
end component;

component CW_decode_en
    generic (
        width: integer := 3);
    port (
        en : in std_logic;
        a: in std_logic_vector(width - 1 downto 0);
        b: out std_logic_vector(2 ** width - 1 downto 0));
end component;

component CW_gray_sync
    generic (
     width : INTEGER := 8;
     offset : INTEGER := 0;
     reg_count_d : INTEGER := 1;
     f_sync_type : INTEGER := 2;
     tst_mode : INTEGER := 0;
     verif_en : INTEGER := 0;
     pipe_delay : INTEGER:= 0;
     reg_count_s : INTEGER := 1;
     reg_offset_count_s : INTEGER := 1
   );
    port (
        clk_s : in std_logic;
        rst_s_n : in std_logic;
        init_s_n : in std_logic;
        en_s : in std_logic;
        count_s : out std_logic_vector(width-1 downto 0);
        offset_count_s : out std_logic_vector(width-1 downto 0);
        clk_d : in std_logic;
        rst_d_n : in std_logic;
        init_d_n : in std_logic;
        count_d : out std_logic_vector(width-1 downto 0);
        test : in std_logic
);
end component;


component CW_data_sync_1c
    generic (
     width : INTEGER := 8;
     filt_size : INTEGER := 1;
     f_sync_type : INTEGER := 2;
     tst_mode : INTEGER := 0;
     verif_en : INTEGER := 0
   );
    port (
        data_s   : in std_logic_vector(width-1 downto 0);
        clk_d    : in std_logic;
        rst_d_n  : in std_logic;
        init_d_n : in std_logic;
        filt_d   : in std_logic_vector(filt_size-1 downto 0);
        test     : in std_logic;
        data_avail_d : out std_logic;
        data_d       : out std_logic_vector(width-1 downto 0);
        max_skew_d   : out std_logic_vector(filt_size downto 0)
);
end component;

component CW_fp_addsub
    generic ( sig_width: integer := 23;
              exp_width: integer := 8;
              ieee_compliance : integer := 1);
    port    (a,b : in std_logic_vector(sig_width+exp_width downto 0);
              rnd: in std_logic_vector(2 downto 0);
              op : in std_logic;
              status: out std_logic_vector(7 downto 0);
              z     : out std_logic_vector(sig_width+exp_width downto 0) );
end component;

component CW_fp_add
    generic (sig_width: integer := 23;
             exp_width: integer := 8;
             ieee_compliance : integer := 1;
  	     ieee_NaN_compliance : integer := 0);
    port    (a,b : in std_logic_vector(sig_width+exp_width downto 0);
              rnd: in std_logic_vector(2 downto 0);
              status: out std_logic_vector(7 downto 0);
              z     : out std_logic_vector(sig_width+exp_width downto 0) );
end component;

component CW_fp_cmp
    generic (sig_width: integer := 23;
             exp_width: integer := 8;
             ieee_compliance : integer := 1
            );
    port    (a,b : in std_logic_vector(sig_width+exp_width downto 0);
             zctr: in std_logic;
              agtb: out std_logic;
              altb: out std_logic;
              aeqb: out std_logic;
              unordered: out std_logic;
              z0,z1:   out std_logic_vector(sig_width+exp_width downto 0); 
              status0: out std_logic_vector( 7 downto 0) ; 
              status1: out std_logic_vector( 7 downto 0) );
end component;

component CW_fp_div_seq
    generic (sig_width       : integer := 23;
             exp_width       : integer := 8;
             ieee_compliance : integer := 0;
             num_cyc         : integer := 5;
             rst_mode        : integer := 0;
             input_mode      : integer := 1;
             output_mode     : integer := 1;
             early_start     : integer := 0;
             internal_reg    : integer := 1
            );
    port    ( clk   : in std_logic;
              rst_n : in std_logic;
              start : in std_logic;
              a,b   : in std_logic_vector ( sig_width+exp_width downto 0);
              rnd   : in std_logic_vector ( 2 downto 0);
              complete : out std_logic ;
              status   : out std_logic_vector ( 7 downto 0) ;
              z        : out std_logic_vector ( sig_width+exp_width downto 0) );
end component;

component CW_fp_mult
    generic (sig_width       : integer := 23;
             exp_width       : integer := 8;
             ieee_compliance : integer := 1
            );
    port    ( a,b : in std_logic_vector ( sig_width+exp_width downto 0);
              rnd : in std_logic_vector ( 2 downto 0);
              status : out std_logic_vector ( 7 downto 0) ;
              z      : out std_logic_vector ( sig_width+exp_width downto 0) );
end component;

component CW_fp_sub
    generic (sig_width       : integer := 23;
             exp_width       : integer := 8;
             ieee_compliance : integer := 1
            );
    port    (a,b : in std_logic_vector(sig_width+exp_width downto 0);
              rnd: in std_logic_vector(2 downto 0);
              status: out std_logic_vector(7 downto 0);
              z     : out std_logic_vector(sig_width+exp_width downto 0) );
end component;

component CW_sla
    generic (A_width : integer := 4;
             SH_width: integer := 2
            );
    port    ( A     : in std_logic_vector ( A_width-1 downto 0);
              SH    : in std_logic_vector ( SH_width-1 downto 0);
              SH_TC : in std_logic; 
              B : out std_logic_vector ( A_width-1 downto 0) );
end component;

component CW_sra
    generic (A_width : integer := 4;
             SH_width: integer := 2
            );
    port    ( A     : in std_logic_vector ( A_width-1 downto 0);
              SH    : in std_logic_vector ( SH_width-1 downto 0);
              SH_TC : in std_logic; 
              B : out std_logic_vector ( A_width-1 downto 0) );
end component;

component CW_lza
    generic (width : integer := 8
             );
    port    ( a     : in std_logic_vector ( width-1 downto 0);
              b     : in std_logic_vector ( width-1 downto 0);
              count : out std_logic_vector ( log2(width)-1 downto 0) );
end component;

component CW_pulse_sync
 generic (
          reg_event  : integer  := 1;
	  f_sync_type: integer  := 2;
	  tst_mode   : integer  := 0;
	  verif_en   : integer  := 0;
	  pulse_mode : integer  := 0);
   port (
            event_s  : in std_logic;
 	    clk_s    : in std_logic; 
 	    init_s_n : in std_logic;
 	    rst_s_n  : in std_logic; 
 	    clk_d    : in std_logic;
 	    init_d_n : in std_logic;
 	    rst_d_n  : in std_logic;
 	    test     : in std_logic;
 	    event_d  : out std_logic
   ); 
end component;

end COMPONENTS;


package body COMPONENTS is

  function F_GREATER (
    DATA_IN_WIDTH  : integer;
    DATA_OUT_WIDTH : integer
    ) return integer is
  begin
    if (DATA_IN_WIDTH >= DATA_OUT_WIDTH) then
      return DATA_IN_WIDTH;
    else
      return DATA_OUT_WIDTH;
    end if;
  end F_GREATER;

function F_CWARE_LOG2_X(X: integer) return Integer is
begin
  for i in 24 downto 1 loop
    if (X > 2 ** (i - 1)) then
      return i;
    end if;
  end loop;
  return 1;
end F_CWARE_LOG2_X;

function F_CWARE_LOG2_X_PLUS_1(X: integer) return Integer is
begin
  for i in 24 downto 1 loop
    if (X >= 2 ** (i - 1)) then
      return i;
    end if;
  end loop;
  return 1;
end F_CWARE_LOG2_X_PLUS_1;

function F_CWARE_MINCHKB_X(X: integer) return Integer is
begin
    if (X < 8) then
      return 2;
    elsif (X >= 8) and (X < 11) then
      return 5;
    elsif (X >= 11) and (X < 26) then
      return 6;
    elsif (X >= 26) and (X < 57) then
      return 7;
    elsif (X >= 57) and (X < 120) then
      return 8;
    elsif (X >= 120) and (X < 247) then
      return 9;
    else 
      return 10;
    end if;
end F_CWARE_MINCHKB_X;
 


-------------------------------------------------------------------------
-- bit_width returns the min number of bits required to represent a number
-- in binary
-------------------------------------------------------------------------
function bit_width ( constant num : integer)  return integer is
begin
  if num < 0  then
    return 0;
  elsif num = 1 then
    return 1;
  else
    for i in 1 to 32 loop
      if ((2**i) >= num) then
        return i;
      end if;
    end loop;
  end if;

  -- pragma translate_off
  CW_REPORT_BUG;
  -- pragma translate_on
  
end bit_width;

-------------------------------------------------------------------------
-- max returns the maximum of two integers
-------------------------------------------------------------------------
function max (constant num1,num2 : integer) return integer is
begin
  if num1 > num2 then
    return num1;
  else
    return num2;
  end if;
end max;
-------------------------------------------------------------------------
-- min returns the minimum of two integers
-------------------------------------------------------------------------
function min (constant num1,num2 : integer) return integer is
begin
  if num1 > num2 then
    return num2;
  else
    return num1;
  end if;
end min;

-------------------------------------------------------------------------
-- CW_REPORT_BUG
-------------------------------------------------------------------------
procedure CW_REPORT_BUG is
begin
  -- pragma translate_off
  assert false report "Unknown state reached, please report bug"
    severity failure;
  -- pragma translate_on
end CW_REPORT_BUG;


-------------------------------------------------------------------------
-- reduce_xor
-- returns the reduction xor of a number
-------------------------------------------------------------------------
function reduce_xor (
  constant num : std_logic_vector)
  return std_logic is
  variable reduce_xor : std_logic := '0';
begin  -- reduce_xor
  for i in num'range loop
    reduce_xor := reduce_xor xor num(i);
  end loop;  -- i
  return reduce_xor;
end reduce_xor;

-------------------------------------------------------------------------
-- reduce_or
-- returns the reduction or of a number
-------------------------------------------------------------------------
function reduce_or (
  constant num : std_logic_vector)
  return std_logic is
  variable reduce_or : std_logic := '0';
begin  -- reduce_or
  for i in num'range loop
    reduce_or := reduce_or or num(i);
  end loop;  -- i
  return reduce_or;
end reduce_or;


-------------------------------------------------------------------------
-- return the left shif value of 1 by input value
-------------------------------------------------------------------------
function shift_left_1(
   constant num:  integer;
   constant index:  integer
  )
  return std_logic_vector is 
  variable temp : std_logic_vector(31 downto 0);
begin
  temp := (others => '0');
  if(num  = 0) then
    temp(0) :='1';
  else
    temp(num) :='1';
  end if;     
  return temp(index -1 downto 0);
end shift_left_1;


function to_integer1 (
  constant num_index:std_logic_vector;
  constant index :integer
  )
return integer is
variable temp:integer:= 0;
variable temp1:integer:= 0;
begin
for i in 0 to index - 1 loop 
 if num_index(i)='1' then
   temp :=2**i;
  else
    temp :=0;
  end if; 
  temp1 :=temp1 +temp; 
end loop;
return temp1;
end to_integer1;

-------------------------------------------------------------------------
-- reduce_and
-- returns the reduction and of a number
-------------------------------------------------------------------------
function reduce_and (
  constant num : std_logic_vector)
  return std_logic is
  variable reduce_and : std_logic := '1';
begin  -- reduce_and
  for i in num'range loop
    reduce_and := reduce_and and num(i);
  end loop;  -- i
  return reduce_and;
end reduce_and;

function log2( i : NATURAL) return INTEGER is
    variable  val     : INTEGER := i;
    variable log2_val : INTEGER := 0; 
  begin					
    while val > 1 loop
      log2_val := log2_val + 1;
      val      := val / 2;     
    end loop;
  	
    return log2_val;
  end function;


end COMPONENTS;
