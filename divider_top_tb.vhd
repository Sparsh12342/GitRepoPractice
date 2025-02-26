----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2025 02:57:50 PM
-- Design Name: 
-- Module Name: divider_top_tb - Behavioral
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

entity tb_divider_top is
end tb_divider_top;

architecture behavior of tb_divider_top is
    signal clk : STD_LOGIC := '0';
    signal rst : STD_LOGIC := '0';
    signal led : STD_LOGIC;

    -- Instantiate DUT (Device Under Test)
    component divider_top
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               led : out STD_LOGIC);
    end component;

begin
    -- Instantiate divider_top
    uut: divider_top port map(clk => clk, rst => rst, led => led);

    -- Generate Clock (125 MHz)
    clk_process: process
    begin
        while now < 20 ms loop
            clk <= '0';
            wait for 4 ns; -- 8 ns period (125 MHz)
            clk <= '1';
            wait for 4 ns;
        end loop;
        wait;
    end process;

    -- Simulation Process
    stimulus_process: process
    begin
        rst <= '1';
        wait for 10 ns;
        rst <= '0';

        -- Run for sufficient time
        wait for 1 sec;
        wait;
    end process;
end behavior;
