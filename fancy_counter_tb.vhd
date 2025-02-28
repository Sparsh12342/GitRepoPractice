----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2025 07:44:44 PM
-- Design Name: 
-- Module Name: fancy_counter_tb - Behavioral
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

entity fancy_counter_tb is
end fancy_counter_tb;

architecture Behavioral of fancy_counter_tb is
    signal clk_tb : STD_LOGIC := '0';
    signal rst_tb : STD_LOGIC := '0';
    signal en_tb : STD_LOGIC := '0';
    signal clk_en_tb : STD_LOGIC := '0';
    signal up_down_tb : STD_LOGIC := '0';
    signal count_tb : STD_LOGIC_VECTOR (3 downto 0);

    constant CLK_PERIOD : time := 10 ns; -- Arbitrary clock period

    component fancy_counter
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               en : in STD_LOGIC;
               clk_en : in STD_LOGIC;
               up_down : in STD_LOGIC;
               count : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

begin
    uut: fancy_counter port map (
        clk => clk_tb,
        rst => rst_tb,
        en => en_tb,
        clk_en => clk_en_tb,
        up_down => up_down_tb,
        count => count_tb
    );

    clk_process : process
    begin
        while true loop
            clk_tb <= '0';
            wait for CLK_PERIOD / 2;
            clk_tb <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    stim_process : process
    begin
        rst_tb <= '1';
        wait for 20 ns;
        rst_tb <= '0';

        en_tb <= '1';
        clk_en_tb <= '1';
        up_down_tb <= '1';  -- Count up
        wait for 100 ns;

        up_down_tb <= '0';  -- Count down
        wait for 100 ns;

        en_tb <= '0';  -- Stop counting
        wait;
    end process;
end Behavioral;
