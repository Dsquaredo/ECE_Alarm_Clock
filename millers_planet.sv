module millers_planet (
    input wire start,
    input wire stop,
    input wire clk,
    output reg out
);

reg [25:0] counter; 
reg loop_started;

always @(posedge clk) begin
    if (start && !loop_started) begin
        loop_started <= 1'b1;
        counter <= 0;
    end else if (loop_started && !stop) begin
        if (counter >= 62500000 - 1) 
            counter <= 0;
        else
            counter <= counter + 1;
    end else begin
        loop_started <= 1'b0;
        counter <= 0;
    end
end

always @(posedge clk) begin
    if (loop_started && !stop) begin
        if (counter < 31250000) 
            out <= 1'b1;
        else
            out <= 1'b0;
    end else begin
        out <= 1'b0; 
    end
end

endmodule
