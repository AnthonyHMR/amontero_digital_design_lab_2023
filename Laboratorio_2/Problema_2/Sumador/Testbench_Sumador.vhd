library IEEE;
use ieee.std_logic_1164.all;

entity Testbench_Sumador is
end Testbench_Sumador;

architecture behavior of Testbench_Sumador is

    component Sumador
        generic (
            m: natural := 4
        );
        port (
            A, B : in std_logic_vector(m-1 downto 0);
            Cout : out std_logic;
            Resul : out std_logic_vector(m-1 downto 0)
        );
    end component;
	 
	 signal A_tb, B_tb : std_logic_vector(3 downto 0);
    signal Cout_tb : std_logic;
    signal Resul_tb : std_logic_vector(3 downto 0);

begin

    uut : entity work.Sumador
        generic map (
            m => 4
        )
        port map (
            A => A_tb,
            B => B_tb,
            Cout => Cout_tb,
            Resul => Resul_tb
        );

    process
    begin
        wait for 10 ns;
        A_tb <= "1100";
        B_tb <= "0101";
        wait for 10 ns;
        A_tb <= "1010";
        B_tb <= "1001";
        wait for 10 ns;
		  A_tb <= "0100";
        B_tb <= "0010";
        wait for 10 ns;
		  A_tb <= "0110";
        B_tb <= "0001";
        wait for 10 ns;
		  
		  wait;
    end process;

end behavior;