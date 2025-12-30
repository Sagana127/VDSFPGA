`timescale 1ns/1ps

module gpio_tb;
    // Signals to connect to your gpio_ip
    reg clk, resetn, write_en, read_en;
    reg [31:0] wdata;
    wire [31:0] rdata;
    wire [31:0] gpio_out;

    // Instantiate your GPIO module
    gpio_ip dut (
        .clk(clk),
        .resetn(resetn),
        .write_en(write_en),
        .read_en(read_en),
        .wdata(wdata),
        .rdata(rdata),
        .gpio_out(gpio_out)
    );

    // Generate Clock
    always #5 clk = ~clk;

    initial begin
        // Setup for Waveform Viewing (Step 4 Requirement)
        $dumpfile("gpio_sim.vcd");
        $dumpvars(0, gpio_tb);

        // Initialize
        clk = 0; resetn = 0; write_en = 0; read_en = 0; wdata = 0;
        #15 resetn = 1; // Release reset

        // --- TASK 1: VERIFY REGISTER UPDATE ---
        #10;
        wdata = 32'hDEADBEEF; // Value to write
        write_en = 1;         // Enable write
        #10;
        write_en = 0;         // Disable write
        $display("[TIME %t] Written to GPIO: %h | GPIO_OUT: %h", $time, wdata, gpio_out);

        // --- TASK 2: VERIFY READBACK BEHAVIOR ---
        #10;
        read_en = 1;          // Enable read
        #10;
        $display("[TIME %t] Readback from GPIO: %h", $time, rdata);
        
        if (rdata == 32'hDEADBEEF) 
            $display("SUCCESS: Write and Readback match!");
        else 
            $display("FAILURE: Mismatch detected!");

        #20 $finish;
    end
endmodule