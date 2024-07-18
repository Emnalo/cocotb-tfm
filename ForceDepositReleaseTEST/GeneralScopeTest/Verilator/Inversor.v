module Inversor #(parameter N = 4) (
    input  wire [N-1:0] entrada,  // Entrada
    output wire [N-1:0] salida    // Salida
);

assign salida = ~entrada;

endmodule

