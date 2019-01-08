
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
 
ENTITY color2graytb IS
END color2graytb;
 
ARCHITECTURE behavior OF color2graytb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT color2gray
    PORT(
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    imgColor_address0 : OUT STD_LOGIC_VECTOR (14 downto 0); -- este valor y varios mas cambian en funcion del trabajo que sean. estan puestos los mios (mispe).
    imgColor_ce0 : OUT STD_LOGIC;
    imgColor_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    imgGray_address0 : OUT STD_LOGIC_VECTOR (14 downto 0);
    imgGray_ce0 : OUT STD_LOGIC;
    imgGray_we0 : OUT STD_LOGIC;
    imgGray_d0 : OUT STD_LOGIC_VECTOR (7 downto 0); -- memoria donde voy a escribir (palabra = 1Byte)
    width : IN STD_LOGIC_VECTOR (15 downto 0);
    height : IN STD_LOGIC_VECTOR (15 downto 0) );
    END COMPONENT;
    

   --Inputs
    signal ap_clk : std_logic:='0';
    signal ap_rst : std_logic:='0';
    signal ap_start : std_logic:='0';
    signal imgColor_q0 : std_logic_vector(31 downto 0) := (others => '0');
    signal width : std_logic_vector(15 downto 0) := (others => '0');
    signal height : std_logic_vector(15 downto 0) := (others => '0');
  


 	--Outputs
   -- signal D : std_logic; -- de soda.
   signal imgGray_address0 : STD_LOGIC_VECTOR (14 downto 0);
   signal imgGray_ce0 :  STD_LOGIC;
   signal imgGray_we0 : STD_LOGIC;
   signal imgGray_d0 : STD_LOGIC_VECTOR (7 downto 0); -- memoria donde voy a escribir (palabra = 1Byte)
   signal ap_done :  STD_LOGIC;
   signal ap_idle :  STD_LOGIC;
   signal ap_ready : STD_LOGIC;
   signal imgColor_address0 : STD_LOGIC_VECTOR (14 downto 0); -- este valor y varios mas cambian en funcion del trabajo que sean. estan puestos los mios (mispe).
   signal imgColor_ce0 : STD_LOGIC;
    
    
    
    
   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: color2gray PORT MAP (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start  =>ap_start,
        ap_done  =>ap_done,
        ap_idle  =>ap_idle,
        ap_ready  =>ap_ready,
        imgColor_address0  => imgColor_address0,
        imgColor_ce0  =>imgColor_ce0,
        imgColor_q0 => imgColor_q0,
        imgGray_address0  =>imgGray_address0,
        imgGray_ce0  =>imgGray_ce0,
        imgGray_we0  =>imgGray_we0,
        imgGray_d0  =>imgGray_d0,
        width  =>width,
        height  =>height
        );

   -- Clock process definitions
   CLK_process :process
   begin
		ap_clk <= '0';
		wait for CLK_period/2;
		ap_clk <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      ap_rst<='1';
      ap_start<='0';
      
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      ap_rst<='0';
      wait for 50 ns;
      ap_start<='1';
      width<= std_logic_vector(to_unsigned(18, 16));
      height<= std_logic_vector(to_unsigned(12, 16));

      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(11111111,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(11111111,32));   
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(500,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(11111111,32));    
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(500,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(1255555,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(11255555,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(55550000,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(255555000,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(1234568,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(11111111,32));      
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(500,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(11111111,32));   
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(500,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(11111111,32));    
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(500,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(1255555,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(11255555,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(55550000,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(255555000,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(1234568,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(11111111,32));      
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(500,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(11111111,32));   
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(500,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(11111111,32));    
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(500,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(1255555,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(11255555,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(55550000,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(255555000,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(1234568,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(1234568,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(500,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(11111111,32));    
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(500,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(1255555,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(11255555,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(55550000,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(255555000,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(1234568,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(11111111,32));      
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(500,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(11111111,32));   
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(500,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(11111111,32));    
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(500,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(1255555,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(11255555,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(55550000,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(255555000,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(1234568,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(11111111,32));      
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(500,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(500,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(11111111,32));    
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(500,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(1255555,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(11255555,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(55550000,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(255555000,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(1234568,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(11111111,32));      
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(500,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(11111111,32));   
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(500,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(11111111,32));    
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(500,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(1255555,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(11255555,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(55550000,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(255555000,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(1234568,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(1234568,32));
      wait for 50 ns;
       imgColor_q0 <= std_logic_vector(to_unsigned(255555,32));
      wait for 50 ns;
      imgColor_q0 <= std_logic_vector(to_unsigned(11111111,32));
      wait;
   end process;

END;
