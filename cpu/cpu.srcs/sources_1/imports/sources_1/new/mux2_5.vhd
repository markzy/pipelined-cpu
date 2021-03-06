----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2015/04/19 23:24:24
-- Design Name: 
-- Module Name: mux2_5 - Behavioral
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

entity mux2_5 is
    Port ( A : in STD_LOGIC_VECTOR (4 downto 0);
           B : in STD_LOGIC_VECTOR (4 downto 0);
           C : in STD_LOGIC;
           muxout : out STD_LOGIC_VECTOR (4 downto 0));
end mux2_5;

architecture Behavioral of mux2_5 is

begin
        process(A,B,C)
        begin
        if C='0' then
             muxout<= A;
        else muxout<=B;
        end if;
        end process; 

end Behavioral;
