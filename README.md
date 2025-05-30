# Detección y Clasificación de Queratocono  

### Zahid Medrano Flores  <p align="right">zahidmedrano@ciencias.unam.mx &emsp;</p>

Temas Selectos en Biomatemáticas – Introducción a la Ciencia de Datos  
Facultad de Ciencias, UNAM  
**Semestre**: 2025-2  

---

## Descripción del Proyecto  

<p align="justify"> Se realizó un modelo predictivo con diversas técnicas de aprendizaje automático para la detección y clasificación de las diversas etapas del queratocono, una enfermedad progresiva que adelgaza la córnea y a su vez empeora la agudeza visual de la persona afectada.
Se realizaron pruebas de varios modelos, reducciones de dimensionalidad del dataset y ajustes de hiperparámetros para obtener los mejores resultados. 

-- Véase el reporte completo, para una explicación mas detallada del proceso y aplicaciones de los modelos. [Reporte](/Reporte.pdf) --

---

## Dataset  
<p align="center"> Dataset compuesto de 3162 muestras con 448 características. &emsp;</p>

[Keratoconus Stage Detection en Kaggle](https://www.kaggle.com/datasets/imenbakir/keratoconus-stage-detection)  
---

## Resultados 

De los 3 modelos finales utilizados se obtuvieron los siguientes resultados.

| Modelo                    | Exactitud | Precisión |
|---------------------------|-----------|-----------|
| Random Forest             | 96.21%    | 96.20%    |
| **RF + GridSearchCV**     | **97.16%**| **97.15%**|
| RF + RandomizedSearchCV   | 96.84%    | 96.83 %   |

<p align="middle">
  <img src="https://github.com/user-attachments/assets/0dad26f0-78cd-48ab-b684-bf3f53f35698" width="32%" />
  <img src="https://github.com/user-attachments/assets/ef4da125-fb78-487a-81c7-dad674e72d9e" width="32%" /> 
  <img src="https://github.com/user-attachments/assets/48b44f06-2302-48f7-9508-078d897646f7" width="32%" />
</p>



---
Para replicar el proyecto, puedes clonar el repositorio e instalar todas las dependencias necesarias. El notebook principal se llama [ProyectoDeteccionQueratocono.ipynb](/ProyectoDeteccionQueratocono.ipynb).

```bash
git clone https://github.com/zamef/ProyectoTSBM
cd ProyectoTSBM
``` 
