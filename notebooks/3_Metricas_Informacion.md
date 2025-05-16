# 3: Métricas y Herramientas Utilizadas  

En este proyecto se evaluarán distintas métricas para comparar el rendimiento entre una Máquina Virtual (VM) y un Contenedor Docker. Las herramientas seleccionadas permitirán realizar pruebas en CPU, memoria y disco, así como obtener estadísticas detalladas del sistema.  

---

## 3.1 Métricas Evaluadas  

| **Métrica**           | **Descripción**                                                                 | **Herramienta**     |
|------------------------|----------------------------------------------------------------------------------|----------------------|
| **CPU**               | Evaluación de operaciones por segundo y cálculo de números primos.              | `sysbench`          |
| **Memoria RAM**       | Pruebas de lectura y escritura en memoria, latencia y ancho de banda.            | `sysbench`          |
| **Almacenamiento**    | Velocidad de lectura/escritura en disco, IOPS (operaciones de entrada/salida por segundo). | `sysbench`          |
| **Consumo de Recursos** | Monitoreo de uso de CPU, memoria y almacenamiento durante las pruebas.         | `psutil`, `docker stats` |
| **Tiempo de Ejecución** | Registro del tiempo total que toma cada prueba.                                | `time`              |

---

## 3.2 Herramientas Utilizadas  

| **Herramienta**       | **Descripción**                                                                 |
|------------------------|----------------------------------------------------------------------------------|
| **sysbench**          | Benchmark de alto rendimiento para pruebas de CPU, memoria y disco.             |
| **psutil**            | Librería de Python para monitorear el uso de CPU, memoria y disco en tiempo real. |
| **docker stats**      | Comando para visualizar el uso de recursos en contenedores Docker.              |
| **time**              | Herramienta para medir el tiempo de ejecución de procesos.                      |
| **jq**                | Herramienta para procesar y filtrar JSON en la línea de comandos.               |