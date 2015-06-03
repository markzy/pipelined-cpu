----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2015/04/07 21:03:57
-- Design Name: 
-- Module Name: shift2 - Behavioral
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

entity shift2 is
    Port ( shiftin : in STD_LOGIC_VECTOR (31 downto 0);
           shiftout : out STD_LOGIC_VECTOR (31 downto 0));
end shift2;

architecture Behavioral of shift2 is

begin
    shiftout <= conv_std_logic_vector(conv_integer(shiftin)*4,32);

end Behavioral;
