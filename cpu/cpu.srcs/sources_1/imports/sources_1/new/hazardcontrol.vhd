----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2015/04/27 21:56:20
-- Design Name: 
-- Module Name: hazardcontrol - Behavioral
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

entity hazardcontrol is
    Port ( instr : in STD_LOGIC_VECTOR (31 downto 0);
           clk : in STD_LOGIC;
           A : out STD_LOGIC;
           B : out STD_LOGIC;
           ifstop :out std_logic;
           srctype : out STD_LOGIC;
           writecontrol: out std_logic);
end hazardcontrol;

architecture Behavioral of hazardcontrol is
signal formerInstr,latterInstr: std_logic_vector(31 downto 0):=x"00000000";
signal stopcount:std_logic_vector(1 downto 0):="00";
begin
        latterinstr <= instr;
        process(clk)
        begin
            if rising_edge(clk) then
                formerInstr <= latterinstr;
                
            end if;
            
            --jr instr
            if latterinstr(31 downto 26) = "000000" and latterinstr(5 downto 0) = "001000"  then
                    A <= '0';
                    B <= '0';
                    if stopcount = "00"  and formerinstr /= latterinstr then
                        stopcount <= "01";
                    end if;
                    srctype <= '0';
                    writecontrol <= '0';
            --lw -> alu            
            elsif formerinstr(31 downto 26) = "100011" and latterinstr(31 downto 26) = "000000" and formerinstr(20 downto 16) = latterinstr(25 downto 21)  and latterinstr/= x"00000000" then
                    A <= '1';
                    B <= '0';
                    stopcount <= "01";
                    srctype <= '1';
                    writecontrol <= '0';
           elsif formerinstr(31 downto 26) = "100011" and latterinstr(31 downto 26) = "000000" and formerinstr(20 downto 16) = latterinstr(20 downto 16) and latterinstr/= x"00000000" then
                    A <= '0';
                    B <= '1';
                    stopcount <= "01";
                    srctype <= '1';
                    writecontrol <= '0';
            --lw -> sw
            elsif formerinstr(31 downto 26) = "100011" and latterinstr(31 downto 26) = "101011" and formerinstr(20 downto 16) = latterinstr(20 downto 16) then
                    A <= '0';
                    B <= '0';
                    stopcount <= "00";
                    srctype <= '0';
                    writecontrol <= '1';                                                
            --alu -> alu
            elsif formerinstr(31 downto 26) = "000000" and latterinstr(31 downto 26) = "000000" and formerinstr(15 downto 11) = latterinstr(25 downto 21) and formerinstr /= x"00000000" then
                     A <= '1';
                     B <= '0';
                     stopcount <= "00";
                     srctype <= '0';
                     writecontrol <= '0';
           elsif formerinstr(31 downto 26) = "000000" and latterinstr(31 downto 26) = "000000" and formerinstr(15 downto 11) = latterinstr(20 downto 16) and formerinstr /= x"00000000" then
                      A <= '0';
                      B <= '1';
                      stopcount <= "00";
                     srctype <= '0';
                    writecontrol <= '0';
            --beq ,stop for 3 clks
            elsif latterinstr(31 downto 26) ="000100" then
                     A <= '0';
                     B <= '0';
                     srctype <= '0';
                     writecontrol <= '0';
                     if stopcount = "00"  and formerinstr /= latterinstr then
                     stopcount <= "11";
                     end if;
          else
                     A <= '0';
                     B <= '0';
                     stopcount <= "00";
                     srctype <= '0';
                     writecontrol <= '0';
          end if;

          --stopcount descending
          if rising_edge(clk) and stopcount /= "00" then
            stopcount <= conv_std_logic_vector(conv_integer(stopcount)-1,2);
          end if;

          end process;
            
          ifstop <= stopcount(1) or stopcount(0);


            
            
                


end Behavioral;
