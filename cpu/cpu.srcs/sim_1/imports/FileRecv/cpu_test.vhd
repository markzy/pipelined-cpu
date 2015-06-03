--VHDL Test Bench Created for module mod_sub
LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY cpu_test IS
END cpu_test;
ARCHITECTURE behavior OF cpu_test IS

	COMPONENT cpu
	PORT(
		clk: in std_logic
	);
	END COMPONENT;

	--input
	signal clk : std_logic:='0';
	--output

	--clk_definition
	constant clk_period : time := 40 ns;


	BEGIN

	uut: cpu PORT MAP (clk);


	stim_process :process
	begin
		wait for clk_period/2;
		clk <= not clk;
	end process;

end behavior;