# Analisis_Rendimiento_Ventas_Ecommerce
Análisis End-to-End de Rendimiento de Ventas E-commerce (2010-2011). Implementación de un modelo relacional en SQL Server, limpieza avanzada de datos ,funciones de ventana, y visualización de KPIs en Power BI.
# 📈 Análisis de Rendimiento de Ventas de Ecommerce (Portafolio de BI)

Este proyecto realiza un análisis completo de un dataset de transacciones de Ecommerce, demostrando habilidades en limpieza de datos (SQL), modelado de datos (Power BI) y generación de insights ejecutivos.

---

## 1. Objetivo del Proyecto

Analizar el desempeño de ventas para identificar tendencias clave, países de mayor rendimiento y la contribución de ingresos vs. volumen de los principales productos/países.

## 2. Herramientas Utilizadas

* **Bases de Datos:** SQL Server Management Studio (SSMS)
* **Lenguajes:** SQL (Limpieza y ETL), DAX (Modelado y Métricas)
* **Visualización:** Power BI Desktop
* **Control de Versiones:** Git y GitHub

## 3. Fases del Proyecto

### Fase I: Limpieza y Preparación de Datos (SQL)

* **Transformación:** Se realizó un proceso de ETL para limpiar datos erróneos (transacciones canceladas, precios nulos, códigos de servicio, etc.).
* **Métricas Creadas:** Se calculó la `VentaTotal` (`Quantity * UnitPrice`) y la **`VentaAcumuladaPais`** (para análisis de tendencia histórica por país).
* **Salida Final:** Generación del archivo `data/analisis_final_powerbi.csv` con datos limpios y agregados, listo para Power BI.

### Fase II: Modelado y Creación de la Lógica de Negocio (DAX)

* **Modelado:** Se creó una **Tabla Calendario** y se estableció una relación 1:\* con la tabla de hechos para permitir funciones de Time Intelligence.
* **Métricas (KPIs) Clave:**
    * `Ventas Netas Totales`
    * `Ventas YTD` (Year-to-Date)
    * `Total Unidades`
    * `Precio Promedio Venta`

### Fase III: Análisis y Visualización (Power BI)

* **Dashboard:** Se diseñó un panel ejecutivo (`dashboard_ventas.pbix`) con un tema oscuro y enfoque en KPIs.
* **Insights Clave:**
    * El **Reino Unido** (`United Kingdom`) es el país dominante tanto en ingresos como en volumen.
    * El tablero separa el análisis de **Ingreso** (`Venta Total por País`) y **Volumen** (`Volumen de Unidades Vendidas`) para dar una perspectiva más profunda del portafolio.
    * Se muestra la tendencia acumulada para evaluar el progreso anual.

---

## 4. Estructura del Repositorio
/Analisis_Rendimiento_Ventas_Ecommerce |-- /data | |-- análisis_final_powerbi.csv | |--DIM_Clientes.csv | |-- DIM_Productos.csv  | |-- Fact_Ventas.csv ||-- /sql | |-- 01_setup_y_limpieza_inicial.sql (Creación de tablas y carga inicial) | |-- 02_query_limpieza_final.sql (Query de limpieza y cálculo de VentaAcumuladaPais) |-- dashboard_ventas.pbix (Archivo final de Power BI) |
