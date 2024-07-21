Generación de experimentos para la campaña inyección de fallos mediante test en vhdl ciclico:
	- Archivos vhd/v de descripción del componente
	- FactoryTest: Prueba para generación de test mediante cocotb.parameterize con tuplas de variables cartesianas (DESCARTADO)
	- Makefile y LoopTest.py: Archivo donde se describe la ejecución de test y archivo make necesario para su ejecución.
	- Archivos xml con los resultados de cada experimento, nombrados como las carpetas correspondientes. 
	- compare_signals.py: Script en Python para comparar la GoldenRun con el resultado de los experimentos.
