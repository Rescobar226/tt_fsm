module tt_um_Rescobar226 (
    input  wire clk,          // Clock obligatorio
    input  wire ena,          // Enable obligatorio
    input  wire [7:0] ui,     // Entradas
    output wire [7:0] uo,     // Salidas
    inout  wire [7:0] uio     // Bidireccionales (no usados)
);

    wire Sen = ui[0];
    wire SE  = ui[1];
    wire LA  = ui[2];
    wire LC  = ui[3];

    reg [3:0] S = 4'b0000;
    reg [3:0] S_n;

    // Lógica de transición (FSM combinacional)
    always @(*) begin
        S_n[3] = ~S[3] & S[2] & ~S[1] & ~S[0] & ~Sen & ~SE & LA;
        S_n[2] = ~S[3] & ~S[2] & S[1] & ~S[0] & Sen & ~SE & ~LC;
        S_n[1] = (S[3] & ~S[2] & ~S[1] & ~S[0] & ~Sen & SE & ~LA & ~LC) |
                 (~S[3] & ~S[2] & ~S[1] & S[0] & Sen & ~SE & ~LA);
        S_n[0] = (S[3] & ~S[2] & ~S[1] & ~S[0] & ~Sen & ~SE & ~LA & LC) |
                 (~S[3] & ~S[2] & ~S[1] & ~S[0] & Sen & ~SE & ~LA & LC);
    end

    // Actualización del estado en flanco de subida de clk, si ena está activo
    always @(posedge clk) begin
        if (ena)
            S <= S_n;
    end

    wire MA = (S == 4'b0010);
    wire MC = (S == 4'b0100);

    assign uo[0] = MA;
    assign uo[1] = MC;
    assign uo[2] = S[0];
    assign uo[3] = S[1];
    assign uo[4] = S[2];
    assign uo[5] = S[3];
    assign uo[6] = 1'b0;
    assign uo[7] = 1'b0;

    assign uio = 8'bZ;  // No usamos los bidireccionales

endmodule
