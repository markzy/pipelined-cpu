----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2015/04/07 19:40:51
-- Design Name: 
-- Module Name: Register - Behavioral
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

entity RegFile is
    Port ( A1 : in STD_LOGIC_VECTOR (4 downto 0);
           A2 : in STD_LOGIC_VECTOR (4 downto 0);
           A3 : in STD_LOGIC_VECTOR (4 downto 0);
           WD3 : in STD_LOGIC_VECTOR (31 downto 0);
           CLK : in STD_LOGIC;
           WE3 : in STD_LOGIC;
           RD1 : out STD_LOGIC_VECTOR (31 downto 0);
           RD2 : out STD_LOGIC_VECTOR (31 downto 0));
end RegFile;

architecture Behavioral of RegFile is
subtype unit is std_logic_vector(31 downto 0);
type reg is array(31 downto 0) of unit;
signal RegFile:reg:=(
    0 =>x"00000001",
    1 =>x"00000002",
    2 =>x"00000003",
    4 =>x"00000004",
    7 =>x"00000011",
    others => (others =>'0'));
begin
    Process(CLK)
    begin
    if  WE3 = '1' then
    RegFile(conv_integer(A3)) <= WD3;
    end if;
    RD1 <= RegFile(conv_integer(A1));
    RD2 <= RegFile(conv_integer(A2));
    end process;


end Behavioral;
