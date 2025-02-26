----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2025 02:55:45 PM
-- Design Name: 
-- Module Name: divider_top - Behavioral
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

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY divider_top IS
    PORT (
        clk  : IN  STD_LOGIC;   -- 125 MHz input clock
        rst  : IN  STD_LOGIC;   -- Reset signal
        led0 : OUT STD_LOGIC    -- LED output
    );
END ENTITY divider_top;

ARCHITECTURE Behavioral OF divider_top IS
    SIGNAL div_signal : STD_LOGIC; -- Clock divider output
    SIGNAL led_state  : STD_LOGIC := '0'; -- LED state

    -- Component Declaration for clock_div
    COMPONENT clock_div
        PORT (
            clk  : IN  STD_LOGIC;
            rst  : IN  STD_LOGIC;
            div  : OUT STD_LOGIC
        );
    END COMPONENT;

BEGIN
    -- Instantiate clock_div
    clk_div_inst: clock_div
        PORT MAP (
            clk  => clk,
            rst  => rst,
            div  => div_signal
        );

    -- LED Toggle Process
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF div_signal = '1' THEN
                led_state <= NOT led_state;  -- Toggle LED
            END IF;
        END IF;
    END PROCESS;

    led0 <= led_state; -- Assign to LED output

END ARCHITECTURE Behavioral;
