library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

-- Implement a VIC emulation that sniffs all relevant
-- input/output pins of the VIC and emulates the internal 
-- behaviour of the VIC to finally create a YPbPr signal.
-- Output is generated at every falling edge of the CLK

entity VIC2Emulation is	
	port (
		-- standard definition color output
		COLOR: out std_logic_vector(3 downto 0);
		CSYNC: out std_logic;
		
		-- synchronous clock of 16 times the c64 clock cycle
		CLK         : in std_logic;
		
		-- Connections to the real GTIAs pins 
		PHI0        : in std_logic;
		DB          : in std_logic_vector(11 downto 0);
		A           : in std_logic_vector(5 downto 0);
		RW          : in std_logic; 
		CS          : in std_logic; 
		AEC         : in std_logic;
		
		-- selector to choose PAL(=1) or NTSC(=0) variant
		PAL         : in std_logic
	);	
end entity;


architecture immediate of VIC2Emulation is
	-- video matrix RAM
	signal matrixdata     : std_logic_vector(11 downto 0);
	signal matrixraddress : std_logic_vector (5 downto 0);
	signal matrixwaddress : std_logic_vector (5 downto 0);
	signal matrixq        : std_logic_vector (11 downto 0);

	component ram_dual is
	generic
	(
		data_width : integer := 8;
		addr_width : integer := 16
	); 
	port 
	(
		data	: in std_logic_vector(data_width-1 downto 0);
		raddr	: in std_logic_vector(addr_width-1 downto 0);
		waddr	: in std_logic_vector(addr_width-1 downto 0);
		we		: in std_logic := '1';
		rclk	: in std_logic;
		wclk	: in std_logic;
		q		: out std_logic_vector(data_width-1 downto 0)
	);	
	end component;

	
