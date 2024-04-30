module sort(input [31:0] A, output [31:0] B);

	reg [3:0] I[8:0], tmp;
	/* Implement your design here. */
	genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin
            always @* begin
                I[i] = A[(4*i)+3 -: 4];
            end
        end
    endgenerate


    genvar j;
    generate
        for (i = 0; i < 8; i = i + 1) begin
            for (j = i + 1; j < 8; j = j + 1) begin
                always @* begin
                    if (I[i] < I[j]) begin
                        
                        tmp = I[i];
                        I[i] = I[j];
                        I[j] = tmp;
                    end
                end
            end
        end
    endgenerate
	genvar k;
	generate 
		for (k = 0; k < 8; k = k + 1) begin
			assign B[(31-(k*4)) -: 4] = I[k]; 
		end
	endgenerate
endmodule