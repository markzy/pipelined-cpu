library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity CPU is
    Port (
        clk: in std_logic);
end CPU;
        
architecture Behavioral of CPU is
component mux2 is
port(  A : in STD_LOGIC_VECTOR (31 downto 0);
       B : in STD_LOGIC_VECTOR (31 downto 0);
       C : in STD_LOGIC;
       muxout : out STD_LOGIC_VECTOR (31 downto 0)
);
end component;

component mux2_5 is
port(  A : in STD_LOGIC_VECTOR (4 downto 0);
       B : in STD_LOGIC_VECTOR (4 downto 0);
       C : in STD_LOGIC;
       muxout : out STD_LOGIC_VECTOR (4 downto 0)
);
end component;

component IF1 is
port(      pcin : in STD_LOGIC_VECTOR (31 downto 0);
           pcf : out STD_LOGIC_VECTOR (31 downto 0);
           clk : in STD_LOGIC;
           ifstop: in std_logic);
end component;

component add is
port(      A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           addout : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component instrumem is
port(      A : in STD_LOGIC_VECTOR (31 downto 0);
           RD : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component if2id is
port(     instrf : in STD_LOGIC_VECTOR (31 downto 0);
          PCPlus4F : in STD_LOGIC_VECTOR (31 downto 0);
          PCPlus4D : out STD_LOGIC_VECTOR (31 downto 0);
          instrd : out STD_LOGIC_VECTOR (31 downto 0);
          clk : in STD_LOGIC;
          clear:in std_logic;
          signalaF, signalbF, srctypeF,writecontrolf : in std_logic;
          signalaD, signalbD, srctypeD,writecontrold : out std_logic);
end component;

component controlunit is
port(      Op : in STD_LOGIC_VECTOR (5 downto 0);
           Funct : in STD_LOGIC_VECTOR (5 downto 0);
           RegWrite : out STD_LOGIC;
           MemtoReg : out STD_LOGIC;
           MemWrite : out STD_LOGIC;
           Branch : out STD_LOGIC;
           ALUControl : out STD_LOGIC_VECTOR (2 downto 0);
           ALUSrc : out STD_LOGIC;
           regdst: out std_logic;
           jr : out std_logic;
           shiftmode: out std_logic);
end component;

component regfile is
port(      A1 : in STD_LOGIC_VECTOR (4 downto 0);
           A2 : in STD_LOGIC_VECTOR (4 downto 0);
           A3 : in STD_LOGIC_VECTOR (4 downto 0);
           WD3 : in STD_LOGIC_VECTOR (31 downto 0);
           CLK : in STD_LOGIC;
           WE3 : in STD_LOGIC;
           RD1 : out STD_LOGIC_VECTOR (31 downto 0);
           RD2 : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component signextend is
port(      signin : in STD_LOGIC_VECTOR (15 downto 0);
           signout : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component id2ex is
port(      regwrited : in STD_LOGIC;
           memtoregd : in STD_LOGIC;
           memwrited : in STD_LOGIC;
           branchd : in STD_LOGIC;
           alucontrold : in STD_LOGIC_VECTOR (2 downto 0);
           alusrcd : in STD_LOGIC;
           regdstd : in STD_LOGIC;
           jrd : in STD_LOGIC;
           regwriteE : out STD_LOGIC;
           memtoregE : out STD_LOGIC;
           memwriteE : out STD_LOGIC;
           BranchE : out STD_LOGIC;
           alucontrolE : out STD_LOGIC_VECTOR (2 downto 0);
           alusrcE : out STD_LOGIC;
           regdstE : out STD_LOGIC;
           jrE : out STD_LOGIC;
           RD1D : in STD_LOGIC_VECTOR (31 downto 0);
           RD2D : in STD_LOGIC_VECTOR (31 downto 0);
           RD1E : out STD_LOGIC_VECTOR (31 downto 0);
           RD2E : out STD_LOGIC_VECTOR (31 downto 0);
           rtd : in STD_LOGIC_VECTOR (4 downto 0);
           rte : out STD_LOGIC_VECTOR (4 downto 0);
           rdd : in STD_LOGIC_VECTOR (4 downto 0);
           rde : out STD_LOGIC_VECTOR (4 downto 0);
           signimmD : in STD_LOGIC_VECTOR (31 downto 0);
           signimmE : out STD_LOGIC_VECTOR (31 downto 0);
           PCPlus4D : in STD_LOGIC_VECTOR (31 downto 0);
           PCPlus4E : out STD_LOGIC_VECTOR (31 downto 0);
           shamtd : in STD_LOGIC_VECTOR (4 downto 0);
           shamte : out STD_LOGIC_VECTOR (4 downto 0);
           shiftmoded: in std_logic;
           shiftmodee: out std_logic;
           clk : in STD_LOGIC;
           signalad,signalbd,srctyped, writecontrold:in std_logic;
           signalae,signalbe,srctypee,writecontrole:out std_logic);
end component;

component shift2 is
port(      shiftin : in STD_LOGIC_VECTOR (31 downto 0);
           shiftout : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component alu is
port(      SrcA : in STD_LOGIC_VECTOR (31 downto 0);
           SrcB : in STD_LOGIC_VECTOR (31 downto 0);
           shiftmode: in std_logic;
           shamt:in std_logic_vector(4 downto 0);
           ALUControl : in STD_LOGIC_VECTOR (2 downto 0);
           zero : out STD_LOGIC;
           ALUout : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component ex2mem is
port(      clk : in STD_LOGIC;
           regwriteE : in STD_LOGIC;
           memtoregE : in STD_LOGIC;
           memwriteE : in STD_LOGIC;
           BranchE : in STD_LOGIC;
           zeroE : in STD_LOGIC;
           AluoutE : in STD_LOGIC_VECTOR (31 downto 0);
           writedataE : in STD_LOGIC_VECTOR (31 downto 0);
           WriteregE : in STD_LOGIC_VECTOR (4 downto 0);
           PCBranchE : in STD_LOGIC_VECTOR (31 downto 0);
           regwriteM : out STD_LOGIC;
           memtoregM : out STD_LOGIC;
           memwriteM : out STD_LOGIC;
           BranchM : out STD_LOGIC;
           ZeroM : out STD_LOGIC;
           AluoutM : out STD_LOGIC_VECTOR (31 downto 0);
           WriteDataM : out STD_LOGIC_VECTOR (31 downto 0);
           WriteRegM : out STD_LOGIC_VECTOR (4 downto 0);
           PCBranchM : out STD_LOGIC_VECTOR (31 downto 0);
           writecontrole:in std_logic;
           writecontrolm:out std_logic );
end component;

component datamem is
port(      A : in STD_LOGIC_VECTOR (31 downto 0);
           WD : in STD_LOGIC_VECTOR (31 downto 0);
           WE : in STD_LOGIC;
           CLK : in STD_LOGIC;
           RD : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component mem2wb is
 Port ( regwriteM : in STD_LOGIC;
          memtoregM : in STD_LOGIC;
          AluoutM : in STD_LOGIC_VECTOR (31 downto 0);
          RDM : in STD_LOGIC_VECTOR (31 downto 0);
          writeregM : in STD_LOGIC_VECTOR (4 downto 0);
          regwriteW : out STD_LOGIC;
          MemtoregW : out STD_LOGIC;
          aluoutW : out STD_LOGIC_VECTOR (31 downto 0);
          rdW : out STD_LOGIC_VECTOR (31 downto 0);
          writeRegW : out STD_LOGIC_VECTOR (4 downto 0);
          clk : in STD_LOGIC);
end component;

component hazardcontrol is
    Port ( instr : in STD_LOGIC_VECTOR (31 downto 0);
           clk : in STD_LOGIC;
           A : out STD_LOGIC;
           B : out STD_LOGIC;
           ifstop :out std_logic;--need to be modified 
           srctype : out STD_LOGIC;
           writecontrol:out std_logic);
end component;

component hazardmux is
    Port ( AorB : in STD_LOGIC;
           srcType : in STD_LOGIC;
           src : in STD_LOGIC_VECTOR (31 downto 0);
           alu : in STD_LOGIC_VECTOR (31 downto 0);
           mem : in STD_LOGIC_VECTOR (31 downto 0);
           muxout : out STD_LOGIC_VECTOR (31 downto 0));
end component;

--signal
signal pcin,pcf, pcplus4f, pcplus4d, pcplus4e, instrf, instrd, signimmd,rd1d, rd2d,rd1e, rd2e, signimme, aluoute, aluoutm
, writedatam, pcbranche, pcbranchm, rdm,rdw, aluoutw, resultw, srcbe, signimme2,pcbranch, finalsrca, finalsrcb, finalwritedata: std_logic_vector(31 downto 0):=x"00000000";
signal regwrited, memtoregd, memwrited, branchd,alusrcd, regdstd,jrd, regwritee,memtorege, memwritee, branche, alusrce, regdste, jre, regwritem,
memtoregm, memwritem, branchm, zerom, zeroe, regwritew, memtoregw, pcsrcM,  signalaF, signalbF, srctypeF,writecontrolf, signalaD, signalbD, srctypeD,writecontrold, signalae,signalbe,srctypee,writecontrole, writecontrolm, ifstop, shiftmoded, shiftmodee:std_logic:='0';
signal alucontrold, alucontrole:std_logic_vector(2 downto 0):="000";
signal writerege, writeregm, writeregw, rte, rde,shamt: std_logic_vector(4 downto 0):="00000";
begin
muxPC:mux2 port map(
        A =>PCBranchM,
        B =>rd1d,
        C =>jrd,
        muxout =>pcbranch);
        
mux1: mux2 port map(
        A => pcplus4f,
        B => pcbranch,
        C => pcsrcm,
        muxout => pcin);
        
instr_fetch: IF1 port map(
        pcin => pcin,
        pcf => pcf,
        clk => clk,
        ifstop => ifstop);
        
instr_mem: Instrumem port map(
        A => pcf,
        RD => instrf);
        
hazard: hazardcontrol port map(
        instr => instrf,
        clk => clk,
        A => signalaf,
        B => signalbf,
        ifstop =>ifstop,
        srctype =>srctypef,
        writecontrol => writecontrolf);
                        
        
adder1: add port map(
        A => pcf,
        B => conv_std_logic_vector(4,32),
        addout => pcplus4f);
        
iftoid: if2id port map(instrf, pcplus4f,pcplus4d,instrd,clk,ifstop,signalaF, signalbF, srctypeF,writecontrolf, signalaD, signalbD, srctypeD,writecontrold);
        
control_unit: controlunit port map(
        Op => instrd(31 downto 26),
        Funct => instrd(5 downto 0),
        RegWrite => regwrited,
        MemtoReg => memtoregd,
        MemWrite =>memwrited,
        Branch =>branchd,
        ALUControl => alucontrold,
        ALUSrc => alusrcd,
        regdst => regdstd,
        jr => jrd,
        shiftmode => shiftmoded);
        
sign_extend: signextend port map(
        signin => instrd(15 downto 0),
        signout => signimmd);
        
reg_file: regfile port map(instrd(25 downto 21), instrd(20 downto 16), writeregw, resultw, clk, regwritew, rd1d, rd2d);    
    
idtoex: id2ex port map(
        regwrited => regwrited,
        memtoregd => memtoregd,
        memwrited => memwrited,
        branchd => branchd,
        alucontrold => alucontrold,
        alusrcd => alusrcd,
        regdstd => regdstd,
        jrd => jrd,
        regwriteE => regwritee,
        memtoregE => memtorege,
        memwriteE => memwritee,
        BranchE => branche,
        alucontrolE => alucontrole,
        alusrcE => alusrce,
        regdstE => regdste,
        jrE => jre,
        RD1D => rd1d,
        RD2D => rd2d,
        RD1E => rd1e,
        RD2E => rd2e,
        rtd => instrd(20 downto 16),
        rte => rte,
        rdd => instrd(15 downto 11),
        rde => rde,
        signimmD => signimmd,
        signimmE => signimme,
        PCPlus4D => pcplus4d,
        PCPlus4E => pcplus4e,
        shamtd => instrd(10 downto 6),
        shamte => shamt,
        shiftmoded => shiftmoded,
        shiftmodee => shiftmodee,
        clk => clk,signalad =>signalaD, signalbd =>signalbD, srctyped => srctypeD,writecontrold =>writecontrold , signalae => signalae,signalbe => signalbe,srctypee => srctypee,writecontrole => writecontrole);
        
mux12: mux2_5 port map(
        A => rte,
        B => rde,
        C => regdste,
        muxout => writerege);

shift12: shift2 port map(
        shiftin => signimme,
        shiftout => signimme2);
        
mux13: mux2 port map(
        A => rd2e,
        B => signimme,
        C => alusrce,
        muxout => srcbe);
        
adder2: add port map(
        A => signimme2,
        B => pcplus4e,
        addout => pcbranche);

srcAmux: hazardmux port map(signalae, srctypee, rd1e, aluoutm, rdw, finalsrca); 
srcBmux: hazardmux port map(signalbe, srctypee, srcbe, aluoutm, rdw, finalsrcb);                 

ALU1: alu port map(
        SrcA => finalsrca,
        SrcB => finalsrcb,
        shiftmode => shiftmodee,
        shamt =>shamt,
        ALUControl => alucontrole,
        zero => zeroe,
        ALUout => aluoute);

extomem: ex2mem port map(
        clk => clk,
        regwriteE => regwritee,
        memtoregE => memtorege,
        memwriteE => memwritee,
        BranchE => branche,
        zeroE => zeroe,
        AluoutE => aluoute,
        writedataE => rd2e,
        WriteregE => writerege,
        PCBranchE => pcbranche,
        regwriteM => regwritem,
        memtoregM => memtoregm,
        memwriteM => memwritem,
        BranchM => branchm,
        ZeroM => zerom,
        AluoutM => aluoutm,
        WriteDataM => writedatam,
        WriteRegM => writeregm,
        PCBranchM => pcbranchm,
        writecontrole=>writecontrole, writecontrolm => writecontrolm);

memmux: mux2 port map(writedatam, rdw, writecontrolm,finalwritedata);

data_mem:datamem port map(aluoutm, finalwritedata,memwritem, clk, rdm);

memtowb: mem2wb port map(regwritem, memtoregm, aluoutm, rdm,writeregm, regwritew, memtoregw, aluoutw, rdw, writeregw,clk);

mux14:mux2 port map( aluoutw, rdw, memtoregw, resultw);

pcsrcm <= (branchm and zerom) or jrd;
        
        
end Behavioral;