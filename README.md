# Comparativa de Rendimiento: Máquina Virtual vs Docker

Este proyecto evalúa y compara el rendimiento de una Máquina Virtual (VM) y un contenedor Docker utilizando pruebas de benchmark en CPU, memoria, disco y tiempo de arranque.

### setup_project.sh
- El script instala dependencias, configura permisos de Docker y crea la estructura básica para un proyecto de benchmarks entre VM y Docker

## Estructura del Proyecto

- `notebooks/`: Jupyter Notebooks y documentación del proceso, configuración, benchmarks y análisis de resultados.
- `results/`: Resultados de las pruebas (archivos `.txt`, `.csv`, `.png`).
- `scripts/`: Scripts de instalación y utilidades (`Dockerfile`, `.sh`).

## Cómo ejecutar los benchmarks

1. **Preparar el entorno**  
   Ejecuta los scripts de [`scripts/vm_setup.sh`](scripts/vm_setup.sh) o [`scripts/docker_setup.sh`](scripts/docker_setup.sh) según el entorno.
2. **Ejecutar los notebooks**  
   Abre y sigue los pasos en los notebooks en este orden:
   - [`1_Introduccion.md`](notebooks/1_Introduccion.md)
   - [`2_Configuracion_del_entorno.ipynb`](notebooks/2_Configuracion_del_entorno.ipynb)
   - [`3_Metricas_config_notebook.ipynb`](notebooks/3_Metricas_config_notebook.ipynb)
   - [`4_benchmark.ipynb`](notebooks/4_benchmark.ipynb)
   - [`5_Analisis_de_resultados.ipynb`](notebooks/5_Analisis_de_resultados.ipynb)
   - [`6_conclusiones.md`](notebooks/6_conclusiones.md)

3. **Ver resultados**  
   Los resultados numéricos y gráficos se guardan en [`results/`](results/).

## Herramientas utilizadas

- [`sysbench`](https://github.com/akopytov/sysbench): Benchmarks de CPU, memoria y disco.
- [`psutil`](https://github.com/giampaolo/psutil): Monitoreo de recursos en Python.
- Docker y VirtualBox para los entornos de prueba.

## Resultados

- Comparación detallada en [`notebooks/5_Analisis_de_resultados.ipynb`](notebooks/5_Analisis_de_resultados.ipynb) y [`results/comparison_vm_docker.csv`](results/comparison_vm_docker.csv).
- Gráficos en [`results/comparison_vm_docker.png`](results/comparison_vm_docker.png).

## Autor

Felix Rodrigo Manrique Bejarano

---
