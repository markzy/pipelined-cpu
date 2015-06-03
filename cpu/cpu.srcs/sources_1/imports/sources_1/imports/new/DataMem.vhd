----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2015/04/07 19:08:40
-- Design Name: 
-- Module Name: DataMem - Behavioral
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

entity DataMem is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           WD : in STD_LOGIC_VECTOR (31 downto 0);
           WE : in STD_LOGIC;
           CLK : in STD_LOGIC;
           RD : out STD_LOGIC_VECTOR (31 downto 0));
end DataMem;

architecture Behavioral of DataMem is
subtype unit is std_logic_vector(7 downto 0);
type ram is array(0 to 4095) of unit;
signal DataMem:ram:=(
7=>x"00", 6=>x"00",5=>x"00", 4=>x"33",
others => (others =>'0'));
begin
	RD(7 downto 0) <= DataMem(conv_integer(A));
    RD(15 downto 8) <= DataMem(conv_integer(A)+1);
    RD(23 downto 16) <= DataMem(conv_integer(A)+2);
    RD(31 downto 24) <= DataMem(conv_integer(A)+3);
    process(CLK,WE)
    begin
    if WE = '1' then
        DataMem(conv_integer(A)) <= WD(7 downto 0);
        DataMem(conv_integer(A)+1) <= WD(15 downto 8); 
        DataMem(conv_integer(A)+2) <= WD(23 downto 16); 
        DataMem(conv_integer(A)+3) <= WD(31 downto 24);      
    end if;
    end process;

end Behavioral;
