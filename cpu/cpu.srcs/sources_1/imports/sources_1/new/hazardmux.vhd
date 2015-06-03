----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2015/04/27 21:56:20
-- Design Name: 
-- Module Name: hazardmux - Behavioral
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

entity hazardmux is
    Port ( AorB : in STD_LOGIC;
           srcType : in STD_LOGIC;
           src : in STD_LOGIC_VECTOR (31 downto 0);
           alu : in STD_LOGIC_VECTOR (31 downto 0);
           mem : in STD_LOGIC_VECTOR (31 downto 0);
           muxout : out STD_LOGIC_VECTOR (31 downto 0));
end hazardmux;

architecture Behavioral of hazardmux is

begin

        process(aorb,srctype,src,alu,mem)
        begin 
            if aorb = '1' and srctype = '0' then
                muxout <=alu;
            elsif aorb = '1' and srctype = '1' then
                muxout <=mem;
            else
                muxout<= src;
            end if;
        end process;

end Behavioral;
