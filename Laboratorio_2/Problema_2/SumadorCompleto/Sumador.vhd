library IEEE;
	use ieee.std_logic_1164.all;
entity Sumador is
	generic
	(
		m: natural := 4
	);
	port
	(
		A,B : in std_logic_vector(m-1 downto 0);
		
		Cout  : out std_logic;
		Resul : out std_logic_vector(m-1 downto 0)
	);
end Sumador;
architecture concurrente of Sumador is
	signal c: std_logic_vector(m-1 downto 0) := (others => '0');
begin
	c(0) <= A(0) and B(0);
	Resul(0) <= A(0) xor B(0);
	sumador:
	for i in 1 to m-1 generate
		c(i) <= (A(i) and B(i)) or (A(i) and c(i-1)) or (B(i) and c(i-1));
		Resul(i) <= c(i-1) xor A(i) xor B(i);
	end generate;
	Cout <= c(m-1);
end concurrente;