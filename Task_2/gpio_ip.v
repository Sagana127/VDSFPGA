module gpio_ip (
    input  wire        clk,
    input  wire        resetn,

    input  wire        write_en,
    input  wire        read_en,
    input  wire [31:0] wdata,

    output reg  [31:0] rdata,
    output reg  [31:0] gpio_out
);

    // Internal storage register
    reg [31:0] gpio_reg;

    // Write logic
    always @(posedge clk) begin
        if (!resetn) begin
            gpio_reg <= 32'b0;
        end else if (write_en) begin
            gpio_reg <= wdata;
        end
    end

    // Read logic
    always @(*) begin
        if (read_en)
            rdata = gpio_reg;
        else
            rdata = 32'b0;
    end

    // Output assignment
    always @(*) begin
        gpio_out = gpio_reg;
    end

endmodule
