----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2025 07:18:35 PM
-- Design Name: 
-- Module Name: clock_div_tb - Behavioral
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

entity clock_div_tb is
end clock_div_tb;

architecture Behavioral of clock_div_tb is
    signal clk_tb : STD_LOGIC := '0';
    signal rst_tb : STD_LOGIC := '0';
    signal div_tb : STD_LOGIC;

    constant CLK_PERIOD : time := 8 ns; -- 125 MHz clock (1/125M = 8 ns)

    component clock_div
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               div : out STD_LOGIC);
    end component;

begin
    uut: clock_div port map (
        clk => clk_tb,
        rst => rst_tb,
        div => div_tb
    );

    -- Clock process
    clk_process : process
    begin
        while true loop
            clk_tb <= '0';
            wait for CLK_PERIOD / 2;
            clk_tb <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    -- Reset process
    rst_process : process
    begin
        rst_tb <= '1';
        wait for 50 ns;
        rst_tb <= '0';
        wait;
    end process;
end Behavioral;
