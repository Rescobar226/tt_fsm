module user_project (
    input  wire [7:0] ui,   // ui[0]=Sen, ui[1]=SE, ui[2]=LA, ui[3]=LC
    output wire [7:0] uo    // uo[0]=MA, uo[1]=MC, uo[5:2]=S[3:0]
);

    wire clk;
    assign clk = 1'b1;  // TinyTapeout usa clock interno, simulamos 1 Hz

    wire Sen = ui[0];
    wire SE  = ui[1];
    wire LA  = ui[2];
    wire LC  = ui[3];

    reg [3:0] S = 4'b0000;
    reg [3:0] S_n;

    // Lógica de transición de estados (combinacional)
    always @(*) begin
        S_n[3] = ~S[3] & S[2] & ~S[1] & ~S[0] & ~Sen & ~SE & LA;
        S_n[2] = ~S[3] & ~S[2] & S[1] & ~S[0] & Sen & ~SE & ~LC;
        S_n[1] = (S[3] & ~S[2] & ~S[1] & ~S[0] & ~Sen & SE & ~LA & ~LC) |
                 (~S[3] & ~S[2] & ~S[1] & S[0] & Sen & ~SE & ~LA);
        S_n[0] = (S[3] & ~S[2] & ~S[1] & ~S[0] & ~Sen & ~SE & ~LA & LC) |
                 (~S[3] & ~S[2] & ~S[1] & ~S[0] & Sen & ~SE & ~LA & LC);
    end

    // Flip-flops de estado (con clock lento simulado)
    always @(posedge clk) begin
        S <= S_n;
    end

    // Lógica de salida
    wire MA = (S == 4'b0010);  // estado de abrir
    wire MC = (S == 4'b0100);  // estado de cerrar

    // Asignar salidas
    assign uo[0] = MA;
    assign uo[1] = MC;
    assign uo[2] = S[0];
    assign uo[3] = S[1];
    assign uo[4] = S[2];
    assign uo[5] = S[3];
    assign uo[6] = 1'b0;
    assign uo[7] = 1'b0;

endmodule
