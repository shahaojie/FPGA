library verilog;
use verilog.vl_types.all;
entity DSP_FPGA_IMC_PMSM_vlg_check_tst is
    port(
        XD              : in     vl_logic_vector(15 downto 0);
        XINT3           : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end DSP_FPGA_IMC_PMSM_vlg_check_tst;
