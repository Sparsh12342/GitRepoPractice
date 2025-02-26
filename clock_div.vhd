----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2025 02:40:34 PM
-- Design Name: 
-- Module Name: clock_div - Behavioral
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

entity clock_div is
    Port (
        clk : in  STD_LOGIC;
        div : out STD_LOGIC
    );
end clock_div;

architecture Behavioral of clock_div is
    signal counter : INTEGER := 0;
    signal div_reg : STD_LOGIC := '0';
    
    constant DIVISOR : INTEGER := 62500000; -- 125 MHz / (2 * 2 Hz)

begin
    process (clk)
    begin
        if rising_edge(clk) then
            if counter = DIVISOR - 1 then
                counter <= 0;
                div_reg <= NOT div_reg; -- Toggle output every cycle
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    div <= div_reg;

end Behavioral;
