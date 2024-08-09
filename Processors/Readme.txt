Procesadores candidatos como sujetos para campaña de inyección a través de Cocotb. 
        - Carpetas con el nombre de los procesadores candidatos.Cada uno contiene:
		- Archivos originales sin modificar de cada uno de los procesadores. 
		- Carpeta con el nombre del simulador al cual ha sido sometido a la campaña. En cada carpeta existe:
			- GoldenRun: Experimento en el simulador de su carpeta raíz sin inducción de fallos.
			- Stuck-at-1: Campaña de inyección donde los experimentos inyectan en todos los puntos un fallo permanente al inicio con valor 1
				-Combinacional: Los puntos de inyección son señales del componente que siguen una lógica combinacional
				-Secuencial: Los puntos de inyección son señales del componente que siguen una lógica secuencial
			- Stuck-at-0: Campaña de inyección donde los experimentos inyectan en todos los puntos un fallo permanente al inicio con valor 0
				-Combinacional: Los puntos de inyección son señales del componente que siguen una lógica combinacional
				-Secuencial: Los puntos de inyección son señales del componente que siguen una lógica secuencial
			- Bit-flip: Campaña de inyección donde los experimentos inyectan en todos los puntos un fallo transitorio con la inversa del valor en el momento de inyección (aleatorio). 
				-Combinacional: Los puntos de inyección son señales del componente que siguen una lógica combinacional (Forzado force)
				-Secuencial: Los puntos de inyección son señales del componente que siguen una lógica secuencial (Forzado con deposit)
	-Carpeta miscelanea para el manejo de las señales combinacionales y secuenciales + generación de configuraciones json			
			
