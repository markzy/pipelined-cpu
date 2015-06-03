----------------------------------------------------------------------------------
-- Company: XJTU
-- Engineer: Mark.Zhou
-- 
-- Create Date: 2015/04/07 19:40:51
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    Port ( SrcA : in STD_LOGIC_VECTOR (31 downto 0);
           SrcB : in STD_LOGIC_VECTOR (31 downto 0);
           shiftmode: in std_logic;
           shamt:in std_logic_vector(4 downto 0);
           ALUControl : in STD_LOGIC_VECTOR (2 downto 0);
           zero : out STD_LOGIC;
           ALUout : out STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is
signal Result, AddResult, SubResult, AndResult, OrResult ,xorResult ,norresult, sllresult, srlresult:std_logic_vector(31 downto 0):=x"00000000";
begin
    process(SrcA, SrcB, AlUControl,shamt)
    begin
    AddResult <= conv_std_logic_vector((conv_integer(SrcA)+conv_integer(SrcB)),32);
    SubResult <= conv_std_logic_vector((conv_integer(SrcA)-conv_integer(SrcB)),32);
    AndResult <= SrcA and SrcB;
    OrResult <= SrcA or SrcB;
    xorresult <= srcA xor srcb;
    norresult <= not(srcA or srcb);
    sllresult <= x"00000000";--srcb sll conv_integer(shamt);
    srlresult <= x"00000000";-- srcb srl conv_integer(shamt);
    end process;
    
    
    process(AlUControl,AddResult, SubResult, AndResult, OrResult ,xorResult ,norresult)
    begin
    case ALUControl is 
    when "000" => Result <=AddResult;
    when "010" => Result <=SubResult;
    when "100" => Result <=AndResult;
    when "101" => Result <=OrResult;
    when "110" => Result <=xorResult;
    when "111" => Result <=norresult;
    when others => Result<=(others=>'Z');
    end case;
    end process;
    zero <= not (Result(31) or Result(30) or Result(29) or Result(28) or Result(27) or Result(26) or Result(25) or Result(24) or Result(23)
         or Result(22) or Result(21) or Result(20) or Result(19) or Result(18) or Result(17) or Result(16) or Result(15) or Result(14) or Result(13)
          or Result(12) or Result(11) or Result(12) or Result(11) or Result(10) or Result(9) or Result(8) or Result(7) or Result(6)
           or Result(5) or Result(4) or Result(3) or Result(2) or Result(1) or Result(0));
    AlUout <= Result;
    
end Behavioral;
