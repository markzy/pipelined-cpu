----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2015/04/18 20:54:31
-- Design Name: 
-- Module Name: IF2ID - Behavioral
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

entity IF2ID is
    Port ( instrf : in STD_LOGIC_VECTOR (31 downto 0);
           PCPlus4F : in STD_LOGIC_VECTOR (31 downto 0);
           PCPlus4D : out STD_LOGIC_VECTOR (31 downto 0);
           instrd : out STD_LOGIC_VECTOR (31 downto 0);
           clk : in STD_LOGIC;
           clear:in std_logic;
           signalaF, signalbF, srctypeF,writecontrolf: in std_logic;
           signalaD, signalbD, srctypeD,writecontrold : out std_logic
           );
end IF2ID;

architecture Behavioral of IF2ID is
signal instr, PCPlus4: std_logic_vector(31 downto 0):=x"00000000";
signal signala, signalb, srctype, writecontrol,clearmode: std_logic := '0';
begin
    instrD <= instr;
    PCPlus4D <= PCPlus4;
    signalad <= signala; signalbd<= signalb; srctyped <= srctype; writecontrold<= writecontrol;
    process(clk)
    begin
        if rising_edge(clk) then
            if clearmode = '0' then
            clearmode <= clear;
            instr <= instrf;
            PCPlus4 <= PCPlus4F;
            signala <= signalaF; signalb<= signalbF; srctype <= srctypeF; writecontrol<= writecontrolf;
            else 
            clearmode <= clear;
            instr <= x"00000000";
            PCPlus4 <= x"00000000";
            signala <= '0'; signalb<= '0'; srctype <= '0'; writecontrol<= '0';
        end if;
        end if;
    end process;
    
     

end Behavioral;
