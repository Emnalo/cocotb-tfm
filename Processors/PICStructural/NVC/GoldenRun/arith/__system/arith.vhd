library	ieee	;
library	util	;
use	ieee.std_logic_1164.all	;
use	util.util.all	;
package	std_logic_arith	is
type	unsigned	is	array (natural range <>) of std_logic	;
type	signed	is	array (natural range <>) of std_logic	;
subtype	small_int	is	integer range 0 to 1	;
function	"+"	( l : std_logic_vector ; r : std_logic_vector )	return	std_logic_vector	;
function	"+"	( a : std_logic_vector ; b : std_logic )	return	std_logic_vector	;
function	"+"	( l : unsigned ; r : unsigned )	return	unsigned	;
function	"+"	( l : signed ; r : signed )	return	signed	;
function	"+"	( l : unsigned ; r : signed )	return	signed	;
function	"+"	( l : signed ; r : unsigned )	return	signed	;
function	"+"	( l : unsigned ; r : integer )	return	unsigned	;
function	"+"	( l : integer ; r : unsigned )	return	unsigned	;
function	"+"	( l : signed ; r : integer )	return	signed	;
function	"+"	( l : integer ; r : signed )	return	signed	;
function	"+"	( l : unsigned ; r : std_ulogic )	return	unsigned	;
function	"+"	( l : std_ulogic ; r : unsigned )	return	unsigned	;
function	"+"	( l : signed ; r : std_ulogic )	return	signed	;
function	"+"	( l : std_ulogic ; r : signed )	return	signed	;
function	"+"	( l : unsigned ; r : unsigned )	return	std_logic_vector	;
function	"+"	( l : signed ; r : signed )	return	std_logic_vector	;
function	"+"	( l : unsigned ; r : signed )	return	std_logic_vector	;
function	"+"	( l : signed ; r : unsigned )	return	std_logic_vector	;
function	"+"	( l : unsigned ; r : integer )	return	std_logic_vector	;
function	"+"	( l : integer ; r : unsigned )	return	std_logic_vector	;
function	"+"	( l : signed ; r : integer )	return	std_logic_vector	;
function	"+"	( l : integer ; r : signed )	return	std_logic_vector	;
function	"+"	( l : unsigned ; r : std_ulogic )	return	std_logic_vector	;
function	"+"	( l : std_ulogic ; r : unsigned )	return	std_logic_vector	;
function	"+"	( l : signed ; r : std_ulogic )	return	std_logic_vector	;
function	"+"	( l : std_ulogic ; r : signed )	return	std_logic_vector	;
function	"-"	( l : unsigned ; r : unsigned )	return	unsigned	;
function	"-"	( l : signed ; r : signed )	return	signed	;
function	"-"	( l : unsigned ; r : signed )	return	signed	;
function	"-"	( l : signed ; r : unsigned )	return	signed	;
function	"-"	( l : unsigned ; r : integer )	return	unsigned	;
function	"-"	( l : integer ; r : unsigned )	return	unsigned	;
function	"-"	( l : signed ; r : integer )	return	signed	;
function	"-"	( l : integer ; r : signed )	return	signed	;
function	"-"	( l : unsigned ; r : std_ulogic )	return	unsigned	;
function	"-"	( l : std_ulogic ; r : unsigned )	return	unsigned	;
function	"-"	( l : signed ; r : std_ulogic )	return	signed	;
function	"-"	( l : std_ulogic ; r : signed )	return	signed	;
function	"-"	( l : unsigned ; r : unsigned )	return	std_logic_vector	;
function	"-"	( l : signed ; r : signed )	return	std_logic_vector	;
function	"-"	( l : unsigned ; r : signed )	return	std_logic_vector	;
function	"-"	( l : signed ; r : unsigned )	return	std_logic_vector	;
function	"-"	( l : unsigned ; r : integer )	return	std_logic_vector	;
function	"-"	( l : integer ; r : unsigned )	return	std_logic_vector	;
function	"-"	( l : signed ; r : integer )	return	std_logic_vector	;
function	"-"	( l : integer ; r : signed )	return	std_logic_vector	;
function	"-"	( l : unsigned ; r : std_ulogic )	return	std_logic_vector	;
function	"-"	( l : std_ulogic ; r : unsigned )	return	std_logic_vector	;
function	"-"	( l : signed ; r : std_ulogic )	return	std_logic_vector	;
function	"-"	( l : std_ulogic ; r : signed )	return	std_logic_vector	;
function	"+"	( l : unsigned )	return	unsigned	;
function	"+"	( l : signed )	return	signed	;
function	"-"	( l : signed )	return	signed	;
function	"ABS"	( l : signed )	return	signed	;
function	"+"	( l : unsigned )	return	std_logic_vector	;
function	"+"	( l : signed )	return	std_logic_vector	;
function	"-"	( l : signed )	return	std_logic_vector	;
function	"ABS"	( l : signed )	return	std_logic_vector	;
function	"*"	( l : unsigned ; r : unsigned )	return	unsigned	;
function	"*"	( l : signed ; r : signed )	return	signed	;
function	"*"	( l : signed ; r : unsigned )	return	signed	;
function	"*"	( l : unsigned ; r : signed )	return	signed	;
function	"*"	( l : unsigned ; r : unsigned )	return	std_logic_vector	;
function	"*"	( l : signed ; r : signed )	return	std_logic_vector	;
function	"*"	( l : signed ; r : unsigned )	return	std_logic_vector	;
function	"*"	( l : unsigned ; r : signed )	return	std_logic_vector	;
function	"<"	( l : unsigned ; r : unsigned )	return	boolean	;
function	"<"	( l : signed ; r : signed )	return	boolean	;
function	"<"	( l : unsigned ; r : signed )	return	boolean	;
function	"<"	( l : signed ; r : unsigned )	return	boolean	;
function	"<"	( l : unsigned ; r : integer )	return	boolean	;
function	"<"	( l : integer ; r : unsigned )	return	boolean	;
function	"<"	( l : signed ; r : integer )	return	boolean	;
function	"<"	( l : integer ; r : signed )	return	boolean	;
function	"<="	( l : unsigned ; r : unsigned )	return	boolean	;
function	"<="	( l : signed ; r : signed )	return	boolean	;
function	"<="	( l : unsigned ; r : signed )	return	boolean	;
function	"<="	( l : signed ; r : unsigned )	return	boolean	;
function	"<="	( l : unsigned ; r : integer )	return	boolean	;
function	"<="	( l : integer ; r : unsigned )	return	boolean	;
function	"<="	( l : signed ; r : integer )	return	boolean	;
function	"<="	( l : integer ; r : signed )	return	boolean	;
function	">"	( l : unsigned ; r : unsigned )	return	boolean	;
function	">"	( l : signed ; r : signed )	return	boolean	;
function	">"	( l : unsigned ; r : signed )	return	boolean	;
function	">"	( l : signed ; r : unsigned )	return	boolean	;
function	">"	( l : unsigned ; r : integer )	return	boolean	;
function	">"	( l : integer ; r : unsigned )	return	boolean	;
function	">"	( l : signed ; r : integer )	return	boolean	;
function	">"	( l : integer ; r : signed )	return	boolean	;
function	">="	( l : unsigned ; r : unsigned )	return	boolean	;
function	">="	( l : signed ; r : signed )	return	boolean	;
function	">="	( l : unsigned ; r : signed )	return	boolean	;
function	">="	( l : signed ; r : unsigned )	return	boolean	;
function	">="	( l : unsigned ; r : integer )	return	boolean	;
function	">="	( l : integer ; r : unsigned )	return	boolean	;
function	">="	( l : signed ; r : integer )	return	boolean	;
function	">="	( l : integer ; r : signed )	return	boolean	;
function	"="	( l : unsigned ; r : unsigned )	return	boolean	;
function	"="	( l : signed ; r : signed )	return	boolean	;
function	"="	( l : unsigned ; r : signed )	return	boolean	;
function	"="	( l : signed ; r : unsigned )	return	boolean	;
function	"="	( l : unsigned ; r : integer )	return	boolean	;
function	"="	( l : integer ; r : unsigned )	return	boolean	;
function	"="	( l : signed ; r : integer )	return	boolean	;
function	"="	( l : integer ; r : signed )	return	boolean	;
function	"/="	( l : unsigned ; r : unsigned )	return	boolean	;
function	"/="	( l : signed ; r : signed )	return	boolean	;
function	"/="	( l : unsigned ; r : signed )	return	boolean	;
function	"/="	( l : signed ; r : unsigned )	return	boolean	;
function	"/="	( l : unsigned ; r : integer )	return	boolean	;
function	"/="	( l : integer ; r : unsigned )	return	boolean	;
function	"/="	( l : signed ; r : integer )	return	boolean	;
function	"/="	( l : integer ; r : signed )	return	boolean	;
function	shl	( arg : unsigned ; count : unsigned )	return	unsigned	;
function	shl	( arg : signed ; count : unsigned )	return	signed	;
function	shr	( arg : unsigned ; count : unsigned )	return	unsigned	;
function	shr	( arg : signed ; count : unsigned )	return	signed	;
function	conv_integer	( arg : integer )	return	integer	;
function	conv_integer	( arg : unsigned )	return	integer	;
function	conv_integer	( arg : signed )	return	integer	;
function	conv_integer	( arg : std_ulogic )	return	small_int	;
function	conv_unsigned	( arg : integer ; size : integer )	return	unsigned	;
function	conv_unsigned	( arg : unsigned ; size : integer )	return	unsigned	;
function	conv_unsigned	( arg : signed ; size : integer )	return	unsigned	;
function	conv_unsigned	( arg : std_ulogic ; size : integer )	return	unsigned	;
function	conv_signed	( arg : integer ; size : integer )	return	signed	;
function	conv_signed	( arg : unsigned ; size : integer )	return	signed	;
function	conv_signed	( arg : signed ; size : integer )	return	signed	;
function	conv_signed	( arg : std_ulogic ; size : integer )	return	signed	;
function	conv_std_logic_vector	( arg : integer ; size : integer )	return	std_logic_vector	;
function	conv_std_logic_vector	( arg : unsigned ; size : integer )	return	std_logic_vector	;
function	conv_std_logic_vector	( arg : signed ; size : integer )	return	std_logic_vector	;
function	conv_std_logic_vector	( arg : std_ulogic ; size : integer )	return	std_logic_vector	;
function	ext	( arg : std_logic_vector ; size : integer )	return	std_logic_vector	;
function	sxt	( arg : std_logic_vector ; size : integer )	return	std_logic_vector	;
end	std_logic_arith	;
library	ieee	;
use	ieee.std_logic_1164.all	;
package	body	std_logic_arith	is
function	"+"	( l : std_logic_vector ; r : std_logic_vector )	return	std_logic_vector	is
variable	valor_l	:	integer	:=	pasar_a_integer(l)	;
variable	valor_r	:	integer	:=	pasar_a_integer(r)	;
begin
return	(conv_std_logic_vector(valor_r+valor_l,l'length))	;
end	;
function	"+"	( a : std_logic_vector ; b : std_logic )	return	std_logic_vector	is
variable	valor_a	:	integer	:=	pasar_a_integer(a)	;
variable	valor_b	:	integer	:=	conv_integer(b)	;
begin
return	(conv_std_logic_vector(valor_a+valor_b,a'length))	;
end	;
function	max	( l : integer ; r : integer )	return	integer	is
begin
if	l>r	then
return	l	;
else
return	r	;
end	if	;
end	;
function	min	( l : integer ; r : integer )	return	integer	is
begin
if	l<r	then
return	l	;
else
return	r	;
end	if	;
end	;
type	tbl_type	is	array (std_ulogic) of std_ulogic	;
constant	tbl_binary	:	tbl_type	:=	('X','X','0','1','X','X','0','1','X')	;
type	tbl_mvl9_boolean	is	array (std_ulogic) of boolean	;
constant	is_x	:	tbl_mvl9_boolean	:=	(true,true,false,false,true,true,false,false,true)	;
function	make_binary	( a : std_ulogic )	return	std_ulogic	is
begin
if	(is_x(a))	then
assert	false	report "There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es)."	severity warning	;
return	('X')	;
end	if	;
return	tbl_binary(a)	;
end	;
function	make_binary	( a : unsigned )	return	unsigned	is
variable	one_bit	:	std_ulogic	;
variable	result	:	unsigned (a'range)	;
begin
for	i	in	a'range	loop
if	(is_x(a(i)))	then
assert	false	report "There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es)."	severity warning	;
result	:=	(others=>'X')	;
return	result	;
end	if	;
result(i)	:=	tbl_binary(a(i))	;
end	loop	;
return	result	;
end	;
function	make_binary	( a : unsigned )	return	signed	is
variable	one_bit	:	std_ulogic	;
variable	result	:	signed (a'range)	;
begin
for	i	in	a'range	loop
if	(is_x(a(i)))	then
assert	false	report "There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es)."	severity warning	;
result	:=	(others=>'X')	;
return	result	;
end	if	;
result(i)	:=	tbl_binary(a(i))	;
end	loop	;
return	result	;
end	;
function	make_binary	( a : signed )	return	unsigned	is
variable	one_bit	:	std_ulogic	;
variable	result	:	unsigned (a'range)	;
begin
for	i	in	a'range	loop
if	(is_x(a(i)))	then
assert	false	report "There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es)."	severity warning	;
result	:=	(others=>'X')	;
return	result	;
end	if	;
result(i)	:=	tbl_binary(a(i))	;
end	loop	;
return	result	;
end	;
function	make_binary	( a : signed )	return	signed	is
variable	one_bit	:	std_ulogic	;
variable	result	:	signed (a'range)	;
begin
for	i	in	a'range	loop
if	(is_x(a(i)))	then
assert	false	report "There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es)."	severity warning	;
result	:=	(others=>'X')	;
return	result	;
end	if	;
result(i)	:=	tbl_binary(a(i))	;
end	loop	;
return	result	;
end	;
function	make_binary	( a : std_logic_vector )	return	std_logic_vector	is
variable	one_bit	:	std_ulogic	;
variable	result	:	std_logic_vector (a'range)	;
begin
for	i	in	a'range	loop
if	(is_x(a(i)))	then
assert	false	report "There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es)."	severity warning	;
result	:=	(others=>'X')	;
return	result	;
end	if	;
result(i)	:=	tbl_binary(a(i))	;
end	loop	;
return	result	;
end	;
function	make_binary	( a : unsigned )	return	std_logic_vector	is
variable	one_bit	:	std_ulogic	;
variable	result	:	std_logic_vector (a'range)	;
begin
for	i	in	a'range	loop
if	(is_x(a(i)))	then
assert	false	report "There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es)."	severity warning	;
result	:=	(others=>'X')	;
return	result	;
end	if	;
result(i)	:=	tbl_binary(a(i))	;
end	loop	;
return	result	;
end	;
function	make_binary	( a : signed )	return	std_logic_vector	is
variable	one_bit	:	std_ulogic	;
variable	result	:	std_logic_vector (a'range)	;
begin
for	i	in	a'range	loop
if	(is_x(a(i)))	then
assert	false	report "There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, the result will be 'X'(es)."	severity warning	;
result	:=	(others=>'X')	;
return	result	;
end	if	;
result(i)	:=	tbl_binary(a(i))	;
end	loop	;
return	result	;
end	;
function	left_signed_arg	( a : signed ; b : signed )	return	signed	is
variable	z	:	signed (a'left downto 0)	;
begin
return	(z)	;
end	;
function	left_unsigned_arg	( a : unsigned ; b : unsigned )	return	unsigned	is
variable	z	:	unsigned (a'left downto 0)	;
begin
return	(z)	;
end	;
function	mult_signed_arg	( a : signed ; b : signed )	return	signed	is
variable	z	:	signed ((a'length+b'length-1) downto 0)	;
begin
return	(z)	;
end	;
function	mult_unsigned_arg	( a : unsigned ; b : unsigned )	return	unsigned	is
variable	z	:	unsigned ((a'length+b'length-1) downto 0)	;
begin
return	(z)	;
end	;
function	mult	( a : signed ; b : signed )	return	signed	is
variable	ba	:	signed ((a'length+b'length-1) downto 0)	;
variable	pa	:	signed ((a'length+b'length-1) downto 0)	;
variable	aa	:	signed (a'length downto 0)	;
variable	neg	:	std_ulogic	;
constant	one	:	unsigned (1 downto 0)	:=	"01"	;
begin
if	(a(a'left)='X' or b(b'left)='X')	then
pa	:=	(others=>'X')	;
return	(pa)	;
end	if	;
pa	:=	(others=>'0')	;
neg	:=	b(b'left) xor a(a'left)	;
ba	:=	conv_signed(('0'&abs (b)),(a'length+b'length))	;
aa	:=	'0'&abs (a)	;
for	i	in	0 to a'length-1	loop
if	aa(i)='1'	then
pa	:=	pa+ba	;
end	if	;
ba	:=	shl(ba,one)	;
end	loop	;
if	(neg='1')	then
return	(-pa)	;
else
return	(pa)	;
end	if	;
end	;
function	mult	( a : unsigned ; b : unsigned )	return	unsigned	is
variable	ba	:	unsigned ((a'length+b'length-1) downto 0)	;
variable	pa	:	unsigned ((a'length+b'length-1) downto 0)	;
constant	one	:	unsigned (1 downto 0)	:=	"01"	;
begin
if	(a(a'left)='X' or b(b'left)='X')	then
pa	:=	(others=>'X')	;
return	(pa)	;
end	if	;
pa	:=	(others=>'0')	;
ba	:=	conv_unsigned(b,(a'length+b'length))	;
for	i	in	0 to a'length-1	loop
if	a(i)='1'	then
pa	:=	pa+ba	;
end	if	;
ba	:=	shl(ba,one)	;
end	loop	;
return	(pa)	;
end	;
function	minus	( a : signed ; b : signed )	return	signed	is
variable	carry	:	std_ulogic	;
variable	bv	:	std_ulogic_vector (a'left downto 0)	;
variable	sum	:	signed (a'left downto 0)	;
begin
if	(a(a'left)='X' or b(b'left)='X')	then
sum	:=	(others=>'X')	;
return	(sum)	;
end	if	;
carry	:=	'1'	;
bv	:=	not std_ulogic_vector(b)	;
for	i	in	0 to a'left	loop
sum(i)	:=	a(i) xor bv(i) xor carry	;
carry	:=	(a(i) and bv(i)) or (a(i) and carry) or (carry and bv(i))	;
end	loop	;
return	sum	;
end	;
function	plus	( a : signed ; b : signed )	return	signed	is
variable	carry	:	std_ulogic	;
variable	bv	:	signed (a'left downto 0)	;
variable	sum	:	signed (a'left downto 0)	;
begin
if	(a(a'left)='X' or b(b'left)='X')	then
sum	:=	(others=>'X')	;
return	(sum)	;
end	if	;
carry	:=	'0'	;
bv	:=	b	;
for	i	in	0 to a'left	loop
sum(i)	:=	a(i) xor bv(i) xor carry	;
carry	:=	(a(i) and bv(i)) or (a(i) and carry) or (carry and bv(i))	;
end	loop	;
return	sum	;
end	;
function	unsigned_minus	( a : unsigned ; b : unsigned )	return	unsigned	is
variable	carry	:	std_ulogic	;
variable	bv	:	std_ulogic_vector (a'left downto 0)	;
variable	sum	:	unsigned (a'left downto 0)	;
begin
if	(a(a'left)='X' or b(b'left)='X')	then
sum	:=	(others=>'X')	;
return	(sum)	;
end	if	;
carry	:=	'1'	;
bv	:=	not std_ulogic_vector(b)	;
for	i	in	0 to a'left	loop
sum(i)	:=	a(i) xor bv(i) xor carry	;
carry	:=	(a(i) and bv(i)) or (a(i) and carry) or (carry and bv(i))	;
end	loop	;
return	sum	;
end	;
function	unsigned_plus	( a : unsigned ; b : unsigned )	return	unsigned	is
variable	carry	:	std_ulogic	;
variable	bv	:	unsigned (a'left downto 0)	;
variable	sum	:	unsigned (a'left downto 0)	;
begin
if	(a(a'left)='X' or b(b'left)='X')	then
sum	:=	(others=>'X')	;
return	(sum)	;
end	if	;
carry	:=	'0'	;
bv	:=	b	;
for	i	in	0 to a'left	loop
sum(i)	:=	a(i) xor bv(i) xor carry	;
carry	:=	(a(i) and bv(i)) or (a(i) and carry) or (carry and bv(i))	;
end	loop	;
return	sum	;
end	;
function	"*"	( l : signed ; r : signed )	return	signed	is
begin
return	mult(conv_signed(l,l'length),conv_signed(r,r'length))	;
end	;
function	"*"	( l : unsigned ; r : unsigned )	return	unsigned	is
begin
return	mult(conv_unsigned(l,l'length),conv_unsigned(r,r'length))	;
end	;
function	"*"	( l : unsigned ; r : signed )	return	signed	is
begin
return	mult(conv_signed(l,l'length+1),conv_signed(r,r'length))	;
end	;
function	"*"	( l : signed ; r : unsigned )	return	signed	is
begin
return	mult(conv_signed(l,l'length),conv_signed(r,r'length+1))	;
end	;
function	"*"	( l : signed ; r : signed )	return	std_logic_vector	is
begin
return	std_logic_vector(mult(conv_signed(l,l'length),conv_signed(r,r'length)))	;
end	;
function	"*"	( l : unsigned ; r : unsigned )	return	std_logic_vector	is
begin
return	std_logic_vector(mult(conv_unsigned(l,l'length),conv_unsigned(r,r'length)))	;
end	;
function	"*"	( l : unsigned ; r : signed )	return	std_logic_vector	is
begin
return	std_logic_vector(mult(conv_signed(l,l'length+1),conv_signed(r,r'length)))	;
end	;
function	"*"	( l : signed ; r : unsigned )	return	std_logic_vector	is
begin
return	std_logic_vector(mult(conv_signed(l,l'length),conv_signed(r,r'length+1)))	;
end	;
function	"+"	( l : unsigned ; r : unsigned )	return	unsigned	is
constant	length	:	integer	:=	max(l'length,r'length)	;
begin
return	unsigned_plus(conv_unsigned(l,length),conv_unsigned(r,length))	;
end	;
function	"+"	( l : signed ; r : signed )	return	signed	is
constant	length	:	integer	:=	max(l'length,r'length)	;
begin
return	plus(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"+"	( l : unsigned ; r : signed )	return	signed	is
constant	length	:	integer	:=	max(l'length+1,r'length)	;
begin
return	plus(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"+"	( l : signed ; r : unsigned )	return	signed	is
constant	length	:	integer	:=	max(l'length,r'length+1)	;
begin
return	plus(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"+"	( l : unsigned ; r : integer )	return	unsigned	is
constant	length	:	integer	:=	l'length+1	;
begin
return	conv_unsigned(plus(conv_signed(l,length),conv_signed(r,length)),length-1)	;
end	;
function	"+"	( l : integer ; r : unsigned )	return	unsigned	is
constant	length	:	integer	:=	r'length+1	;
begin
return	conv_unsigned(plus(conv_signed(l,length),conv_signed(r,length)),length-1)	;
end	;
function	"+"	( l : signed ; r : integer )	return	signed	is
constant	length	:	integer	:=	l'length	;
begin
return	plus(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"+"	( l : integer ; r : signed )	return	signed	is
constant	length	:	integer	:=	r'length	;
begin
return	plus(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"+"	( l : unsigned ; r : std_ulogic )	return	unsigned	is
constant	length	:	integer	:=	l'length	;
begin
return	unsigned_plus(conv_unsigned(l,length),conv_unsigned(r,length))	;
end	;
function	"+"	( l : std_ulogic ; r : unsigned )	return	unsigned	is
constant	length	:	integer	:=	r'length	;
begin
return	unsigned_plus(conv_unsigned(l,length),conv_unsigned(r,length))	;
end	;
function	"+"	( l : signed ; r : std_ulogic )	return	signed	is
constant	length	:	integer	:=	l'length	;
begin
return	plus(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"+"	( l : std_ulogic ; r : signed )	return	signed	is
constant	length	:	integer	:=	r'length	;
begin
return	plus(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"+"	( l : unsigned ; r : unsigned )	return	std_logic_vector	is
constant	length	:	integer	:=	max(l'length,r'length)	;
begin
return	std_logic_vector(unsigned_plus(conv_unsigned(l,length),conv_unsigned(r,length)))	;
end	;
function	"+"	( l : signed ; r : signed )	return	std_logic_vector	is
constant	length	:	integer	:=	max(l'length,r'length)	;
begin
return	std_logic_vector(plus(conv_signed(l,length),conv_signed(r,length)))	;
end	;
function	"+"	( l : unsigned ; r : signed )	return	std_logic_vector	is
constant	length	:	integer	:=	max(l'length+1,r'length)	;
begin
return	std_logic_vector(plus(conv_signed(l,length),conv_signed(r,length)))	;
end	;
function	"+"	( l : signed ; r : unsigned )	return	std_logic_vector	is
constant	length	:	integer	:=	max(l'length,r'length+1)	;
begin
return	std_logic_vector(plus(conv_signed(l,length),conv_signed(r,length)))	;
end	;
function	"+"	( l : unsigned ; r : integer )	return	std_logic_vector	is
constant	length	:	integer	:=	l'length+1	;
begin
return	std_logic_vector(conv_unsigned(plus(conv_signed(l,length),conv_signed(r,length)),length-1))	;
end	;
function	"+"	( l : integer ; r : unsigned )	return	std_logic_vector	is
constant	length	:	integer	:=	r'length+1	;
begin
return	std_logic_vector(conv_unsigned(plus(conv_signed(l,length),conv_signed(r,length)),length-1))	;
end	;
function	"+"	( l : signed ; r : integer )	return	std_logic_vector	is
constant	length	:	integer	:=	l'length	;
begin
return	std_logic_vector(plus(conv_signed(l,length),conv_signed(r,length)))	;
end	;
function	"+"	( l : integer ; r : signed )	return	std_logic_vector	is
constant	length	:	integer	:=	r'length	;
begin
return	std_logic_vector(plus(conv_signed(l,length),conv_signed(r,length)))	;
end	;
function	"+"	( l : unsigned ; r : std_ulogic )	return	std_logic_vector	is
constant	length	:	integer	:=	l'length	;
begin
return	std_logic_vector(unsigned_plus(conv_unsigned(l,length),conv_unsigned(r,length)))	;
end	;
function	"+"	( l : std_ulogic ; r : unsigned )	return	std_logic_vector	is
constant	length	:	integer	:=	r'length	;
begin
return	std_logic_vector(unsigned_plus(conv_unsigned(l,length),conv_unsigned(r,length)))	;
end	;
function	"+"	( l : signed ; r : std_ulogic )	return	std_logic_vector	is
constant	length	:	integer	:=	l'length	;
begin
return	std_logic_vector(plus(conv_signed(l,length),conv_signed(r,length)))	;
end	;
function	"+"	( l : std_ulogic ; r : signed )	return	std_logic_vector	is
constant	length	:	integer	:=	r'length	;
begin
return	std_logic_vector(plus(conv_signed(l,length),conv_signed(r,length)))	;
end	;
function	"-"	( l : unsigned ; r : unsigned )	return	unsigned	is
constant	length	:	integer	:=	max(l'length,r'length)	;
begin
return	unsigned_minus(conv_unsigned(l,length),conv_unsigned(r,length))	;
end	;
function	"-"	( l : signed ; r : signed )	return	signed	is
constant	length	:	integer	:=	max(l'length,r'length)	;
begin
return	minus(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"-"	( l : unsigned ; r : signed )	return	signed	is
constant	length	:	integer	:=	max(l'length+1,r'length)	;
begin
return	minus(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"-"	( l : signed ; r : unsigned )	return	signed	is
constant	length	:	integer	:=	max(l'length,r'length+1)	;
begin
return	minus(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"-"	( l : unsigned ; r : integer )	return	unsigned	is
constant	length	:	integer	:=	l'length+1	;
begin
return	conv_unsigned(minus(conv_signed(l,length),conv_signed(r,length)),length-1)	;
end	;
function	"-"	( l : integer ; r : unsigned )	return	unsigned	is
constant	length	:	integer	:=	r'length+1	;
begin
return	conv_unsigned(minus(conv_signed(l,length),conv_signed(r,length)),length-1)	;
end	;
function	"-"	( l : signed ; r : integer )	return	signed	is
constant	length	:	integer	:=	l'length	;
begin
return	minus(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"-"	( l : integer ; r : signed )	return	signed	is
constant	length	:	integer	:=	r'length	;
begin
return	minus(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"-"	( l : unsigned ; r : std_ulogic )	return	unsigned	is
constant	length	:	integer	:=	l'length+1	;
begin
return	conv_unsigned(minus(conv_signed(l,length),conv_signed(r,length)),length-1)	;
end	;
function	"-"	( l : std_ulogic ; r : unsigned )	return	unsigned	is
constant	length	:	integer	:=	r'length+1	;
begin
return	conv_unsigned(minus(conv_signed(l,length),conv_signed(r,length)),length-1)	;
end	;
function	"-"	( l : signed ; r : std_ulogic )	return	signed	is
constant	length	:	integer	:=	l'length	;
begin
return	minus(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"-"	( l : std_ulogic ; r : signed )	return	signed	is
constant	length	:	integer	:=	r'length	;
begin
return	minus(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"-"	( l : unsigned ; r : unsigned )	return	std_logic_vector	is
constant	length	:	integer	:=	max(l'length,r'length)	;
begin
return	std_logic_vector(unsigned_minus(conv_unsigned(l,length),conv_unsigned(r,length)))	;
end	;
function	"-"	( l : signed ; r : signed )	return	std_logic_vector	is
constant	length	:	integer	:=	max(l'length,r'length)	;
begin
return	std_logic_vector(minus(conv_signed(l,length),conv_signed(r,length)))	;
end	;
function	"-"	( l : unsigned ; r : signed )	return	std_logic_vector	is
constant	length	:	integer	:=	max(l'length+1,r'length)	;
begin
return	std_logic_vector(minus(conv_signed(l,length),conv_signed(r,length)))	;
end	;
function	"-"	( l : signed ; r : unsigned )	return	std_logic_vector	is
constant	length	:	integer	:=	max(l'length,r'length+1)	;
begin
return	std_logic_vector(minus(conv_signed(l,length),conv_signed(r,length)))	;
end	;
function	"-"	( l : unsigned ; r : integer )	return	std_logic_vector	is
constant	length	:	integer	:=	l'length+1	;
begin
return	std_logic_vector(conv_unsigned(minus(conv_signed(l,length),conv_signed(r,length)),length-1))	;
end	;
function	"-"	( l : integer ; r : unsigned )	return	std_logic_vector	is
constant	length	:	integer	:=	r'length+1	;
begin
return	std_logic_vector(conv_unsigned(minus(conv_signed(l,length),conv_signed(r,length)),length-1))	;
end	;
function	"-"	( l : signed ; r : integer )	return	std_logic_vector	is
constant	length	:	integer	:=	l'length	;
begin
return	std_logic_vector(minus(conv_signed(l,length),conv_signed(r,length)))	;
end	;
function	"-"	( l : integer ; r : signed )	return	std_logic_vector	is
constant	length	:	integer	:=	r'length	;
begin
return	std_logic_vector(minus(conv_signed(l,length),conv_signed(r,length)))	;
end	;
function	"-"	( l : unsigned ; r : std_ulogic )	return	std_logic_vector	is
constant	length	:	integer	:=	l'length+1	;
begin
return	std_logic_vector(conv_unsigned(minus(conv_signed(l,length),conv_signed(r,length)),length-1))	;
end	;
function	"-"	( l : std_ulogic ; r : unsigned )	return	std_logic_vector	is
constant	length	:	integer	:=	r'length+1	;
begin
return	std_logic_vector(conv_unsigned(minus(conv_signed(l,length),conv_signed(r,length)),length-1))	;
end	;
function	"-"	( l : signed ; r : std_ulogic )	return	std_logic_vector	is
constant	length	:	integer	:=	l'length	;
begin
return	std_logic_vector(minus(conv_signed(l,length),conv_signed(r,length)))	;
end	;
function	"-"	( l : std_ulogic ; r : signed )	return	std_logic_vector	is
constant	length	:	integer	:=	r'length	;
begin
return	std_logic_vector(minus(conv_signed(l,length),conv_signed(r,length)))	;
end	;
function	"+"	( l : unsigned )	return	unsigned	is
begin
return	l	;
end	;
function	"+"	( l : signed )	return	signed	is
begin
return	l	;
end	;
function	"-"	( l : signed )	return	signed	is
begin
return	0-l	;
end	;
function	"ABS"	( l : signed )	return	signed	is
begin
if	(l(l'left)='0' or l(l'left)='L')	then
return	l	;
else
return	0-l	;
end	if	;
end	;
function	"+"	( l : unsigned )	return	std_logic_vector	is
begin
return	std_logic_vector(l)	;
end	;
function	"+"	( l : signed )	return	std_logic_vector	is
begin
return	std_logic_vector(l)	;
end	;
function	"-"	( l : signed )	return	std_logic_vector	is
variable	tmp	:	signed (l'length-1 downto 0)	;
begin
tmp	:=	0-l	;
return	std_logic_vector(tmp)	;
end	;
function	"ABS"	( l : signed )	return	std_logic_vector	is
variable	tmp	:	signed (l'length-1 downto 0)	;
begin
if	(l(l'left)='0' or l(l'left)='L')	then
return	std_logic_vector(l)	;
else
tmp	:=	0-l	;
return	std_logic_vector(tmp)	;
end	if	;
end	;
function	unsigned_return_boolean	( a : unsigned ; b : unsigned )	return	boolean	is
variable	z	:	boolean	;
begin
return	(z)	;
end	;
function	signed_return_boolean	( a : signed ; b : signed )	return	boolean	is
variable	z	:	boolean	;
begin
return	(z)	;
end	;
function	is_less	( a : signed ; b : signed )	return	boolean	is
constant	sign	:	integer	:=	a'left	;
variable	a_is_0	:	boolean	;
variable	b_is_1	:	boolean	;
variable	result	:	boolean	;
begin
if	a(sign)/=b(sign)	then
result	:=	a(sign)='1'	;
else
result	:=	false	;
for	i	in	0 to sign-1	loop
a_is_0	:=	a(i)='0'	;
b_is_1	:=	b(i)='1'	;
result	:=	(a_is_0 and b_is_1) or (a_is_0 and result) or (b_is_1 and result)	;
end	loop	;
end	if	;
return	result	;
end	;
function	is_less_or_equal	( a : signed ; b : signed )	return	boolean	is
constant	sign	:	integer	:=	a'left	;
variable	a_is_0	:	boolean	;
variable	b_is_1	:	boolean	;
variable	result	:	boolean	;
begin
if	a(sign)/=b(sign)	then
result	:=	a(sign)='1'	;
else
result	:=	true	;
for	i	in	0 to sign-1	loop
a_is_0	:=	a(i)='0'	;
b_is_1	:=	b(i)='1'	;
result	:=	(a_is_0 and b_is_1) or (a_is_0 and result) or (b_is_1 and result)	;
end	loop	;
end	if	;
return	result	;
end	;
function	unsigned_is_less	( a : unsigned ; b : unsigned )	return	boolean	is
constant	sign	:	integer	:=	a'left	;
variable	a_is_0	:	boolean	;
variable	b_is_1	:	boolean	;
variable	result	:	boolean	;
begin
result	:=	false	;
for	i	in	0 to sign	loop
a_is_0	:=	a(i)='0'	;
b_is_1	:=	b(i)='1'	;
result	:=	(a_is_0 and b_is_1) or (a_is_0 and result) or (b_is_1 and result)	;
end	loop	;
return	result	;
end	;
function	unsigned_is_less_or_equal	( a : unsigned ; b : unsigned )	return	boolean	is
constant	sign	:	integer	:=	a'left	;
variable	a_is_0	:	boolean	;
variable	b_is_1	:	boolean	;
variable	result	:	boolean	;
begin
result	:=	true	;
for	i	in	0 to sign	loop
a_is_0	:=	a(i)='0'	;
b_is_1	:=	b(i)='1'	;
result	:=	(a_is_0 and b_is_1) or (a_is_0 and result) or (b_is_1 and result)	;
end	loop	;
return	result	;
end	;
function	"<"	( l : unsigned ; r : unsigned )	return	boolean	is
constant	length	:	integer	:=	max(l'length,r'length)	;
begin
return	unsigned_is_less(conv_unsigned(l,length),conv_unsigned(r,length))	;
end	;
function	"<"	( l : signed ; r : signed )	return	boolean	is
constant	length	:	integer	:=	max(l'length,r'length)	;
begin
return	is_less(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"<"	( l : unsigned ; r : signed )	return	boolean	is
constant	length	:	integer	:=	max(l'length+1,r'length)	;
begin
return	is_less(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"<"	( l : signed ; r : unsigned )	return	boolean	is
constant	length	:	integer	:=	max(l'length,r'length+1)	;
begin
return	is_less(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"<"	( l : unsigned ; r : integer )	return	boolean	is
constant	length	:	integer	:=	l'length+1	;
begin
return	is_less(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"<"	( l : integer ; r : unsigned )	return	boolean	is
constant	length	:	integer	:=	r'length+1	;
begin
return	is_less(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"<"	( l : signed ; r : integer )	return	boolean	is
constant	length	:	integer	:=	l'length	;
begin
return	is_less(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"<"	( l : integer ; r : signed )	return	boolean	is
constant	length	:	integer	:=	r'length	;
begin
return	is_less(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"<="	( l : unsigned ; r : unsigned )	return	boolean	is
constant	length	:	integer	:=	max(l'length,r'length)	;
begin
return	unsigned_is_less_or_equal(conv_unsigned(l,length),conv_unsigned(r,length))	;
end	;
function	"<="	( l : signed ; r : signed )	return	boolean	is
constant	length	:	integer	:=	max(l'length,r'length)	;
begin
return	is_less_or_equal(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"<="	( l : unsigned ; r : signed )	return	boolean	is
constant	length	:	integer	:=	max(l'length+1,r'length)	;
begin
return	is_less_or_equal(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"<="	( l : signed ; r : unsigned )	return	boolean	is
constant	length	:	integer	:=	max(l'length,r'length+1)	;
begin
return	is_less_or_equal(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"<="	( l : unsigned ; r : integer )	return	boolean	is
constant	length	:	integer	:=	l'length+1	;
begin
return	is_less_or_equal(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"<="	( l : integer ; r : unsigned )	return	boolean	is
constant	length	:	integer	:=	r'length+1	;
begin
return	is_less_or_equal(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"<="	( l : signed ; r : integer )	return	boolean	is
constant	length	:	integer	:=	l'length	;
begin
return	is_less_or_equal(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	"<="	( l : integer ; r : signed )	return	boolean	is
constant	length	:	integer	:=	r'length	;
begin
return	is_less_or_equal(conv_signed(l,length),conv_signed(r,length))	;
end	;
function	">"	( l : unsigned ; r : unsigned )	return	boolean	is
constant	length	:	integer	:=	max(l'length,r'length)	;
begin
return	unsigned_is_less(conv_unsigned(r,length),conv_unsigned(l,length))	;
end	;
function	">"	( l : signed ; r : signed )	return	boolean	is
constant	length	:	integer	:=	max(l'length,r'length)	;
begin
return	is_less(conv_signed(r,length),conv_signed(l,length))	;
end	;
function	">"	( l : unsigned ; r : signed )	return	boolean	is
constant	length	:	integer	:=	max(l'length+1,r'length)	;
begin
return	is_less(conv_signed(r,length),conv_signed(l,length))	;
end	;
function	">"	( l : signed ; r : unsigned )	return	boolean	is
constant	length	:	integer	:=	max(l'length,r'length+1)	;
begin
return	is_less(conv_signed(r,length),conv_signed(l,length))	;
end	;
function	">"	( l : unsigned ; r : integer )	return	boolean	is
constant	length	:	integer	:=	l'length+1	;
begin
return	is_less(conv_signed(r,length),conv_signed(l,length))	;
end	;
function	">"	( l : integer ; r : unsigned )	return	boolean	is
constant	length	:	integer	:=	r'length+1	;
begin
return	is_less(conv_signed(r,length),conv_signed(l,length))	;
end	;
function	">"	( l : signed ; r : integer )	return	boolean	is
constant	length	:	integer	:=	l'length	;
begin
return	is_less(conv_signed(r,length),conv_signed(l,length))	;
end	;
function	">"	( l : integer ; r : signed )	return	boolean	is
constant	length	:	integer	:=	r'length	;
begin
return	is_less(conv_signed(r,length),conv_signed(l,length))	;
end	;
function	">="	( l : unsigned ; r : unsigned )	return	boolean	is
constant	length	:	integer	:=	max(l'length,r'length)	;
begin
return	unsigned_is_less_or_equal(conv_unsigned(r,length),conv_unsigned(l,length))	;
end	;
function	">="	( l : signed ; r : signed )	return	boolean	is
constant	length	:	integer	:=	max(l'length,r'length)	;
begin
return	is_less_or_equal(conv_signed(r,length),conv_signed(l,length))	;
end	;
function	">="	( l : unsigned ; r : signed )	return	boolean	is
constant	length	:	integer	:=	max(l'length+1,r'length)	;
begin
return	is_less_or_equal(conv_signed(r,length),conv_signed(l,length))	;
end	;
function	">="	( l : signed ; r : unsigned )	return	boolean	is
constant	length	:	integer	:=	max(l'length,r'length+1)	;
begin
return	is_less_or_equal(conv_signed(r,length),conv_signed(l,length))	;
end	;
function	">="	( l : unsigned ; r : integer )	return	boolean	is
constant	length	:	integer	:=	l'length+1	;
begin
return	is_less_or_equal(conv_signed(r,length),conv_signed(l,length))	;
end	;
function	">="	( l : integer ; r : unsigned )	return	boolean	is
constant	length	:	integer	:=	r'length+1	;
begin
return	is_less_or_equal(conv_signed(r,length),conv_signed(l,length))	;
end	;
function	">="	( l : signed ; r : integer )	return	boolean	is
constant	length	:	integer	:=	l'length	;
begin
return	is_less_or_equal(conv_signed(r,length),conv_signed(l,length))	;
end	;
function	">="	( l : integer ; r : signed )	return	boolean	is
constant	length	:	integer	:=	r'length	;
begin
return	is_less_or_equal(conv_signed(r,length),conv_signed(l,length))	;
end	;
function	bitwise_eql	( l : std_ulogic_vector ; r : std_ulogic_vector )	return	boolean	is
begin
for	i	in	l'range	loop
if	l(i)/=r(i)	then
return	false	;
end	if	;
end	loop	;
return	true	;
end	;
function	bitwise_neq	( l : std_ulogic_vector ; r : std_ulogic_vector )	return	boolean	is
begin
for	i	in	l'range	loop
if	l(i)/=r(i)	then
return	true	;
end	if	;
end	loop	;
return	false	;
end	;
function	"="	( l : unsigned ; r : unsigned )	return	boolean	is
constant	length	:	integer	:=	max(l'length,r'length)	;
begin
return	bitwise_eql(std_ulogic_vector(conv_unsigned(l,length)),std_ulogic_vector(conv_unsigned(r,length)))	;
end	;
function	"="	( l : signed ; r : signed )	return	boolean	is
constant	length	:	integer	:=	max(l'length,r'length)	;
begin
return	bitwise_eql(std_ulogic_vector(conv_signed(l,length)),std_ulogic_vector(conv_signed(r,length)))	;
end	;
function	"="	( l : unsigned ; r : signed )	return	boolean	is
constant	length	:	integer	:=	max(l'length+1,r'length)	;
begin
return	bitwise_eql(std_ulogic_vector(conv_signed(l,length)),std_ulogic_vector(conv_signed(r,length)))	;
end	;
function	"="	( l : signed ; r : unsigned )	return	boolean	is
constant	length	:	integer	:=	max(l'length,r'length+1)	;
begin
return	bitwise_eql(std_ulogic_vector(conv_signed(l,length)),std_ulogic_vector(conv_signed(r,length)))	;
end	;
function	"="	( l : unsigned ; r : integer )	return	boolean	is
constant	length	:	integer	:=	l'length+1	;
begin
return	bitwise_eql(std_ulogic_vector(conv_signed(l,length)),std_ulogic_vector(conv_signed(r,length)))	;
end	;
function	"="	( l : integer ; r : unsigned )	return	boolean	is
constant	length	:	integer	:=	r'length+1	;
begin
return	bitwise_eql(std_ulogic_vector(conv_signed(l,length)),std_ulogic_vector(conv_signed(r,length)))	;
end	;
function	"="	( l : signed ; r : integer )	return	boolean	is
constant	length	:	integer	:=	l'length	;
begin
return	bitwise_eql(std_ulogic_vector(conv_signed(l,length)),std_ulogic_vector(conv_signed(r,length)))	;
end	;
function	"="	( l : integer ; r : signed )	return	boolean	is
constant	length	:	integer	:=	r'length	;
begin
return	bitwise_eql(std_ulogic_vector(conv_signed(l,length)),std_ulogic_vector(conv_signed(r,length)))	;
end	;
function	"/="	( l : unsigned ; r : unsigned )	return	boolean	is
constant	length	:	integer	:=	max(l'length,r'length)	;
begin
return	bitwise_neq(std_ulogic_vector(conv_unsigned(l,length)),std_ulogic_vector(conv_unsigned(r,length)))	;
end	;
function	"/="	( l : signed ; r : signed )	return	boolean	is
constant	length	:	integer	:=	max(l'length,r'length)	;
begin
return	bitwise_neq(std_ulogic_vector(conv_signed(l,length)),std_ulogic_vector(conv_signed(r,length)))	;
end	;
function	"/="	( l : unsigned ; r : signed )	return	boolean	is
constant	length	:	integer	:=	max(l'length+1,r'length)	;
begin
return	bitwise_neq(std_ulogic_vector(conv_signed(l,length)),std_ulogic_vector(conv_signed(r,length)))	;
end	;
function	"/="	( l : signed ; r : unsigned )	return	boolean	is
constant	length	:	integer	:=	max(l'length,r'length+1)	;
begin
return	bitwise_neq(std_ulogic_vector(conv_signed(l,length)),std_ulogic_vector(conv_signed(r,length)))	;
end	;
function	"/="	( l : unsigned ; r : integer )	return	boolean	is
constant	length	:	integer	:=	l'length+1	;
begin
return	bitwise_neq(std_ulogic_vector(conv_signed(l,length)),std_ulogic_vector(conv_signed(r,length)))	;
end	;
function	"/="	( l : integer ; r : unsigned )	return	boolean	is
constant	length	:	integer	:=	r'length+1	;
begin
return	bitwise_neq(std_ulogic_vector(conv_signed(l,length)),std_ulogic_vector(conv_signed(r,length)))	;
end	;
function	"/="	( l : signed ; r : integer )	return	boolean	is
constant	length	:	integer	:=	l'length	;
begin
return	bitwise_neq(std_ulogic_vector(conv_signed(l,length)),std_ulogic_vector(conv_signed(r,length)))	;
end	;
function	"/="	( l : integer ; r : signed )	return	boolean	is
constant	length	:	integer	:=	r'length	;
begin
return	bitwise_neq(std_ulogic_vector(conv_signed(l,length)),std_ulogic_vector(conv_signed(r,length)))	;
end	;
function	shl	( arg : unsigned ; count : unsigned )	return	unsigned	is
constant	control_msb	:	integer	:=	count'length-1	;
variable	control	:	unsigned (control_msb downto 0)	;
constant	result_msb	:	integer	:=	arg'length-1	;
subtype	rtype	is	unsigned (result_msb downto 0)	;
variable	result	:	rtype	;
variable	temp	:	rtype	;
begin
control	:=	make_binary(count)	;
if	(control(0)='X')	then
result	:=	rtype'(others=>'X')	;
return	result	;
end	if	;
result	:=	arg	;
for	i	in	0 to control_msb	loop
if	control(i)='1'	then
temp	:=	rtype'(others=>'0')	;
if	2**i<=result_msb	then
temp(result_msb downto 2**i)	:=	result(result_msb-2**i downto 0)	;
end	if	;
result	:=	temp	;
end	if	;
end	loop	;
return	result	;
end	;
function	shl	( arg : signed ; count : unsigned )	return	signed	is
constant	control_msb	:	integer	:=	count'length-1	;
variable	control	:	unsigned (control_msb downto 0)	;
constant	result_msb	:	integer	:=	arg'length-1	;
subtype	rtype	is	signed (result_msb downto 0)	;
variable	result	:	rtype	;
variable	temp	:	rtype	;
begin
control	:=	make_binary(count)	;
if	(control(0)='X')	then
result	:=	rtype'(others=>'X')	;
return	result	;
end	if	;
result	:=	arg	;
for	i	in	0 to control_msb	loop
if	control(i)='1'	then
temp	:=	rtype'(others=>'0')	;
if	2**i<=result_msb	then
temp(result_msb downto 2**i)	:=	result(result_msb-2**i downto 0)	;
end	if	;
result	:=	temp	;
end	if	;
end	loop	;
return	result	;
end	;
function	shr	( arg : unsigned ; count : unsigned )	return	unsigned	is
constant	control_msb	:	integer	:=	count'length-1	;
variable	control	:	unsigned (control_msb downto 0)	;
constant	result_msb	:	integer	:=	arg'length-1	;
subtype	rtype	is	unsigned (result_msb downto 0)	;
variable	result	:	rtype	;
variable	temp	:	rtype	;
begin
control	:=	make_binary(count)	;
if	(control(0)='X')	then
result	:=	rtype'(others=>'X')	;
return	result	;
end	if	;
result	:=	arg	;
for	i	in	0 to control_msb	loop
if	control(i)='1'	then
temp	:=	rtype'(others=>'0')	;
if	2**i<=result_msb	then
temp(result_msb-2**i downto 0)	:=	result(result_msb downto 2**i)	;
end	if	;
result	:=	temp	;
end	if	;
end	loop	;
return	result	;
end	;
function	shr	( arg : signed ; count : unsigned )	return	signed	is
constant	control_msb	:	integer	:=	count'length-1	;
variable	control	:	unsigned (control_msb downto 0)	;
constant	result_msb	:	integer	:=	arg'length-1	;
subtype	rtype	is	signed (result_msb downto 0)	;
variable	result	:	rtype	;
variable	temp	:	rtype	;
variable	sign_bit	:	std_ulogic	;
begin
control	:=	make_binary(count)	;
if	(control(0)='X')	then
result	:=	rtype'(others=>'X')	;
return	result	;
end	if	;
result	:=	arg	;
sign_bit	:=	arg(arg'left)	;
for	i	in	0 to control_msb	loop
if	control(i)='1'	then
temp	:=	rtype'(others=>sign_bit)	;
if	2**i<=result_msb	then
temp(result_msb-2**i downto 0)	:=	result(result_msb downto 2**i)	;
end	if	;
result	:=	temp	;
end	if	;
end	loop	;
return	result	;
end	;
function	conv_integer	( arg : integer )	return	integer	is
begin
return	arg	;
end	;
function	conv_integer	( arg : unsigned )	return	integer	is
variable	result	:	integer	;
variable	tmp	:	std_ulogic	;
begin
assert	arg'length<=31	report "ARG is too large in CONV_INTEGER"	severity failure	;
result	:=	0	;
for	i	in	arg'range	loop
result	:=	result*2	;
tmp	:=	tbl_binary(arg(i))	;
if	tmp='1'	then
result	:=	result+1	;
elsif	tmp='X'	then
assert	false	report "CONV_INTEGER: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, and it has been converted to 0."	severity warning	;
end	if	;
end	loop	;
return	result	;
end	;
function	conv_integer	( arg : signed )	return	integer	is
variable	result	:	integer	;
variable	tmp	:	std_ulogic	;
begin
assert	arg'length<=32	report "ARG is too large in CONV_INTEGER"	severity failure	;
result	:=	0	;
for	i	in	arg'range	loop
if	i/=arg'left	then
result	:=	result*2	;
tmp	:=	tbl_binary(arg(i))	;
if	tmp='1'	then
result	:=	result+1	;
elsif	tmp='X'	then
assert	false	report "CONV_INTEGER: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, and it has been converted to 0."	severity warning	;
end	if	;
end	if	;
end	loop	;
tmp	:=	make_binary(arg(arg'left))	;
if	tmp='1'	then
if	arg'length=32	then
result	:=	(result-2**30)-2**30	;
else
result	:=	result-(2**(arg'length-1))	;
end	if	;
end	if	;
return	result	;
end	;
function	conv_integer	( arg : std_ulogic )	return	small_int	is
variable	tmp	:	std_ulogic	;
begin
tmp	:=	tbl_binary(arg)	;
if	tmp='1'	then
return	1	;
elsif	tmp='X'	then
assert	false	report "CONV_INTEGER: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, and it has been converted to 0."	severity warning	;
return	0	;
else
return	0	;
end	if	;
end	;
function	conv_unsigned	( arg : integer ; size : integer )	return	unsigned	is
variable	result	:	unsigned (size-1 downto 0)	;
variable	temp	:	integer	;
begin
temp	:=	arg	;
for	i	in	0 to size-1	loop
if	(temp mod 2)=1	then
result(i)	:=	'1'	;
else
result(i)	:=	'0'	;
end	if	;
if	temp>0	then
temp	:=	temp/2	;
else
temp	:=	(temp-1)/2	;
end	if	;
end	loop	;
return	result	;
end	;
function	conv_unsigned	( arg : unsigned ; size : integer )	return	unsigned	is
constant	msb	:	integer	:=	min(arg'length,size)-1	;
subtype	rtype	is	unsigned (size-1 downto 0)	;
variable	new_bounds	:	unsigned (arg'length-1 downto 0)	;
variable	result	:	rtype	;
begin
new_bounds	:=	make_binary(arg)	;
if	(new_bounds(0)='X')	then
result	:=	rtype'(others=>'X')	;
return	result	;
end	if	;
result	:=	rtype'(others=>'0')	;
result(msb downto 0)	:=	new_bounds(msb downto 0)	;
return	result	;
end	;
function	conv_unsigned	( arg : signed ; size : integer )	return	unsigned	is
constant	msb	:	integer	:=	min(arg'length,size)-1	;
subtype	rtype	is	unsigned (size-1 downto 0)	;
variable	new_bounds	:	unsigned (arg'length-1 downto 0)	;
variable	result	:	rtype	;
begin
new_bounds	:=	make_binary(arg)	;
if	(new_bounds(0)='X')	then
result	:=	rtype'(others=>'X')	;
return	result	;
end	if	;
result	:=	rtype'(others=>new_bounds(new_bounds'left))	;
result(msb downto 0)	:=	new_bounds(msb downto 0)	;
return	result	;
end	;
function	conv_unsigned	( arg : std_ulogic ; size : integer )	return	unsigned	is
subtype	rtype	is	unsigned (size-1 downto 0)	;
variable	result	:	rtype	;
begin
result	:=	rtype'(others=>'0')	;
result(0)	:=	make_binary(arg)	;
if	(result(0)='X')	then
result	:=	rtype'(others=>'X')	;
end	if	;
return	result	;
end	;
function	conv_signed	( arg : integer ; size : integer )	return	signed	is
variable	result	:	signed (size-1 downto 0)	;
variable	temp	:	integer	;
begin
temp	:=	arg	;
for	i	in	0 to size-1	loop
if	(temp mod 2)=1	then
result(i)	:=	'1'	;
else
result(i)	:=	'0'	;
end	if	;
if	temp>0	then
temp	:=	temp/2	;
elsif	(temp>integer'low)	then
temp	:=	(temp-1)/2	;
else
temp	:=	temp/2	;
end	if	;
end	loop	;
return	result	;
end	;
function	conv_signed	( arg : unsigned ; size : integer )	return	signed	is
constant	msb	:	integer	:=	min(arg'length,size)-1	;
subtype	rtype	is	signed (size-1 downto 0)	;
variable	new_bounds	:	signed (arg'length-1 downto 0)	;
variable	result	:	rtype	;
begin
new_bounds	:=	make_binary(arg)	;
if	(new_bounds(0)='X')	then
result	:=	rtype'(others=>'X')	;
return	result	;
end	if	;
result	:=	rtype'(others=>'0')	;
result(msb downto 0)	:=	new_bounds(msb downto 0)	;
return	result	;
end	;
function	conv_signed	( arg : signed ; size : integer )	return	signed	is
constant	msb	:	integer	:=	min(arg'length,size)-1	;
subtype	rtype	is	signed (size-1 downto 0)	;
variable	new_bounds	:	signed (arg'length-1 downto 0)	;
variable	result	:	rtype	;
begin
new_bounds	:=	make_binary(arg)	;
if	(new_bounds(0)='X')	then
result	:=	rtype'(others=>'X')	;
return	result	;
end	if	;
result	:=	rtype'(others=>new_bounds(new_bounds'left))	;
result(msb downto 0)	:=	new_bounds(msb downto 0)	;
return	result	;
end	;
function	conv_signed	( arg : std_ulogic ; size : integer )	return	signed	is
subtype	rtype	is	signed (size-1 downto 0)	;
variable	result	:	rtype	;
begin
result	:=	rtype'(others=>'0')	;
result(0)	:=	make_binary(arg)	;
if	(result(0)='X')	then
result	:=	rtype'(others=>'X')	;
end	if	;
return	result	;
end	;
function	conv_std_logic_vector	( arg : integer ; size : integer )	return	std_logic_vector	is
variable	result	:	std_logic_vector (size-1 downto 0)	;
variable	temp	:	integer	;
begin
temp	:=	arg	;
for	i	in	0 to size-1	loop
if	(temp mod 2)=1	then
result(i)	:=	'1'	;
else
result(i)	:=	'0'	;
end	if	;
if	temp>0	then
temp	:=	temp/2	;
elsif	(temp>integer'low)	then
temp	:=	(temp-1)/2	;
else
temp	:=	temp/2	;
end	if	;
end	loop	;
return	result	;
end	;
function	conv_std_logic_vector	( arg : unsigned ; size : integer )	return	std_logic_vector	is
constant	msb	:	integer	:=	min(arg'length,size)-1	;
subtype	rtype	is	std_logic_vector (size-1 downto 0)	;
variable	new_bounds	:	std_logic_vector (arg'length-1 downto 0)	;
variable	result	:	rtype	;
begin
new_bounds	:=	make_binary(arg)	;
if	(new_bounds(0)='X')	then
result	:=	rtype'(others=>'X')	;
return	result	;
end	if	;
result	:=	rtype'(others=>'0')	;
result(msb downto 0)	:=	new_bounds(msb downto 0)	;
return	result	;
end	;
function	conv_std_logic_vector	( arg : signed ; size : integer )	return	std_logic_vector	is
constant	msb	:	integer	:=	min(arg'length,size)-1	;
subtype	rtype	is	std_logic_vector (size-1 downto 0)	;
variable	new_bounds	:	std_logic_vector (arg'length-1 downto 0)	;
variable	result	:	rtype	;
begin
new_bounds	:=	make_binary(arg)	;
if	(new_bounds(0)='X')	then
result	:=	rtype'(others=>'X')	;
return	result	;
end	if	;
result	:=	rtype'(others=>new_bounds(new_bounds'left))	;
result(msb downto 0)	:=	new_bounds(msb downto 0)	;
return	result	;
end	;
function	conv_std_logic_vector	( arg : std_ulogic ; size : integer )	return	std_logic_vector	is
subtype	rtype	is	std_logic_vector (size-1 downto 0)	;
variable	result	:	rtype	;
begin
result	:=	rtype'(others=>'0')	;
result(0)	:=	make_binary(arg)	;
if	(result(0)='X')	then
result	:=	rtype'(others=>'X')	;
end	if	;
return	result	;
end	;
function	ext	( arg : std_logic_vector ; size : integer )	return	std_logic_vector	is
constant	msb	:	integer	:=	min(arg'length,size)-1	;
subtype	rtype	is	std_logic_vector (size-1 downto 0)	;
variable	new_bounds	:	std_logic_vector (arg'length-1 downto 0)	;
variable	result	:	rtype	;
begin
new_bounds	:=	make_binary(arg)	;
if	(new_bounds(0)='X')	then
result	:=	rtype'(others=>'X')	;
return	result	;
end	if	;
result	:=	rtype'(others=>'0')	;
result(msb downto 0)	:=	new_bounds(msb downto 0)	;
return	result	;
end	;
function	sxt	( arg : std_logic_vector ; size : integer )	return	std_logic_vector	is
constant	msb	:	integer	:=	min(arg'length,size)-1	;
subtype	rtype	is	std_logic_vector (size-1 downto 0)	;
variable	new_bounds	:	std_logic_vector (arg'length-1 downto 0)	;
variable	result	:	rtype	;
begin
new_bounds	:=	make_binary(arg)	;
if	(new_bounds(0)='X')	then
result	:=	rtype'(others=>'X')	;
return	result	;
end	if	;
result	:=	rtype'(others=>new_bounds(new_bounds'left))	;
result(msb downto 0)	:=	new_bounds(msb downto 0)	;
return	result	;
end	;
end	std_logic_arith	;
