# Proyecto de Fin de Máster: Inyección de fallos basada en simuladores de código libre para sistemas modelados mediante lenguajes de descripción de hardware
Proyecto de fin de máster que evalua las capacidades de cocotb en simuladores de código abierto. Entre ellas, la compatibilidad de la librería y su capacidad de generar campañas de inyección de fallos. 
## Estructura del Repositorio
- `ForceDepositReleaseTEST`: Contiene las carpetas que evaluan la cobertura de la biblioteca
  - `BooleanTest`: Contiene las carpetas para el test de la señales booleanas para los simuladores NVC y Questa en VHDL 
  - `GeneralScopeTest`: Contiene las carpetas para el test de distintos tipos de señales para simuladores GHDL,NVC,QUESTA,Icarus y Verilator
  - `IntegerTest`: Contiene las carpetas para el test de la señales de tipo entero con signo y sin signo. Para los simuladores NVC / Questa en VHDL y Verilog
- `Processors`: Contiene las carpetas para distintos procesadores candidatos a campañas de inyección con su nombre
  - `GoldenRun`: Experimento en el simulador de su carpeta raíz sin inducción de fallos.
  - `Stuck-at-1`: Campaña de inyección donde los experimentos inyectan en todos los puntos un fallo permanente al inicio con valor 1
	-`Combinacional`: Los puntos de inyección son señales del componente que siguen una lógica combinacional
	-`Secuencial`: Los puntos de inyección son señales del componente que siguen una lógica secuencial
  - `Stuck-at-0`: Campaña de inyección donde los experimentos inyectan en todos los puntos un fallo permanente al inicio con valor 0
	-`Combinacional`: Los puntos de inyección son señales del componente que siguen una lógica combinacional
	-`Secuencial`: Los puntos de inyección son señales del componente que siguen una lógica secuencial
  - `Bit-flip`: Campaña de inyección donde los experimentos inyectan en todos los puntos un fallo transitorio con la inversa del valor en el momento de inyección ( aleatorio). 
	-`Combinacional`: Los puntos de inyección son señales del componente que siguen una lógica combinacional (Forzado force con distintas duraciones)
	-`Secuencial`: Los puntos de inyección son señales del componente que siguen una lógica secuencial (Forzado con deposit)
- `UNITTESTINGAUTO`: Contiene las carpetas para la ejecución de las campañas de inyección para los simuladores libres NVC y Icarus Verilog
  -  `infra`: Creación de experimentos para la campaña de inyección mediante la creación de una infraestructura separada
  -  `loop`: Creación de experimentos para la campaña de inyección mediante el uso de un testbench cíclico vhdl/verilog
  -  `start`: Creación de experimentos para la campaña de inyección mediante el uso de un test python, donde se describe el testbench y la inyección en el mismo test
