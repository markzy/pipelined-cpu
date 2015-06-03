----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2015/04/07 19:08:40
-- Design Name: 
-- Module Name: InstruMem - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity InstruMem is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           RD : out STD_LOGIC_VECTOR (31 downto 0));
end InstruMem;

architecture Behavioral of InstruMem is
subtype unit is std_logic_vector(7 downto 0);
type ram is array(0 to 4095) of unit;
signal InstruMem:ram:= (
    3=>x"00",2=>x"22",1=>x"18",0=>x"20",
    7=>x"00",6=>x"60",5=>x"10",4=>x"22",
    11=>x"8C",10=>x"85",9=>x"00",8=>x"00",
    15=>x"00",14=>x"A1",13=>x"30",12=>x"20",
    19=>x"AC",18=>x"87",17=>x"00",16=>x"00",
    23=>x"10",22=>x"C6",21=>x"00",20=>x"0A",
    67=>x"01",66=>x"00",65=>x"00",64=>x"08",
    
    others => (others =>'0')
);
begin
    RD(7 downto 0) <= InstruMem(conv_integer(A));
    RD(15 downto 8) <= InstruMem(conv_integer(A)+1);
    RD(23 downto 16) <= InstruMem(conv_integer(A)+2);
    RD(31 downto 24) <= InstruMem(conv_integer(A)+3);

end Behavioral;
