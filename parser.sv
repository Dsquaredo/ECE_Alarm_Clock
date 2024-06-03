module parser (
    input logic [5:0] value, 
    output logic [3:0] ones, 
    output logic [3:0] tens  
);

    
    always_comb begin
        ones = value % 10;
        tens = (value / 10) % 10;
    end

endmodule
