# Análisis Comparativo: Máquinas Virtuales (VM) vs Contenedores Docker

---

## **CPU Benchmark**
La prueba de CPU mide el rendimiento en el cálculo de números primos, una operación intensiva en procesos computacionales. Los resultados obtenidos son los siguientes:

| Métrica          | VM         | Docker     |
|-------------------|------------|------------|
| Eventos por segundo | 836.47    | 849.49    |
| Latencia promedio (ms) | 1.19       | 1.18       |

**Análisis:**  
- Docker tuvo un desempeño ligeramente superior en eventos por segundo, lo cual indica una mayor capacidad de procesamiento en el mismo periodo de tiempo.
- La latencia promedio fue prácticamente igual en ambas tecnologías, pero Docker fue apenas más rápido.  
- Esto podría deberse a la menor sobrecarga que Docker tiene respecto a las VM, ya que comparte el kernel del sistema anfitrión y optimiza el uso de recursos.

**Conclusión:**  
Para operaciones de CPU intensivas, Docker ofrece un pequeño aumento en el rendimiento, aunque la diferencia no es drástica.

---

## **Memoria Benchmark**
Esta prueba mide la velocidad de transferencia y la latencia en operaciones de memoria. Los resultados son los siguientes:

| Métrica                 | VM             | Docker         |
|--------------------------|----------------|----------------|
| Throughput (MiB/s)     | 4536.36        | 4660.10       |
| Latencia promedio (ms) | 0.00 (prácticamente nula) | 0.00 (prácticamente nula) |

**Análisis:**  
- Docker nuevamente muestra un rendimiento superior, logrando mayor throughput (velocidad de transferencia).  
- La latencia es prácticamente imperceptible en ambos casos, por lo que no representa un factor de comparación.  

**Conclusión:**  
Docker aprovecha mejor los recursos de memoria debido a su integración directa con el sistema operativo, mientras que la VM sufre cierta penalización al gestionar memoria virtualizada.

---

## **Disco Benchmark**
La prueba de disco mide la capacidad de lectura y escritura, así como el throughput de datos. Los resultados obtenidos son:

| Métrica                     | VM         | Docker     |
|-----------------------------|------------|------------|
| Lecturas por segundo       | 447.81     | 494.29     |
| Escrituras por segundo     | 298.54     | 329.53     |
| Throughput de lectura (MiB/s) | 7.00       | 7.72       |
| Throughput de escritura (MiB/s) | 4.66       | 5.15       |
| Latencia promedio (ms)     | 0.58       | 0.53       |

**Análisis:**  
- Docker superó a la VM en todas las métricas: más operaciones de lectura y escritura por segundo, mayor throughput y menor latencia.  
- Este comportamiento es consistente con la naturaleza liviana de los contenedores, que no requieren un hipervisor para gestionar las operaciones de disco.  

**Conclusión:**  
Para aplicaciones que dependen de operaciones intensivas de disco, Docker es una opción más óptima en cuanto a velocidad y eficiencia.

---

## **Tiempo de Arranque**
El tiempo de arranque mide cuánto tardan en iniciar tanto la VM como el contenedor Docker.

| Métrica            | VM         | Docker     |
|---------------------|------------|------------|
| Tiempo de arranque | 28.19s     | 1.024s     |

**Análisis:**  
- Docker arranca en un tiempo **28 veces menor** al de una VM.  
- Esto tiene un gran impacto en entornos donde el escalado rápido y el despliegue ágil son necesarios.  

**Conclusión:**  
Para casos donde la rapidez de arranque es fundamental (e.g., microservicios, CI/CD), Docker es inmensamente superior.

---

## **Resumen General**
- En **CPU, Memoria y Disco**, Docker tiene una ligera ventaja sobre la VM.
- En **tiempo de arranque**, Docker es **drásticamente** superior.  
- Esto muestra que Docker optimiza mejor los recursos y reduce la sobrecarga al compartir el kernel del sistema operativo, mientras que las VM requieren virtualización completa.

---

### **Consideraciones Finales**
- Si se necesita un entorno completamente aislado, seguro y compatible con múltiples sistemas operativos, las VM son una excelente opción.  
- Si se prioriza la eficiencia, la velocidad y el uso reducido de recursos, Docker es la tecnología indicada.  
- La elección final depende del contexto de uso: **seguridad y aislamiento vs. rendimiento y escalabilidad**.
