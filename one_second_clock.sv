module one_second_clock (
    input wire clk_50MHz,  
    output reg out1Hz   
);

reg [24:0] counter;  

always @(posedge clk_50MHz) begin
    if (counter == 25000000) begin 
        out1Hz <= ~out1Hz; 
        counter <= 0;       
    end else begin
        counter <= counter + 1; 
    end
end

endmodule
