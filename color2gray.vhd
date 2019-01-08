library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity color2gray is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    imgColor_address0 : OUT STD_LOGIC_VECTOR (14 downto 0);
    imgColor_ce0 : OUT STD_LOGIC;
    imgColor_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    imgGray_address0 : OUT STD_LOGIC_VECTOR (14 downto 0);
    imgGray_ce0 : OUT STD_LOGIC;
    imgGray_we0 : OUT STD_LOGIC;
    imgGray_d0 : OUT STD_LOGIC_VECTOR (7 downto 0); 
    width : IN STD_LOGIC_VECTOR (15 downto 0);
    height : IN STD_LOGIC_VECTOR (15 downto 0) );
end color2gray;

architecture behav of color2gray is 

signal r: std_logic_vector(7 downto 0);
signal g: std_logic_vector(7 downto 0);
signal b: std_logic_vector(7 downto 0);
signal aux1: std_logic_vector(15 downto 0);
signal aux2: std_logic_vector(15 downto 0);
signal aux3: std_logic_vector(15 downto 0);
signal aux4: std_logic_vector(15 downto 0);
signal aux5: std_logic_vector(15 downto 0);
signal Gray: unsigned(7 downto 0);
signal cont: std_logic_vector(14 downto 0);
signal size: std_logic_vector(31 downto 0); 

begin

main_synch_process: process(ap_clk,ap_rst)
type state_type is (init, read,Y1,Y2,Y3,Y4,write, endd); 
variable state: state_type;

begin
    if (ap_rst='1') then     
        r<=(others=>'0');
        b<=(others=>'0');
        g<=(others=>'0');
        Gray<=(others=>'0');
        aux1<=(others=>'0');  
        aux2<=(others=>'0');  
        aux3<=(others=>'0');  
        aux4<=(others=>'0');  
        aux5<=(others=>'0');  
        cont <=(others=>'0');
        size <=(others=>'0');
        ap_idle <='0';
        ap_done <='0';
        ap_ready <='0';
                  
    	state:= init; 
        
    elsif (ap_clk='1' and ap_clk'EVENT) then
        case state is
            when init =>
                r<=(others=>'0');
                b<=(others=>'0');
                g<=(others=>'0');
                Gray<=(others=>'0');     
                aux1<=(others=>'0');
                aux2<=(others=>'0');  
                aux3<=(others=>'0');  
                aux4<=(others=>'0');  
                aux5<=(others=>'0');
                size <=(others=>'0');  
                cont <=(others=>'0');
                ap_idle <='0';
                ap_done <='0';
                ap_ready <='0';
                if (ap_start='1') then
                    size<= std_logic_vector(unsigned(width)*unsigned(height));
                    state:=read;
                
                else
                    state:=init;
                end if;
                
            when read =>             
                imgColor_address0<=std_logic_vector(cont); 
                imgColor_ce0<='1';
		r<=imgColor_q0(31 downto 24);        
		g<= imgColor_q0(23 downto 16);
	 	b<= imgColor_q0(15 downto 8);
                              
                state:=Y1;
          
            when Y1 =>
                aux1 <= std_logic_vector(unsigned(r)*67);
                aux2 <= std_logic_vector(unsigned(g)*174);
                aux3 <= std_logic_vector(unsigned(b)*15); 
                state:=Y2;
                
            when Y2 =>
                aux4 <= std_logic_vector(unsigned(aux1)+unsigned(aux2));
                state:=Y3;
            when Y3 =>
                aux5 <= std_logic_vector(unsigned(aux4)+unsigned(aux3));
                state:=Y4;

            when Y4 =>               
                Gray <= aux5/256;
                state:=write;
            
            when write =>
                imgGray_ce0<='1'; 
                imgGray_we0<='1'; 
                imgGray_address0<=std_logic_vector(cont); 
                imgGray_d0<=std_logic_vector(Gray);
                if(unsigned(cont)<unsigned(size)-1) then
                    cont<=std_logic_vector(unsigned(cont)+1);
                    state:=read;
                 else
                    state:= endd;
                end if;
                
            when endd =>
            ap_done<='1';
            ap_ready<='1';
            state:=init; 
       end case;
    end if; 
  
   end process;
end behav;  
