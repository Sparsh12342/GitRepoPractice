----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2025 07:10:07 PM
-- Design Name: 
-- Module Name: clk_div - Behavioral
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

entity clock_div is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           div : out STD_LOGIC);
end clock_div;

architecture Behavioral of clock_div is
    constant DIVISOR : integer := 125_000_000 / 2;  -- Divide by 62,500,000 to get 2 Hz
    signal counter : integer := 0;
    signal clk_out : STD_LOGIC := '0';
begin
    process (clk, rst)
    begin
        if rst = '1' then
            counter <= 0;
            clk_out <= '0';
        elsif rising_edge(clk) then
            if counter = DIVISOR - 1 then
                counter <= 0;
                clk_out <= not clk_out;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    div <= clk_out;
end Behavioral;

