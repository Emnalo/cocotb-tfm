library	ieee	;
use	ieee.std_logic_1164.all	;
package	util	is
function	conv_std_logic_vector	( arg : integer ; size : integer )	return	std_logic_vector	;
function	conv_integer	( arg : std_logic_vector )	return	integer	;
function	pasar_a_integer	( arg : std_logic_vector )	return	integer	;
end	util	;
package	body	util	is
type	tbl_type	is	array (std_ulogic) of std_ulogic	;
constant	tbl_binary	:	tbl_type	:=	('0','0','0','1','0','0','0','1','0')	;
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
else
temp	:=	(temp-1)/2	;
end	if	;
end	loop	;
return	result	;
end	;
function	conv_integer	( arg : std_logic_vector )	return	integer	is
variable	result	:	integer	;
begin
assert	arg'length<=32	report "ARG is too large in CONV_INTEGER"	severity failure	;
result	:=	0	;
for	i	in	arg'range	loop
if	i/=arg'left	then
result	:=	result*2	;
if	tbl_binary(arg(i))='1'	then
result	:=	result+1	;
end	if	;
end	if	;
end	loop	;
return	result	;
end	;
function	pasar_a_integer	( arg : in std_logic_vector )	return	integer	is
variable	result	:	integer	;
begin
assert	arg'length<=32	report "ARG is too large in CONV_INTEGER"	severity failure	;
result	:=	0	;
for	i	in	arg'range	loop
if	(arg'left>arg'right)	then
if	(arg(i)='1')	then
result	:=	result+2**i	;
end	if	;
elsif	(arg'left<arg'right)	then
if	(arg(i)='1')	then
result	:=	result+2**(arg'right-i)	;
end	if	;
end	if	;
end	loop	;
return	result	;
end	;
end	util	;
