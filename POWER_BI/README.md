Este archivo (`dashboard_ventas.pbix`) contiene el modelo de datos final y el panel ejecutivo de análisis de ventas.

## 1. Estructura del Modelo (Modelado de Datos)

El modelo fue diseñado con un esquema estrella (Star Schema) simple para optimizar el rendimiento y la aplicación de Time Intelligence:

1.  **Tabla de Hechos:** `analisis_final_powerbi` (Conectada directamente al CSV limpio).
2.  **Tabla de Dimensiones:** `Calendar` (Creada en DAX para garantizar la continuidad de las fechas).

**Relación Clave:** Se estableció una relación **1 a Muchos (1:\*)** entre la columna `Date` de la tabla `Calendar` y la columna `InvoiceDate` de la tabla de hechos. La tabla `Calendar` está **marcada como Tabla de Fechas**.

## 2. Métricas (DAX) Implementadas

Se utilizaron las siguientes medidas para crear la lógica de negocio y los indicadores clave de rendimiento (KPIs):

| Nombre de la Medida | Fórmula y Uso |
| :--- | :--- |
| **`Ventas Netas Totales`** | `SUM('analisis_final_powerbi'[VentaTotal])`. Métrica base de ingresos. |
| **`Ventas YTD`** | `TOTALYTD([Ventas Netas Totales], 'Calendar'[Date])`. Usada para medir el desempeño acumulado del año (KPI). |
| **`Total Unidades`** | `SUM('analisis_final_powerbi'[Quantity])`. Usada para analizar el volumen de ventas por producto/país. |
| **`Precio Promedio Venta`** | Mide el valor promedio del artículo vendido (`[Ventas Netas Totales] / [Total Unidades]`). |

## 3. Características Clave del Dashboard

El panel de una sola página está diseñado para ofrecer un contraste fuerte (fondo oscuro) y comunica los siguientes *insights*:

* **Liderazgo de KPI (Tarjetas):** Uso del filtro **Top N (Superior 1)** en la tarjeta de país para mostrar el **`País Principal`** por rendimiento.
* **Análisis Dual de País:** El gráfico de **Barras** muestra la distribución de **Ingresos** (`Ventas Netas Totales` por País), mientras que el gráfico de **Anillos** muestra la distribución de **Volumen** (`Total Unidades` por País), evitando la redundancia y añadiendo una capa de análisis.
* **Tendencias:** Uso de la métrica `Venta Acumulada País` (calculada en SQL) en el gráfico de líneas para mostrar el rendimiento histórico por país.
