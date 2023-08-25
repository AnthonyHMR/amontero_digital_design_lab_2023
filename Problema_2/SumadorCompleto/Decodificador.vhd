library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Decodificador is
    Port (
        BinInput : in std_logic_vector(3 downto 0);
        SevenSegOutput : out std_logic_vector(6 downto 0)
    );
end Decodificador;

architecture Behavioral of Decodificador is
begin
    process(BinInput)
    begin
        case BinInput is
            when "0000" => SevenSegOutput <= "1000000"; -- 0
            when "0001" => SevenSegOutput <= "1111001"; -- 1
            when "0010" => SevenSegOutput <= "0100100"; -- 2
            when "0011" => SevenSegOutput <= "0110000"; -- 3
            when "0100" => SevenSegOutput <= "0011001"; -- 4
            when "0101" => SevenSegOutput <= "0010010"; -- 5
            when "0110" => SevenSegOutput <= "0000010"; -- 6
            when "0111" => SevenSegOutput <= "1111000"; -- 7
            when "1000" => SevenSegOutput <= "0000000"; -- 8
            when "1001" => SevenSegOutput <= "0010000"; -- 9
				when "1010" => SevenSegOutput <= "0001000"; -- A
				when "1011" => SevenSegOutput <= "0000011"; -- b
				when "1100" => SevenSegOutput <= "1000110"; -- C
				when "1101" => SevenSegOutput <= "0100001"; -- d
				when "1110" => SevenSegOutput <= "0000110"; -- E
            when others => SevenSegOutput <= "0001110"; -- F
        end case;
    end process;
end Behavioral;