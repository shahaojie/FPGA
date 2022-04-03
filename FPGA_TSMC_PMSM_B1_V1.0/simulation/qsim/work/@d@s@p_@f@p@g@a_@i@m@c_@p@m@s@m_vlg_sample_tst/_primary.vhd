library verilog;
use verilog.vl_types.all;
entity DSP_FPGA_IMC_PMSM_vlg_sample_tst is
    port(
        CLKIN           : in     vl_logic;
        RST             : in     vl_logic;
        XA              : in     vl_logic_vector(19 downto 0);
        XD              : in     vl_logic_vector(15 downto 0);
        XWE0            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end DSP_FPGA_IMC_PMSM_vlg_sample_tst;
