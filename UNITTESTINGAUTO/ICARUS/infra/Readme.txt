Infraestructura generada automáticamente para generación de experimentos para la campaña inyección de fallos:
	- config.json: Descripción de experimentos en formato json.
	- infratest.sh: Script que genera las carpetas test copiando los archivos config,makefile y ParametricTest.
	- Carpeta source: Se aloja el código de descripción hardware del componente utilizado
	- Makefile y ParametricTest.py: Archivo donde se describe la ejecución de test y archivo make necesario para su ejecución.
	- Archivos xml con los resultados de cada experimento, nombrados como las carpetas correspondientes. 
	- compare_signals.py: Script que compara los archivos xml con una Goldenrun.xml
