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
| Random Forest             | 96.16%    | 96.10%    |
| **RF + GridSearchCV**     | **97.47%**| **97.43%**|
| RF + RandomizedSearchCV   | 96.99%    | 96.94%   |

<p align="middle">
  <img src="https://github.com/user-attachments/assets/f3fbe900-9322-4778-ac72-d332c0f1e516" width="32%" /> 
  <img src="https://github.com/user-attachments/assets/844877c7-efa9-43a8-a1d6-b24e030c10c7" width="32%" />
  <img src="https://github.com/user-attachments/assets/f84a536b-1ea9-494e-bb8b-86d875e41e42" width="32%" />
</p>

---
Para replicar el proyecto, puedes clonar el repositorio e instalar todas las dependencias necesarias. El notebook principal se llama [ProyectoDeteccionQueratocono.ipynb](/ProyectoDeteccionQueratocono.ipynb).

```bash
git clone https://github.com/zamef/ProyectoTSBM
cd ProyectoTSBM
``` 
