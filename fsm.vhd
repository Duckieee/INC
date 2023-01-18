-- fsm.vhd: Finite State Machine
-- Author: Katerina Cibulcova (xcibul12)
-- INC projekt - Pristupovy terminal
-- xcibul12 : kod1 = 4788400058, kod2 = 478565002

library ieee;
use ieee.std_logic_1164.all;
-- ----------------------------------------------------------------------------
--                        Entity declaration
-- ----------------------------------------------------------------------------
entity fsm is
port(
   CLK         : in  std_logic;
   RESET       : in  std_logic;

   -- Input signals
   KEY         : in  std_logic_vector(15 downto 0);
   CNT_OF      : in  std_logic;

   -- Output signals
   FSM_CNT_CE  : out std_logic;
   FSM_MX_MEM  : out std_logic;
   FSM_MX_LCD  : out std_logic;
   FSM_LCD_WR  : out std_logic;
   FSM_LCD_CLR : out std_logic
);
end entity fsm;

-- ----------------------------------------------------------------------------
--                      Architecture declaration
-- ----------------------------------------------------------------------------
architecture behavioral of fsm is
   type t_state is (START, TEST1, TEST2, TEST3, TEST4, TEST5a, TEST5b, TEST6a,
   TEST6b, TEST7a, TEST7b, TEST8a, TEST8b, TEST9a, TEST9b, TEST10a, TEST10b, TEST11, PRINT_MESSAGE_OK, PRINT_MESSAGE_ERROR, FINISH_ERROR, FINISH);
   signal present_state, next_state : t_state;