begin
	videomatrix: ram_dual generic map(data_width => 12, addr_width => 6)
		port map (
			matrixdata, 
			matrixraddress,
			matrixwaddress,
			'1',
			CLK,
			CLK,
			matrixq	
		);

	-- main signal processing and video logic
	process (CLK) 
	
	-- registers of the VIC and their default values
  	type T_spritex is array (0 to 7) of std_logic_vector(8 downto 0);
	variable spritex : T_spritex := 
	( "000000000","000000000","000000000","000000000","000000000","000000000","000000000","000000000");	
	variable ECM:              std_logic := '0';
	variable BMM:              std_logic := '0';
	variable MCM:              std_logic := '0';
	variable DEN:              std_logic := '1';
	variable RSEL:             std_logic := '1';
	variable CSEL:             std_logic := '1';
	variable SPRITEACTIVE:     std_logic_vector(7 downto 0) := "00000000";
	variable XSCROLL:          std_logic_vector(2 downto 0) := "000";
	variable YSCROLL:          std_logic_vector(2 downto 0) := "011";
	variable spritepriority:   std_logic_vector(7 downto 0) := "00000000";
	variable spritemulticolor: std_logic_vector(7 downto 0) := "00000000";
	variable doublewidth:      std_logic_vector(7 downto 0) := "00000000";
	variable bordercolor:      std_logic_vector(3 downto 0) := "0000"; -- "1110"; --
	variable backgroundcolor0: std_logic_vector(3 downto 0) := "0000"; -- "0110"; --
	variable backgroundcolor1: std_logic_vector(3 downto 0) := "0001"; --
	variable backgroundcolor2: std_logic_vector(3 downto 0) := "0010"; --
	variable backgroundcolor3: std_logic_vector(3 downto 0) := "0011"; --
	variable spritemulticolor0:std_logic_vector(3 downto 0) := "0100"; --
	variable spritemulticolor1:std_logic_vector(3 downto 0) := "0000";
	type T_spritecolor is array (0 to 7) of std_logic_vector(3 downto 0);
	variable spritecolor: T_spritecolor := ( "0000", "0000", "0000", "0000", "0000", "0000", "0000", "0000" );
	
	-- registering the input lines
	variable in_phi0: std_logic; 
	variable in_db: std_logic_vector(11 downto 0);
	variable in_a:  std_logic_vector(5 downto 0);
	variable in2_a:  std_logic_vector(5 downto 0);
	variable in_rw: std_logic; 
	variable in_cs: std_logic; 
	variable in_aec: std_logic; 
	
	-- memory requests to write into registers
	variable register_writeaddress : std_logic_vector(5 downto 0);
	variable register_writeaddress2 : std_logic_vector(5 downto 0);
	variable register_writedata : std_logic_vector(7 downto 0);
	variable register_writedata2 : std_logic_vector(7 downto 0);
	
	-- variables for synchronious operation
	variable displayline: integer range 0 to 511 := 0; -- VIC-II line numbering
	variable cycle : integer range 0 to 127 := 1;      -- cpu cycle in line
	variable phase: integer range 0 to 15 := 0;        -- phase inside of the cycle
	variable xcoordinate : integer range 0 to 511;     -- x-position in sprite coordinates
	variable spritecycle : integer range 0 to 31;      -- cycle in the sprite dma sequence 

	variable displayactive : boolean := false;
	variable badline : boolean;	
	variable lineactive : boolean := false;
	variable prev_idlestate : boolean := false;
	variable idlestate : boolean := false;
	variable RC : integer range 0 to 7 := 0;
	variable matrixdmacursor : integer range 0 to 63;
	variable pixelfetcher : std_logic_vector(7 downto 0);
	variable pixelfetcher2 : std_logic_vector(7 downto 0);
	variable pixelpattern : std_logic_vector(13 downto 0);
	variable pixelpattern1 : std_logic_vector(13 downto 0);
	variable pixelpattern2 : std_logic_vector(13 downto 0);
	variable matrixaddr0 : std_logic_vector(5 downto 0);
	variable matrixaddr1 : std_logic_vector(5 downto 0);
	variable matrixaddr2 : std_logic_vector(5 downto 0);
	variable matrixaddr3 : std_logic_vector(5 downto 0);
	variable matrixaddr4 : std_logic_vector(5 downto 0);
	variable matrixaddr5 : std_logic_vector(5 downto 0);
	variable mainborderflipflop : std_logic := '0';
	variable verticalborderflipflop : std_logic := '0';
	
	variable spritedmaactive : boolean;
	variable spriteactive_buffer : std_logic_vector(7 downto 0);
	variable firstspritereadaddress : std_logic_vector(1 downto 0);	
	variable spritedatabyte0 : std_logic_vector(7 downto 0);
	variable spritedatabyte1 : std_logic_vector(7 downto 0);
	type T_spritedata is array (0 to 7) of std_logic_vector(23 downto 0);
	variable spritedata : T_spritedata;
	variable spriteready : std_logic_vector(7 downto 0);
	variable spriterendering : std_logic_vector(7 downto 0);
	variable spriteexpansion : std_logic_vector(7 downto 0);
	type T_spritecursor is array (0 to 7) of integer range 0 to 31;
	variable spritecursor : T_spritecursor;
	

   -- synchronizing the screen by detecing the DRAM refresh pattern	
	variable syncdetect_ok : boolean := false;
	variable syncdetect_cycle : integer range 0 to 127 := 0;
	variable ramrefreshpattern : std_logic_vector(9 downto 0) := "0000000000";
		
	-- registered output 
	variable out_color  : std_logic_vector(3 downto 0) := "0000";
	variable out_csync : std_logic := '0';

	-- temporary stuff
	variable hcounter : integer range 0 to 1023;      -- pixel in current scan line
	variable vcounter : integer range 0 to 1023;      -- current scan line 
	variable tmp_isforeground : boolean;
	variable tmp_spritevisible : boolean;
	variable tmp_spriteforeground : boolean;
	variable tmp_spritecolor : std_logic_vector(3 downto 0);
	variable tmp_ypbpr : std_logic_vector(14 downto 0);
	variable tmp_bit : std_logic;
	variable tmp_2bit : std_logic_vector(1 downto 0);
	variable tmp_3bit : std_logic_vector(2 downto 0);
	variable tmp_8bit1 : std_logic_vector(7 downto 0);
	variable tmp_8bit2 : std_logic_vector(7 downto 0);
	variable tmp_half : integer range 250 to 280;

	begin
		-- synchronous logic -------------------
		if rising_edge(CLK) then	
		
			-- generate pixel output
			if (phase mod 2) = 0 then   
			
				-- output defaults to background (no csync active)
				out_csync := '1';
				out_color :=  backgroundcolor0;
				tmp_isforeground := false;
				
				-- extract relevant bit or 2 bits from bitmap data
				tmp_bit := pixelpattern(13);
				tmp_2bit(0) := pixelpattern2(13);
				tmp_2bit(1) := pixelpattern1(13);
				
				-- set color depending on graphics/text mode
				tmp_3bit(2) := ECM;
				tmp_3bit(1) := BMM;
				tmp_3bit(0) := MCM;
				case tmp_3bit is  
				when "000" =>   -- standard text mode
					if tmp_bit='1' then
						out_color := matrixq(11 downto 8);
						tmp_isforeground := true;
					end if;
				when "001" =>   -- multicolor text mode
					if matrixq(11)='0' then
						if tmp_bit='1' then
							out_color := "0" & matrixq(10 downto 8);
							tmp_isforeground := true;
						end if;
					else
						case tmp_2bit is
						when "00" => out_color := backgroundcolor0;
						when "01" => out_color := backgroundcolor1;
						when "10" => out_color := backgroundcolor2;
										 tmp_isforeground := true;
						when "11" => out_color := "0" & matrixq(10 downto 8);
										 tmp_isforeground := true;
						end case;
					end if;
				when "010" =>  -- standard bitmap mode
					if tmp_bit='0' then
						out_color := matrixq(3 downto 0);
					else
						out_color := matrixq(7 downto 4);
						tmp_isforeground := true;
					end if;
				when "011" =>  -- multicolor bitmap mode
					case tmp_2bit is
					when "00" => out_color := backgroundcolor0;
					when "01" => out_color := matrixq(7 downto 4);
					when "10" => out_color := matrixq(3 downto 0);
									 tmp_isforeground := true;
					when "11" => out_color := matrixq(11 downto 8);
									 tmp_isforeground := true;
					end case;
				when "100" =>  -- ECM text mode
					if tmp_bit='1' then
						out_color := matrixq(11 downto 8);
						tmp_isforeground := true;
					else
						case matrixq(7 downto 6) is
						when "00" => out_color := backgroundcolor0;
						when "01" => out_color := backgroundcolor1;
						when "10" => out_color := backgroundcolor2;
						when "11" => out_color := backgroundcolor3;
						end case;								
					end if;
				when "101" =>  -- Invalid text mode
					out_color := "0000";
					if matrixq(11)='0' then
						if tmp_bit='1' then
							tmp_isforeground := true;
						end if;
					else
						if tmp_2bit="10" or tmp_2bit="11" then	
							tmp_isforeground := true;
						end if;
					end if;							
				when "110" =>  -- Invalid bitmap mode 1
					out_color := "0000";
					if tmp_bit='1' then
						tmp_isforeground := true;
					end if;
				when "111" =>  -- Invalid bitmap mode 2
					out_color := "0000";
					if tmp_2bit="10" or tmp_2bit="11" then
						tmp_isforeground := true;
					end if;
				end case;						

				-- compute the sprite color and decide if there is now a sprite in foreground
				tmp_spritevisible := false;
				tmp_spriteforeground := false;
				for SP in 7 downto 0 loop
					if spriterendering(SP)='1' then
						if spritemulticolor(SP)='1' then								
							tmp_2bit(1) := spritedata(SP)(spritecursor(SP)/2*2 + 1);
							tmp_2bit(0) := spritedata(SP)(spritecursor(SP)/2*2);
							case tmp_2bit is
							when "00" => 
							when "01" => tmp_spritecolor := spritemulticolor0;
											 tmp_spritevisible := true;
											 tmp_spriteforeground := spritepriority(SP)='0';
							when "10" => tmp_spritecolor := spritecolor(SP);
											 tmp_spritevisible := true;
											 tmp_spriteforeground := spritepriority(SP)='0';
							when "11" => tmp_spritecolor := spritemulticolor1;
											 tmp_spritevisible := true;
							             tmp_spriteforeground := spritepriority(SP)='0';
							end case;
						else
							if spritedata(SP)(spritecursor(SP))='1' then
								tmp_spritecolor := spritecolor(SP);					
								tmp_spritevisible := true;
								tmp_spriteforeground := spritepriority(SP)='0';
							end if;
						end if;
					end if;
				end loop;
				-- merge sprite and pixel data
				if tmp_spritevisible then
					if tmp_spriteforeground or not tmp_isforeground then
						out_color := tmp_spritecolor;
					end if;
				end if;
				
				
				-- overlay with border 
				if mainborderflipflop='1' then
					out_color := bordercolor;
				end if;
				
