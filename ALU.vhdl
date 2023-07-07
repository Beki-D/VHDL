----------------------------------------------------------------------------------
-- Company: MILITEC
-- Engineer: Beki D. Abate
-- 
-- Create Date:    19:59:03 06/29/2023 
-- Design Name:    8-bit alu
-- Module Name:    alu - Behavioral
-- Description: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
    port (
        a, b : in std_logic_vector(7 downto 0);
        opcode : in std_logic_vector(2 downto 0);
        result : out std_logic_vector(7 downto 0);
        zero : out std_logic
    );
end alu;

architecture Behavioral of alu is
    signal temp : std_logic_vector(7 downto 0);
begin
    process(a, b, opcode, temp)
    begin
        case opcode is
            when "000" =>
                temp <= std_logic_vector(unsigned(a) + unsigned(b));
            
            when "001" =>
                temp <= std_logic_vector(unsigned(a) - unsigned(b));
            
            when "010" =>
                temp <= a and b;
            
            when "011" =>
                temp <= a or b;
            
            when "100" =>
                temp <= a xor b;
            
            when others =>
                temp <= (others => '0');
        end case;
        
        result <= temp;
        
        if temp = std_logic_vector(to_unsigned(0, temp'length)) then
            zero <= '1';
        else
            zero <= '0';
        end if;
    end process;
end Behavioral;
