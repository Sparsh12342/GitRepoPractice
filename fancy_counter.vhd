----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2025 07:43:40 PM
-- Design Name: 
-- Module Name: fancy_counter - Behavioral
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

entity fancy_counter is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           clk_en : in STD_LOGIC;
           up_down : in STD_LOGIC; -- '1' for up, '0' for down
           count : out STD_LOGIC_VECTOR (3 downto 0));
end fancy_counter;

architecture Behavioral of fancy_counter is
    signal count_reg : STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin
    process (clk, rst)
    begin
        if rst = '1' then
            count_reg <= "0000";
        elsif rising_edge(clk) then
            if en = '1' and clk_en = '1' then
                if up_down = '1' then
                    count_reg <= count_reg + 1;
                else
                    count_reg <= count_reg - 1;
                end if;
            end if;
        end if;
    end process;
    count <= count_reg;
end Behavioral;
