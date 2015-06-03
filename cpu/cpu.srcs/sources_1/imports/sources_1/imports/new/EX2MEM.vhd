----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2015/04/18 20:54:31
-- Design Name: 
-- Module Name: EX2MEM - Behavioral
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

entity EX2MEM is
    Port ( clk : in STD_LOGIC;
           regwriteE : in STD_LOGIC;
           memtoregE : in STD_LOGIC;
           memwriteE : in STD_LOGIC;
           BranchE : in STD_LOGIC;
           zeroE : in STD_LOGIC;
           AluoutE : in STD_LOGIC_VECTOR (31 downto 0);
           writedataE : in STD_LOGIC_VECTOR (31 downto 0);
           WriteregE : in STD_LOGIC_VECTOR (4 downto 0);
           PCBranchE : in STD_LOGIC_VECTOR (31 downto 0);
           regwriteM : out STD_LOGIC;
           memtoregM : out STD_LOGIC;
           memwriteM : out STD_LOGIC;
           BranchM : out STD_LOGIC;
           ZeroM : out STD_LOGIC;
           AluoutM : out STD_LOGIC_VECTOR (31 downto 0);
           WriteDataM : out STD_LOGIC_VECTOR (31 downto 0);
           WriteRegM : out STD_LOGIC_VECTOR (4 downto 0);
           PCBranchM : out STD_LOGIC_VECTOR (31 downto 0);
           writecontrole :in std_logic;
           writecontrolm:out std_logic
           );
end EX2MEM;

architecture Behavioral of EX2MEM is
signal regwrite, memtoreg, memwrite, branch,zero, writecontrol: std_logic:='0';
signal writereg :std_logic_vector(4 downto 0):="00000";
signal aluout, writedata, pcbranch: std_logic_vector(31 downto 0):=x"00000000";
begin
     
    regwriteM <= regwrite; memtoregM <= memtoreg; memwriteM <= memwrite; branchM <= branch;
    zeroM <= zero; AluoutM <= ALuout; writedataM <= writedata; writeregM <= writereg; PCbranchM <= PCbranch;
    writecontrolm <= writecontrol;
    process(clk)
       begin
           if rising_edge(clk) then
                regwrite <= regwriteE; memtoreg <= memtoregE; memwrite <= memwriteE; branch <= branchE;
                zero <= zeroE; Aluout <= ALuoutE; writedata <= writedataE; writereg <= writeregE; PCbranch <= PCbranchE; writecontrol<= writecontrolE;
           end if;
       end process;

end Behavioral;
