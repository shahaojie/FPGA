library verilog;
use verilog.vl_types.all;
entity DSP_FPGA_IMC_PMSM is
    port(
        XINT3           : out    vl_logic;
        CLKIN           : in     vl_logic;
        RST             : in     vl_logic;
        XD              : inout  vl_logic_vector(15 downto 0);
        XWE0            : in     vl_logic;
        XA              : in     vl_logic_vector(19 downto 0)
    );
end DSP_FPGA_IMC_PMSM;
