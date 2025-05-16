# Parte Final: Conclusiones y Evaluación Global

## 1. Comparación General de Resultados

### Memoria
- **VM:** La tasa de transferencia de memoria fue menor comparada con Docker, con un throughput aproximado de X MiB/s y una latencia promedio de Y ms.
- **Docker:** Mostró un mejor desempeño en memoria, alcanzando throughput de aproximadamente X' MiB/s y latencia promedio menor, lo que indica mayor eficiencia en operaciones de memoria.

### Disco
- **VM:** El rendimiento en disco mostró tasas de lectura y escritura moderadas, con throughput de lectura y escritura de aproximadamente A y B MiB/s respectivamente, y una latencia promedio de C ms.
- **Docker:** Presentó un desempeño inferior en throughput de lectura/escritura, pero con una latencia promedio similar, posiblemente debido a la sobrecarga del sistema de archivos en contenedores.

### CPU
- **VM:** Procesó aproximadamente M eventos por segundo con una latencia promedio de N ms.
- **Docker:** Mostró un desempeño similar, aunque ligeramente superior en eventos por segundo y con una latencia comparable, evidenciando que la virtualización ligera de Docker no penaliza la CPU significativamente.

### Boot Time
- **VM:** El tiempo total de arranque fue considerablemente mayor, debido al tiempo requerido para iniciar un sistema operativo completo, con un promedio total de P segundos.
- **Docker:** El arranque fue mucho más rápido, aproximadamente Q segundos, ya que solo se inicia el contenedor sin el overhead de un sistema operativo completo.

## 2. Ventajas y Desventajas

| Característica        | Máquina Virtual (VM)                              | Contenedor Docker                                |
|----------------------|--------------------------------------------------|-------------------------------------------------|
| **Aislamiento**       | Excelente, con kernel separado y entorno completo| Buen aislamiento, pero comparte kernel          |
| **Uso de Recursos**   | Mayor consumo de CPU, memoria y almacenamiento   | Mucho más eficiente y ligero                     |
| **Desempeño**         | Ligera penalización en memoria y disco           | Mejor desempeño en memoria, CPU casi igual      |
| **Portabilidad**      | Menos portable debido a imagenes grandes         | Altamente portable y fácil de desplegar         |
| **Tiempo de Arranque**| Más lento, desde segundos hasta minutos          | Muy rápido, en segundos                          |

## 3. Limitaciones del Análisis

- Los benchmarks están realizados en un entorno controlado, que puede no representar todas las cargas de trabajo del mundo real.  
- No se evaluaron otros factores importantes como la seguridad, administración de red, o compatibilidad con hardware específico.  
- El tamaño y configuración específica de las máquinas VM y los contenedores pueden influir en los resultados.  
- Los resultados pueden variar dependiendo del sistema operativo anfitrión y la configuración de hardware.

## 4. Conclusión Final

En base a los resultados obtenidos, se puede concluir que:

- **Docker** es una solución altamente eficiente para aplicaciones que requieren rápida puesta en marcha, menor consumo de recursos y portabilidad, con un rendimiento muy competitivo en CPU y memoria.  
- **Las máquinas virtuales** siguen siendo ideales cuando se requiere un aislamiento completo o se necesitan sistemas operativos distintos en la misma máquina física, a costa de mayor consumo y tiempo de arranque.  
- La elección entre VM y Docker debe basarse en el caso de uso específico, balanceando la necesidad de aislamiento, rendimiento y flexibilidad.

Esta evaluación comparativa provee una base sólida para entender las diferencias y ayudar en la toma de decisiones en proyectos de virtualización y despliegue.

---

**Autor:** [Felix Rodrigo Manrique Bejarano]  
**Fecha:** [16/05/2025]  
**Proyecto:** Evaluación comparativa de rendimiento entre VM y Docker