----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2025 08:38:28 PM
-- Design Name: 
-- Module Name: counter_top - Behavioral
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

entity counter_top is
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC;
           rst : in STD_LOGIC;
           cnt_out : out STD_LOGIC_VECTOR(3 downto 0));
end counter_top;

architecture Structural of counter_top is
    -- Signal Declarations
    signal clk_div_out : STD_LOGIC;
    signal btn_debounced : STD_LOGIC;
    signal counter_out : STD_LOGIC_VECTOR(3 downto 0);

    -- Component Declarations
    component clock_div
        Port ( clk : in STD_LOGIC;
               div_clk : out STD_LOGIC);
    end component;

    component debounce
        Port ( clk : in STD_LOGIC;
               btn : in STD_LOGIC;
               dbnc : out STD_LOGIC);
    end component;

    component fancy_counter
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               en : in STD_LOGIC;
               clk_en : in STD_LOGIC;
               updn : in STD_LOGIC;
               dir : in STD_LOGIC;
               ld : in STD_LOGIC;
               val : in STD_LOGIC_VECTOR(3 downto 0);
               cnt : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

begin
    -- Properly map the clock divider
    clk_div_inst : clock_div
        port map (
            clk => clk,
            div_clk => clk_div_out
        );

    -- Properly map the debounce module
    debounce_inst : debounce
        port map (
            clk => clk,
            btn => btn,
            dbnc => btn_debounced
        );

    -- Properly map the fancy counter
    counter_inst : fancy_counter
        port map (
            clk => clk_div_out,
            rst => rst,
            en => btn_debounced,
            clk_en => '1',
            updn => '0',
            dir => '0',
            ld => '0',
            val => "0001",
            cnt => counter_out
        );

    -- Assign output
    cnt_out <= counter_out;

end Structural;