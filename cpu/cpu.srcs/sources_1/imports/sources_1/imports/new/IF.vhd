----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2015/04/18 20:54:31
-- Design Name: 
-- Module Name: IF - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IF1 is
    Port ( pcin : in STD_LOGIC_VECTOR (31 downto 0);
           pcf : out STD_LOGIC_VECTOR (31 downto 0);
           clk : in STD_LOGIC;
           ifstop: in std_logic);
end IF1;

architecture Behavioral of IF1 is
signal pc:std_logic_vector(31 downto 0):=x"00000000";
begin
    process(clk)
    begin
        if rising_edge(clk) and ifstop = '0' then
        pc <= pcin;
        end if;
    end process;
    pcf <= pc;

end Behavioral;