--				if xcoordinate<20 and tmp_badline then
--					out_color := "0111";
--				end if;
				
				-- override with blankings and sync signals 
				if PAL='1' then
					hcounter := (cycle-1)*8 + phase/2 + (504-8);
					vcounter := displayline + 10;
					if hcounter>=504 then
						hcounter:=hcounter-504;
						vcounter := vcounter+1;
					end if;
					if vcounter>=312 then
						vcounter := vcounter-312;
					end if;
					tmp_half := 252;
				else
					hcounter := (cycle-1)*8 + phase/2; 
					vcounter := displayline+253-4;
					if hcounter>=7 then
						hcounter := hcounter-7;
					else
						hcounter := hcounter+(520-7);
						vcounter := vcounter-1;
					end if;					
					if vcounter>=263 then
						vcounter := vcounter-263;
					end if;
					tmp_half := 260;
				end if;
				if hcounter<286-200 or hcounter>=286+200
				or (PAL='0' and (vcounter<141-120 or vcounter>=141+120))
				or (PAL='1' and (vcounter<166-144 or vcounter>=166+144))
				then
					out_color := "0000";
	
					-- generate csync for PAL or NTSC
					if (vcounter=0) and (hcounter<37 or (hcounter>=tmp_half and hcounter<tmp_half+18)) then                       -- normal sync, short sync
						out_csync := '0';
					elsif (vcounter=1 or vcounter=2) and (hcounter<18 or (hcounter>=tmp_half and hcounter<tmp_half+18)) then      -- 2x 2 short syncs
						out_csync := '0';
					elsif (vcounter=3 or vcounter=4) and (hcounter<tmp_half-18 or (hcounter>=tmp_half and hcounter<2*tmp_half-18)) then  -- 2x 2 vsyncs
						out_csync := '0';
					elsif (vcounter=5) and (hcounter<tmp_half-18 or (hcounter>=tmp_half and hcounter<tmp_half+18)) then           -- one vsync, one short sync
						out_csync := '0';
					elsif (vcounter=6 or vcounter=7) and (hcounter<18 or (hcounter>=tmp_half and hcounter<tmp_half+18)) then      -- 2x 2 short syncs
						out_csync := '0';
					elsif (vcounter>=8) and (hcounter<37) then                                                                    -- normal syncs
						out_csync := '0';
					end if;		
				end if;
				
				-- check the vertical line hit conditions			
				if (RSEL='0' and displayline=55) or (RSEL='1' and displayline=51) then
					if DEN='1' then verticalborderflipflop:='0'; end if;
				elsif (RSEL='0' and displayline=247) or (RSEL='1' and displayline=251) then
					verticalborderflipflop:='1'; 
				end if;
				-- check the horizontal conditions 
				if (CSEL='0' and xcoordinate=31) or (CSEL='1' and xcoordinate=24) then
					if verticalborderflipflop='0' then mainborderflipflop:='0'; end if;
				elsif (CSEL='0' and xcoordinate=335) or (CSEL='1' and xcoordinate=344) then 
					mainborderflipflop:='1';
				end if;
				if cycle=16 and phase=0 then 
					lineactive := false;
				else
					lineactive := lineactive or verticalborderflipflop='0';
				end if;
				
				-- shift pixels along through buffers
				if cycle>=17 and cycle<17+40 and (phase/2) = to_integer(unsigned(XSCROLL)) 
				and lineactive then
					pixelpattern := pixelpattern(12 downto 7) & pixelfetcher2;
					pixelpattern1 := pixelpattern1(12 downto 7) 
						& pixelfetcher2(7) & pixelfetcher2(7) 
						& pixelfetcher2(5) & pixelfetcher2(5) 
						& pixelfetcher2(3) & pixelfetcher2(3)
						& pixelfetcher2(1) & pixelfetcher2(1);
					pixelpattern2 := pixelpattern2(12 downto 7) 
						& pixelfetcher2(6) & pixelfetcher2(6) 
						& pixelfetcher2(4) & pixelfetcher2(4) 
						& pixelfetcher2(2) & pixelfetcher2(2)
						& pixelfetcher2(0) & pixelfetcher2(0);					
				else
					pixelpattern := pixelpattern(12 downto 0) & '0';
					pixelpattern1 := pixelpattern1(12 downto 0) & '0';
					pixelpattern2 := pixelpattern2(12 downto 0) & '0';
				end if;

				-- handle the the video matrix read adressing
				matrixraddress <= matrixaddr5;
				matrixaddr5 := matrixaddr4;
				matrixaddr4 := matrixaddr3;
				matrixaddr3 := matrixaddr2;
				matrixaddr2 := matrixaddr1;
				matrixaddr1 := matrixaddr0;
				if lineactive then
					if cycle>=17 and cycle<17+40 and (phase/2) = to_integer(unsigned(XSCROLL)) then
						if prev_idlestate then
							matrixaddr0 := "111111";   -- unused, contains all zeroes
						else
							matrixaddr0 := std_logic_vector(to_unsigned(cycle-17,6));
						end if;
					end if;
				end if;
				
				-- progress sprite rendering on every pixel 
				if xcoordinate=402 then 
					spriteready := "11111111";
					spriterendering := "00000000";
				else
					for SP in 0 to 7 loop
						if spriteready(SP)='1' and xcoordinate=to_integer(unsigned(spritex(SP))) then
							spriteready(SP) := '0';
							spriterendering(SP) := '1';
							spritecursor(SP) := 23;
							spriteexpansion(SP) := '0';
						elsif spriterendering(SP) = '1' then
							if doublewidth(SP)='1' and spriteexpansion(SP)='0' then
								spriteexpansion(SP):='1';
							else
								spriteexpansion(SP):='0';
								if spritecursor(SP)>0 then
									spritecursor(SP) := spritecursor(SP) -1;
								else
									spriterendering(SP) := '0';
								end if;
							end if;
						end if;
					end loop;
				end if;				
			end if;
			
			-- data from memory
			if phase=9 then                -- received in first half of cycle
				-- pixel pattern read
				pixelfetcher := in_db(7 downto 0);
				-- potential sprite DMA read
				if spritecycle=5 or spritecycle=7 or spritecycle=9 or spritecycle=11
				or spritecycle=13 or spritecycle=15 or spritecycle=17 or spritecycle=19 then
					spritedatabyte1 := in_db(7 downto 0);
					if in_aec/='0' then 
						spritedmaactive := false;
					end if;	
				end if;
			end if;
			-- video matrix read
			if phase=15 and cycle>=15 and cycle<55 and badline then 
				matrixwaddress <= std_logic_vector(to_unsigned(matrixdmacursor,6)); -- cycle-15,6));
				matrixdata <= in_db;
				matrixdmacursor := matrixdmacursor+1;
			else
				matrixwaddress <= "111110"; -- write to unused address
				if cycle=1 then
					matrixdmacursor := 0;
				end if;
			end if;
			
			if phase=15 then   -- receive during a CPU-blocking second half of a cycle
				-- take pixel data into buffer to pick at correct time to implement scrolling
				pixelfetcher2 := pixelfetcher;
				
				-- check on the critical cycle if the sprites should be active at all
				if spritecycle=2 then
					spriteactive_buffer := SPRITEACTIVE;
				end if;
				
				-- read the first databyte for a sprite
				if spritecycle=4 or spritecycle=6 or spritecycle=8 or spritecycle=10
				or spritecycle=12 or spritecycle=14 or spritecycle=16 or spritecycle=18 then
					spritedatabyte0 := DB(7 downto 0); -- in_db(7 downto 0);
					if in_aec/='0' then 
						spritedmaactive := false;
					end if;
				end if;
					-- read the last byte for a sprite and check if it is indeed valid data
				if spritecycle=5 or spritecycle=7 or spritecycle=9 or spritecycle=11
				or spritecycle=13 or spritecycle=15 or spritecycle=17 or spritecycle=19 then
					for SP in 0 to 7 loop
						if spritecycle=5+SP*2 then
							if spritedmaactive and in_aec='0' then
								spritedata(SP) := spritedatabyte0 & spritedatabyte1 & DB(7 downto 0);
							else
								spritedata(SP) := "000000000000000000000000";
							end if;
						end if;
					end loop;
				end if;
			end if;
			
			-- detect if there was a real sprite read (when the
			-- read address did change between individual bytes)
			-- (very short time slot were address is stable)
			-- and reset the sprite dma detection flag
			if phase=11 then
			
				if spritecycle=4 or spritecycle=6 or spritecycle=8 or spritecycle=10
				or spritecycle=12 or spritecycle=14 or spritecycle=16 or spritecycle=18 then
					spritedmaactive := spriteactive_buffer((spritecycle-4)/2) = '1';
					firstspritereadaddress := in2_a(1 downto 0);
				end if;
				
				if spritecycle=5 or spritecycle=7 or spritecycle=9 or spritecycle=11
				or spritecycle=13 or spritecycle=15 or spritecycle=17 or spritecycle=19 then
					if firstspritereadaddress=in2_a(1 downto 0) then
						spritedmaactive := false;
					end if;
				end if;
			end if;

			-- handle display activity and row counter (RC) 
			if phase=15 then
				prev_idlestate := idlestate;
				
				if badline then
					idlestate := false;
				end if; 
				if cycle=14 and badline then  
					RC := 0;
				end if;
				if cycle=58 then
					if RC=7 and not badline then
						idlestate := true;
					elsif not idlestate then
						RC := RC+1;
					end if;
				end if;
			end if;

			-- detect if a register write should happen in this cycle
			if phase=11 then
				register_writeaddress := in_a;
			end if;
			if phase=14 then
				if in_aec='1' and in_cs='0' and in_rw='0' then
					register_writedata := in_db(7 downto 0);
				else
					register_writeaddress := "111111"; -- no write
				end if;
			end if;
			if phase=15 then
				-- write the new value through to the registers before next cycle
				case to_integer(unsigned(register_writeaddress)) is 
					when 17 => DEN := register_writedata(4);
								  RSEL:= register_writedata(3);
								  YSCROLL := register_writedata(2 downto 0);
					when 21 => SPRITEACTIVE := register_writedata;
					when 22 => CSEL := register_writedata(3);
								  XSCROLL := register_writedata(2 downto 0);
					when 32 => bordercolor := register_writedata(3 downto 0);
					when 33 => backgroundcolor0 := register_writedata(3 downto 0);
					when 34 => backgroundcolor1 := register_writedata(3 downto 0);
					when 35 => backgroundcolor2 := register_writedata(3 downto 0);
					when 36 => backgroundcolor3 := register_writedata(3 downto 0);
					when 37 => spritemulticolor0 := register_writedata(3 downto 0);
					when 38 => spritemulticolor1 := register_writedata(3 downto 0);
					when 39 => spritecolor(0) := register_writedata(3 downto 0);
					when 40 => spritecolor(1) := register_writedata(3 downto 0);
					when 41 => spritecolor(2) := register_writedata(3 downto 0);
					when 42 => spritecolor(3) := register_writedata(3 downto 0);
					when 43 => spritecolor(4) := register_writedata(3 downto 0);
					when 44 => spritecolor(5) := register_writedata(3 downto 0);
					when 45 => spritecolor(6) := register_writedata(3 downto 0);
					when 46 => spritecolor(7) := register_writedata(3 downto 0);
					when others => null;
				end case;
				-- memorize for delayed action
				register_writedata2 := register_writedata;
				register_writeaddress2 := register_writeaddress;

			end if;
			-- some registers need delayed write
			if phase=9 then
				case to_integer(unsigned(register_writeaddress2)) is
					when 22 => MCM := register_writedata2(4);
					when 27 => spritepriority := register_writedata2;
					when 28 => spritemulticolor := register_writedata2;
					when 29 => doublewidth := register_writedata2;								  
					when others => null;
				end case;
			end if;
			if phase=11 then
				case to_integer(unsigned(register_writeaddress2)) is
					when 0  => spritex(0)(7 downto 0) := register_writedata2;
					when 2  => spritex(1)(7 downto 0) := register_writedata2;
					when 4  => spritex(2)(7 downto 0) := register_writedata2;
					when 6  => spritex(3)(7 downto 0) := register_writedata2;
					when 8  => spritex(4)(7 downto 0) := register_writedata2;
					when 10 => spritex(5)(7 downto 0) := register_writedata2;
					when 12 => spritex(6)(7 downto 0) := register_writedata2;
					when 14 => spritex(7)(7 downto 0) := register_writedata2;
					when 16 => spritex(0)(8) := register_writedata2(0);
					           spritex(1)(8) := register_writedata2(1);
								  spritex(2)(8) := register_writedata2(2);
								  spritex(3)(8) := register_writedata2(3);
								  spritex(4)(8) := register_writedata2(4);
								  spritex(5)(8) := register_writedata2(5);
								  spritex(6)(8) := register_writedata2(6);
								  spritex(7)(8) := register_writedata2(7);							  
					when others => null;
				end case;
			end if;
			if phase=13 then
				case to_integer(unsigned(register_writeaddress2)) is
					when 17 => ECM := register_writedata2(6);
	                       BMM := register_writedata2(5);				
					when others => null;
				end case;
			end if;

			-- detect DEN activity in first line
			if displayline=48 and DEN='1' then
				displayactive:=true; 
			elsif displayline=251 then
				displayactive:=false;
			end if;

			-- test for bad line condition to be present in next cycle
			badline := displayline<248 and displayactive 
				and to_integer(unsigned(YSCROLL)) = (displayline mod 8);
			
						
			-- progress horizontal and vertical counters
			if phase mod 2 = 0 then
				if PAL='1' and cycle=14 and phase=10 then
					xcoordinate := 0;
				elsif PAL='0' and cycle=10 and phase=10 then
					xcoordinate := 480;
				else
					xcoordinate := xcoordinate+1;
				end if;
			end if;
			if phase=15 then
				if cycle=65 or (cycle=63 and PAL='1') then
					cycle := 1;
					if (displayline=262 and PAL='0') or displayline=311 then
						displayline := 0;
					else
						displayline := displayline+1;
					end if;
				else
					cycle := cycle+1;
				end if;
				if (PAL='1' and cycle=54) or (PAL='0' and cycle=55) then
					spritecycle := 0;
				elsif spritecycle/=31 then
					spritecycle := spritecycle+1;
				end if;
			end if;
			
			-- try to find the dram refresh pattern to sync the output 
			if phase=3 then
				case syncdetect_cycle is
				when 0 => ramrefreshpattern(9 downto 8) := in_a(1 downto 0);
				when 1 => ramrefreshpattern(7 downto 6) := in_a(1 downto 0);
				when 2 => ramrefreshpattern(5 downto 4) := in_a(1 downto 0);
				when 3 => ramrefreshpattern(3 downto 2) := in_a(1 downto 0);
				when 4 => ramrefreshpattern(1 downto 0) := in_a(1 downto 0);
				when 5 => 
					if ramrefreshpattern = "1110010011" 
					or ramrefreshpattern = "1001001110"
					or ramrefreshpattern = "0100111001"
					or ramrefreshpattern = "0011100100"
					then
						syncdetect_ok := true;  -- have detected the refresh pattern
					elsif syncdetect_ok then
						syncdetect_ok := false; -- not detected for 1. time 
						-- detect the bottom of the frame anomaly (when in sync)
						if ramrefreshpattern = "1111111111" then
							cycle := 16;	
							if PAL='1' then
								displayline := 311;
							else
								displayline := 262;
							end if;
						end if;
					else 
						syncdetect_cycle := 6;  -- two missdetecions: search for sync
					end if;
				when others =>
				end case;
				if (syncdetect_cycle=62 and PAL='1') or syncdetect_cycle=64 then 
					syncdetect_cycle := 0;
				else
					syncdetect_cycle := syncdetect_cycle+1;
				end if;
			end if;
			
			-- progress the phase
			if (phase=15 or phase=0 or phase=1) and in_phi0='0' then
				phase:=2;
			elsif phase/=1 then
				phase:=phase+1;
			end if;

			-- take signals into registers
			in_phi0 := PHI0;
			in_db := DB;
			in_a := A;
			in_rw := RW; 
			in_cs := CS; 
			in_aec := AEC;			
		-- end of synchronous logic
		end if;	
	   if falling_edge(CLK) then
			in2_a := A;
		end if;
		
		-------------------- output signals ---------------------		
		COLOR <= out_color;
		CSYNC <= out_csync;
	end process;
	
end immediate;

