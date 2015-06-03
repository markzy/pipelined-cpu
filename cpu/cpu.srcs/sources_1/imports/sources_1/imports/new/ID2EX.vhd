----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2015/04/18 20:54:31
-- Design Name: 
-- Module Name: ID2EX - Behavioral
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

entity ID2EX is
    Port ( regwrited : in STD_LOGIC;
           memtoregd : in STD_LOGIC;
           memwrited : in STD_LOGIC;
           branchd : in STD_LOGIC;
           alucontrold : in STD_LOGIC_VECTOR (2 downto 0);
           alusrcd : in STD_LOGIC;
           regdstd : in STD_LOGIC;
           jrd : in STD_LOGIC;
           regwriteE : out STD_LOGIC;
           memtoregE : out STD_LOGIC;
           memwriteE : out STD_LOGIC;
           BranchE : out STD_LOGIC;
           alucontrolE : out STD_LOGIC_VECTOR (2 downto 0);
           alusrcE : out STD_LOGIC;
           regdstE : out STD_LOGIC;
           jrE : out STD_LOGIC;
           RD1D : in STD_LOGIC_VECTOR (31 downto 0);
           RD2D : in STD_LOGIC_VECTOR (31 downto 0);
           RD1E : out STD_LOGIC_VECTOR (31 downto 0);
           RD2E : out STD_LOGIC_VECTOR (31 downto 0);
           rtd : in STD_LOGIC_VECTOR (4 downto 0);
           rte : out STD_LOGIC_VECTOR (4 downto 0);
           rdd : in STD_LOGIC_VECTOR (4 downto 0);
           rde : out STD_LOGIC_VECTOR (4 downto 0);
           signimmD : in STD_LOGIC_VECTOR (31 downto 0);
           signimmE : out STD_LOGIC_VECTOR (31 downto 0);
           PCPlus4D : in STD_LOGIC_VECTOR (31 downto 0);
           PCPlus4E : out STD_LOGIC_VECTOR (31 downto 0);
           shamtd : in STD_LOGIC_VECTOR (4 downto 0);
           shamte : out STD_LOGIC_VECTOR (4 downto 0);
           shiftmoded: in std_logic;
           shiftmodee: out std_logic;
           clk : in STD_LOGIC;
           signalad,signalbd,srctyped, writecontrold:in std_logic;
           signalae,signalbe,srctypee,writecontrole:out std_logic);
end ID2EX;

architecture Behavioral of ID2EX is
signal regwrite, memtoreg, memwrite, branch, alusrc, regdst, jr, signala, signalb, srctype, writecontrol,shiftmode:std_logic:='0';
signal ALUControl: std_logic_vector(2 downto 0):="000";
signal rt,rd,shamt: std_logic_vector(4 downto 0):="00000";
signal RD1, RD2, signimm, pcplus: std_logic_vector(31 downto 0):=x"00000000";
begin
       regwriteE <= regwrite; 
       memtoregE <= memtoreg; 
       memwriteE <= memwrite; 
       branchE <= branch;
       alusrcE <= alusrc; 
       regdstE <= regdst; 
       jrE <= jr;
       ALUcontrolE <=Alucontrol; 
       rtE <= rt; 
       rdE <= rd; 
       shamte <=shamt;
       RD1E<= RD1; 
       RD2E <= RD2; 
       signimmE <= signimm; 
       pcplus4E <= pcplus;
       shiftmodee<= shiftmode;
       signalae <= signala; signalbe <= signalb; srctypee <= srctype; writecontrole <= writecontrol;
    process(clk)
       begin
           if rising_edge(clk) then
               regwrite <= regwriteD; memtoreg <= memtoregD; memwrite <= memwriteD; branch <= branchD;
               alusrc <= alusrcD; regdst<= regdstD; jr <= jrD;
               ALUcontrol <=AlucontrolD; rt<=rtd; rd<=rdd; RD1<= RD1D; RD2 <= RD2D; signimm<=signimmD; pcplus <= pcplus4D;
               signala <= signalad; signalb <= signalbd; srctype <= srctyped; writecontrol <= writecontrold;
               shamt <=shamtd; shiftmode <=shiftmoded;
           end if;
       end process;

end Behavioral;
