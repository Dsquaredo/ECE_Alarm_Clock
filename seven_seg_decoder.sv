module seven_seg_decoder(
    input [3:0] binary_in,
    output reg [6:0] Seg
);
    always @(binary_in) begin
        case(binary_in)
            4'd0: Seg = 7'b1000000;
            4'd1: Seg = 7'b1111001;
            4'd2: Seg = 7'b0100100;
            4'd3: Seg = 7'b0110000;
            4'd4: Seg = 7'b0011001;
            4'd5: Seg = 7'b0010010;
            4'd6: Seg = 7'b0000010;
            4'd7: Seg = 7'b1111000;
            4'd8: Seg = 7'b0000000;
            4'd9: Seg = 7'b0010000;
            default: Seg = 7'b1111111; 
        endcase
    end
endmodule
