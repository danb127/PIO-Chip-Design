library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Project2 is
    Port (
        CLK : in std_logic;
        RESET : in std_logic;
        CE : in std_logic; 
        RD : in std_logic;
        WR : in std_logic;
        A0 : in std_logic;
        A1 : in std_logic;
        STB : in std_logic;
        IBF : in std_logic;
        D : inout std_logic_vector(7 downto 0)
        
        
    );
end Project2;

architecture Behavioral of Project2 is


signal P : std_logic_vector(7 downto 0);
signal Data_Out : std_logic_vector(7 downto 0);
signal Control_Reg : std_logic_vector(1 downto 0);
signal Status_Reg : std_logic_vector(2 downto 0);
signal OBF : std_logic;
signal ACK : std_logic;
signal INTR : std_logic;


begin

-- RESET Process--

process(RESET)
begin
    if RESET = '1' then
        Data_Out <= (others => '0');
        Control_Reg <= (others => '0');
        Status_Reg <= (others => '0');
        INTR <= '0';
    end if;
end process;

process(CE)
begin
    if CE = '0' then
        if WR = '0' and A0 = '0' then
            Data_Out <= D;
        
        elsif WR = '0' and A0 = '1' then
            Control_reg <= D(1 downto 0);
        
        elsif RD = '0' and A0 = '1' then
            D <= Status_Reg;
        end if;
    end if;
    
    -- Update Status Register
    Status_Reg(0) <= not OBF; -- OBF* (active low)
    Status_Reg(1) <= Control_Reg(1); -- INTE bit
    Status_Reg(2) <= INTR; -- INTR bit

    -- Handle INTR signal based on INTE bit
    if Control_Reg(1) = '1' then
        INTR <= '1'; -- Enable interrupt
    else
        INTR <= '0'; -- Disable interrupt
    end if;
        
end process;
end Behavioral;
