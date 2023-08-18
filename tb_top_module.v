module tb_top_module();

    // Inputs
    reg clk;
    reg reset;
    reg ena;

    // Outputs
    
    wire pm;
    wire [7:0] hh;
    wire [7:0] mm;
    wire [7:0] ss;

    // Instantiate the clock module
    top_module dut (   clk,
     reset,
     ena,
     pm,
   hh,
    mm,
    ss
    );

always #5 clk=~clk;

    // Testbench stimulus
    initial begin
        reset = 1;
        ena = 0;
  end



initial begin
$dumpfile ("topModule_out.vcd");
$dumpvars (0, tb_top_module);

        // Reset and wait for a few clock cycles
        #10 reset <= 0;

        // Enable the clock module
        ena <= 1;

        // Wait for some time to see the clock changes
        #2000;

        // Disable the clock module
        ena <= 0;

        // Finish simulation
        $finish;
    end

endmodule
