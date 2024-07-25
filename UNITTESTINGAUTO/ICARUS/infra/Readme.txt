Infraestructura generada automáticamente para generación de experimentos para la campaña inyección de fallos:
	- config.json: Descripción de experimentos en formato json.
	- infratest.sh: Script que genera las carpetas test copiando los archivos config,makefile y ParametricTest.
	- Carpeta source: Se aloja el código de descripción hardware del componente utilizado.
	- Makefile y ParametricTest.py: Archivo donde se describe la ejecución de test y archivo make necesario para su ejecución.
	- GoldenRun.py : Archivo con test inicial sin inyección de fallos fallos.
	- goldenrun.xml: Resultados de le ejecución sin inyección para compararlos con los resultados de los experimentos.
	- Archivos xml con los resultados de cada experimento, nombrados como las carpetas correspondientes. 
	- compare_signals.py: Script que compara los archivos xml con una Goldenrun.xml
