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
    signal hex_output : std_logic_vector(3 downto 0);
begin
    process(BinInput)
    begin
        case BinInput is
            when "0000" => hex_output <= "0000"; -- 0
            when "0001" => hex_output <= "0001"; -- 1
            when "0010" => hex_output <= "0010"; -- 2
            when "0011" => hex_output <= "0011"; -- 3
            when "0100" => hex_output <= "0100"; -- 4
            when "0101" => hex_output <= "0101"; -- 5
            when "0110" => hex_output <= "0110"; -- 6
            when "0111" => hex_output <= "0111"; -- 7
            when "1000" => hex_output <= "1000"; -- 8
            when "1001" => hex_output <= "1001"; -- 9
				when "1010" => hex_output <= "1010"; -- A
            when "1011" => hex_output <= "1011"; -- b
            when "1100" => hex_output <= "1100"; -- C
            when "1101" => hex_output <= "1101"; -- d
            when "1110" => hex_output <= "1110"; -- E
            when others => hex_output <= "1111"; -- F
        end case;
    end process;

    -- Convertir la salida hexadecimal a señales de 7 segmentos
    SevenSegDecoder: process(hex_output)
    begin
        case hex_output is
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