----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2015/04/18 20:54:31
-- Design Name: 
-- Module Name: MEM2WB - Behavioral
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

entity MEM2WB is
    Port ( regwriteM : in STD_LOGIC;
           memtoregM : in STD_LOGIC;
           AluoutM : in STD_LOGIC_VECTOR (31 downto 0);
           RDM : in STD_LOGIC_VECTOR (31 downto 0);
           writeregM : in STD_LOGIC_VECTOR (4 downto 0);
           regwriteW : out STD_LOGIC;
           MemtoregW : out STD_LOGIC;
           aluoutW : out STD_LOGIC_VECTOR (31 downto 0);
           rdW : out STD_LOGIC_VECTOR (31 downto 0);
           writeRegW : out STD_LOGIC_VECTOR (4 downto 0);
           clk : in STD_LOGIC);
end MEM2WB;

architecture Behavioral of MEM2WB is
signal regwrite, memtoreg: std_logic:='0';
signal writereg: std_logic_vector(4 downto 0):="00000";
signal aluout, rd: std_logic_vector(31 downto 0):=x"00000000";
begin
    
    regwriteW <= regwrite;
    memtoregW <= memtoreg;
    aluoutW <= aluout;
    rdW <= rd;
    writeregW <= writereg;
    process(clk)
        begin
            if rising_edge(clk) then
                regwrite <= regwriteM;
                memtoreg <= memtoregM;
                aluout <= aluoutM;
                rd <= rdM;
                writereg <= writeregM;
            end if;
        end process;


end Behavioral;
