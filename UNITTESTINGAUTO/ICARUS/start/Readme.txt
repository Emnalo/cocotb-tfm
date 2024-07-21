Generación de experimentos para la campaña inyección de fallos mediante test python que combina inyección y testbench:
	- Parametric_test: Test que tiene 2 corrutinas, una de testbench y otra de inyección
	- Makefile y StartTest.py: Archivo donde se describe la ejecución de test y archivo make necesario para su ejecución.
	- Archivos xml con los resultados de cada experimento, nombrados como las carpetas correspondientes. 
	- compare_signals.py: Script en Python para comparar la GoldenRun con el resultado de los experimentos.
