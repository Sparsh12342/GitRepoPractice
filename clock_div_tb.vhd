----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2025 02:45:15 PM
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

architecture test of clock_div_tb is
    signal clk_tb  : STD_LOGIC := '0';
    signal rst_tb  : STD_LOGIC := '0';
    signal enable_tb : STD_LOGIC := '1'; -- ✅ Initialize enable signal

    constant CLK_PERIOD : time := 8 ns; -- 125 MHz clock period

begin
    -- Instantiate the clock divider
    uut: entity work.clock_div
        port map (
            clk => clk_tb,
            reset => rst_tb,  -- ✅ Changed from 'rst' to 'reset' (must match `clock_div.vhd`)
            enable => enable_tb
        );

    -- Generate the clock
    clk_process: process
    begin
        while now < 1 ms loop  -- Simulate for 1ms
            clk_tb <= '0';
            wait for CLK_PERIOD / 2;
            clk_tb <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;
    
    -- Reset and Enable Sequence
    stim_proc: process
    begin
        rst_tb <= '1';
        wait for 100 ns;
        rst_tb <= '0';
        wait for 500 ns;  -- ✅ Wait for some time before enabling
        enable_tb <= '1'; -- ✅ Explicitly enable after reset
        wait for 1 ms;  -- Observe behavior
        wait;
    end process;
end test;