begin
-- -------------------------------------------------------
sync_logic : process(RESET, CLK)
begin
   if (RESET = '1') then
      present_state <= START;
   elsif (CLK'event AND CLK = '1') then
      present_state <= next_state;
   end if;
end process sync_logic;

-- -------------------------------------------------------
next_state_logic : process(present_state, KEY, CNT_OF)
begin
   case (present_state) is
   -- - - - - - - - - - - - - - - - - - - - - - -
   
when START =>
next_state <= TEST1;
   -- - - - - - - - - - - - - - - - - - - - - - -

when TEST1 =>
      next_state <= TEST1;
      if (KEY(4) = '1') then
         next_state <= TEST2;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FINISH_ERROR; 
      elsif(KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_ERROR;
end if;

   -- - - - - - - - - - - - - - - - - - - - - - -

when TEST2 =>
      next_state <= TEST2;
      if (KEY(7) = '1') then
         next_state <= TEST3;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FINISH_ERROR; 
      elsif(KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_ERROR;
end if;

   -- - - - - - - - - - - - - - - - - - - - - - -

when TEST3 =>
      next_state <= TEST3;
      if (KEY(8) = '1') then
         next_state <= TEST4;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FINISH_ERROR; 
      elsif(KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_ERROR;
end if;

   -- - - - - - - - - - - - - - - - - - - - - - -

when TEST4 =>
      next_state <= TEST4;
      if (KEY(8) = '1') then
         next_state <= TEST5a;
      elsif (KEY(5) = '1') then
         next_state <= TEST5b;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FINISH_ERROR;
      elsif(KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_ERROR; 
end if;

   -- - - - - - - - - - - - - - - - - - - - - - -

when TEST5a =>
      next_state <= TEST5a;
      if (KEY(4) = '1') then
         next_state <= TEST6a;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FINISH_ERROR; 
      elsif(KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_ERROR;
end if;

   -- - - - - - - - - - - - - - - - - - - - - - -

when TEST5b =>
      next_state <= TEST5b;
      if (KEY(6) = '1') then
         next_state <= TEST6b;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FINISH_ERROR; 
      elsif(KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_ERROR;
end if;

   -- - - - - - - - - - - - - - - - - - - - - - -

when TEST6a =>
      next_state <= TEST6a;
      if (KEY(0) = '1') then
         next_state <= TEST7a;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FINISH_ERROR; 
      elsif(KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_ERROR;
end if;

   -- - - - - - - - - - - - - - - - - - - - - - -

when TEST6b =>
      next_state <= TEST6b;
      if (KEY(5) = '1') then
         next_state <= TEST7b;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FINISH_ERROR; 
      elsif(KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_ERROR;
end if;

   -- - - - - - - - - - - - - - - - - - - - - - -

when TEST7a =>
      next_state <= TEST7a;
      if (KEY(0) = '1') then
         next_state <= TEST8a;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FINISH_ERROR; 
      elsif(KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_ERROR;
end if;

   -- - - - - - - - - - - - - - - - - - - - - - -

when TEST7b =>
      next_state <= TEST7b;
      if (KEY(0) = '1') then
         next_state <= TEST8b;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FINISH_ERROR; 
      elsif(KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_ERROR;
end if;

   -- - - - - - - - - - - - - - - - - - - - - - -

when TEST8a =>
      next_state <= TEST8a;
      if (KEY(0) = '1') then
         next_state <= TEST9a;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FINISH_ERROR; 
      elsif(KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_ERROR;
end if;

   -- - - - - - - - - - - - - - - - - - - - - - -

when TEST8b =>
      next_state <= TEST8b;
      if (KEY(0) = '1') then
         next_state <= TEST9b;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FINISH_ERROR; 
      elsif(KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_ERROR;
end if;

   -- - - - - - - - - - - - - - - - - - - - - - -

when TEST9a =>
      next_state <= TEST9a;
      if (KEY(5) = '1') then
         next_state <= TEST10a;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FINISH_ERROR; 
      elsif(KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_ERROR;
end if;

   -- - - - - - - - - - - - - - - - - - - - - - -

when TEST9b =>
      next_state <= TEST9b;
      if (KEY(2) = '1') then
         next_state <= TEST10b;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FINISH_ERROR; 
      elsif(KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_ERROR;
end if;

   -- - - - - - - - - - - - - - - - - - - - - - -

when TEST10a =>
      next_state <= TEST10a;
      if (KEY(8) = '1') then
         next_state <= TEST11;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FINISH_ERROR; 
      elsif(KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_ERROR;
end if;

   -- - - - - - - - - - - - - - - - - - - - - - -

when TEST10b =>
      next_state <= TEST10b;
      if (KEY(2) = '1') then
         next_state <= TEST11;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FINISH_ERROR; 
      elsif(KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_ERROR;
end if;

   -- - - - - - - - - - - - - - - - - - - - - - -

when TEST11 =>
      next_state <= TEST11;
      if (KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_OK;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= FINISH_ERROR; 
end if;

   -- - - - - - - - - - - - - - - - - - - - - - -

when PRINT_MESSAGE_ERROR =>
      next_state <= PRINT_MESSAGE_ERROR;
      if (CNT_OF = '1') then
         next_state <= FINISH;
end if;

   -- - - - - - - - - - - - - - - - - - - - - - -

when PRINT_MESSAGE_OK =>
      next_state <= PRINT_MESSAGE_OK;
      if (CNT_OF = '1') then
         next_state <= FINISH;
end if;

   -- - - - - - - - - - - - - - - - - - - - - - -

when FINISH_ERROR =>
      next_state <= FINISH_ERROR;
      if (KEY(15) = '1') then
         next_state <= PRINT_MESSAGE_ERROR; 
      end if;
      
   -- - - - - - - - - - - - - - - - - - - - - - -

when FINISH =>
      next_state <= FINISH;
      if (KEY(15) = '1') then
         next_state <= TEST1; 
      end if;

   -- - - - - - - - - - - - - - - - - - - - - - -
when others =>
      next_state <= START;
   end case;

end process next_state_logic;

-- -------------------------------------------------------
output_logic : process(present_state, KEY)
begin
   FSM_CNT_CE     <= '0';
   FSM_MX_MEM     <= '0';
   FSM_MX_LCD     <= '0';
   FSM_LCD_WR     <= '0';
   FSM_LCD_CLR    <= '0';

   case (present_state) is
   -- - - - - - - - - - - - - - - - - - - - - - -
when PRINT_MESSAGE_OK =>
      FSM_CNT_CE     <= '1';
      FSM_MX_LCD     <= '1';
      FSM_LCD_WR     <= '1';
      FSM_MX_MEM     <= '1';
   -- - - - - - - - - - - - - - - - - - - - - - - 
when PRINT_MESSAGE_ERROR =>
      FSM_CNT_CE     <= '1';
      FSM_MX_LCD     <= '1';
      FSM_LCD_WR     <= '1';

   -- - - - - - - - - - - - - - - - - - - - - - -
when FINISH =>
      if (KEY(15) = '1') then
         FSM_LCD_CLR    <= '1';
end if;

   -- - - - - - - - - - - - - - - - - - - - - - -

when others =>
      if (KEY(14 downto 0) /= "000000000000000") then
         FSM_LCD_WR     <= '1';
      elsif (KEY(15) = '1') then
         FSM_LCD_CLR    <= '1';
      end if; 

   -- - - - - - - - - - - - - - - - - - - - - - -
   end case;
end process output_logic;

end architecture behavioral;

