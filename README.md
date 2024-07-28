# Proyecto de Fin de Máster: Inyección de fallos basada en simuladores de código libre para sistemas modelados mediante lenguajes de descripción de hardware
Proyecto de fin de máster que evalua las capacidades de cocotb en simuladores de código abierto. Entre ellas, la compatibilidad de la librería y su capacidad de generar campañas de inyección de fallos. 
## Estructura del Repositorio
- `ForceDepositReleaseTEST`: Contiene las carpetas que evaluan la cobertura de la biblioteca
  - `BooleanTest`: Contiene las carpetas para el test de la señales booleanas para los simuladores NVC y Questa en VHDL 
  - `GeneralScopeTest`: Contiene las carpetas para el test de distintos tipos de señales para simuladores GHDL,NVC,QUESTA,Icarus y Verilator
  - `IntegerTest`: Contiene las carpetas para el test de la señales de tipo entero con signo y sin signo. Para los simuladores NVC / Questa en VHDL y Verilog
- `Processors`: Contiene las carpetas para distintos procesadores candidatos a campañas de inyección
- `UNITTESTINGAUTO`: Contiene las carpetas para la ejecución de las campañas de inyección para los simuladores libres NVC y Icarus Verilog
  -  `infra`: Creación de experimentos para la campaña de inyección mediante la creación de una infraestructura separada
  -  `loop`: Creación de experimentos para la campaña de inyección mediante el uso de un testbench cíclico vhdl/verilog
  -  `start`: Creación de experimentos para la campaña de inyección mediante el uso de un test python, donde se describe el testbench y la inyección en el mismo test
