----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2025 07:34:45 PM
-- Design Name: 
-- Module Name: debounce - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity debounce is
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC;
           dbnc : out STD_LOGIC);
end debounce;

architecture Behavioral of debounce is
    constant DEBOUNCE_TIME : integer := 2_500_000; -- 20ms debounce at 125 MHz
    signal counter : integer := 0;
    signal btn_stable : STD_LOGIC := '0';
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if btn = '1' then
                if counter < DEBOUNCE_TIME then
                    counter <= counter + 1;
                else
                    btn_stable <= '1';
                end if;
            else
                counter <= 0;
                btn_stable <= '0';
            end if;
        end if;
    end process;
    dbnc <= btn_stable;
end Behavioral;
