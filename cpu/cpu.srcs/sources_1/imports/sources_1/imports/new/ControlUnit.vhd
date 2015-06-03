----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2015/04/07 18:59:16
-- Design Name: 
-- Module Name: ControlUnit - Behavioral
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

entity ControlUnit is
    Port ( Op : in STD_LOGIC_VECTOR (5 downto 0);
           Funct : in STD_LOGIC_VECTOR (5 downto 0);
           RegWrite : out STD_LOGIC;
           MemtoReg : out STD_LOGIC;
           MemWrite : out STD_LOGIC;
           Branch : out STD_LOGIC;
           ALUControl : out STD_LOGIC_VECTOR (2 downto 0);
           ALUSrc : out STD_LOGIC;
           regdst: out std_logic;
           jr :out std_logic;
           shiftmode: out std_logic);
end ControlUnit;

architecture Behavioral of ControlUnit is

begin
   

        --instru lw with opcode "100011"
        memtoreg <= op(5) and (not op(4)) and (not op(3)) and (not op(2)) and op(1) and op(0);
        --instru sw with opcode "101011"
        memwrite <= op(5) and (not op(4)) and op(3) and (not op(2)) and op(1) and op(0);
        --only lw's regdst is "0"
        regdst <= not (op(5) or op(4) or op(3) or  op(2) or op(1) or op(0));
        --jr, sw, beq => regwrite = 0
        --regwrite <= not( (op(5) and (not op(4)) and op(3) and (not op(2)) and op(1) and op(0)) or 
                    --  ((not op(5)) and (not op(4)) and (not op(3)) and op(2) and (not op(1)) and (not op(0))) or
                       --((o'rnot (op(5) or op(4) or op(3) or op(2) or op(1) or op(0))) and (not funct(5)) and (not funct(4)) and funct(3) and (not funct(2)) and (not 
                       --funct(1)) and (not funct(0))));
        --sll or srl
        shiftmode <= '0';--not(op(31) or op(30) or op(29) or op(28) or op(27) or op(26) or op(25) or op(24) or op(23) or op(22) or op(21) or funct(4)); 
        --beq
        branch <= (not op(5)) and (not op(4)) and (not op(3)) and op(2) and (not op(1)) and (not op(0));
        --jr
        jr <= (not (op(5) or op(4) or op(3) or op(2) or op(1) or op(0))) and (not funct(5)) and (not funct(4)) and funct(3) and (not funct(2)) and (not funct(1)) and (not funct(0));
        
        --alu
        process(op, funct)
        begin
            if op = "000000" or op = "000100" then
                alusrc <= '0';
            else
                alusrc <= '1';
            end if;
            
            if op = "000000" then
              if funct = "000000" or funct = "001000" then
                regwrite <='0';
                else
                regwrite <='1';
              end if;
            elsif op = "101011" or op = "000100" then
                regwrite <='0';
            else
                regwrite <='1';
            end if;
            
            
            
            case op is
                when "000000" => alucontrol <= funct(2 downto 0);
                when "001000" => alucontrol <= "000";
                when "001100" => alucontrol <= "100";
                when "001101" => alucontrol <= "101";
                when "100011" => alucontrol <= "000";
                when "101011" => alucontrol <= "000";
                when "000100" => alucontrol <= "010";
                when "001110" => alucontrol <= "110";
                when others => alucontrol <="000";
            end case;
            
         end process;
         

end Behavioral;
