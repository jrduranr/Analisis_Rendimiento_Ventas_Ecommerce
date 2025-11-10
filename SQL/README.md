Este directorio contiene los scripts SQL utilizados para la limpieza y preparación del conjunto de datos de ventas de Ecommerce.

## Scripts

### 01_setup_y_limpieza_inicial.sql

* **Propósito:** Crear la base de datos `PortafolioVentas`, definir el esquema de tablas (Fact y Dims), e importar los datos brutos desde el archivo CSV.
* **Acciones Clave:** Configuración de Claves Primarias y Foráneas, y uso de `BULK INSERT` o herramientas de importación.

### 02_query_limpieza_final.sql

* **Propósito:** Ejecutar la lógica de limpieza y transformación final para generar un conjunto de datos analítico listo para Power BI.
* **Filtros Aplicados:**
    * Exclusión de transacciones canceladas (`InvoiceNo NOT LIKE 'C%'`).
    * Exclusión de filas con `CustomerID` nulo.
    * Exclusión de códigos de stock de servicio (`'POST', 'M', 'D', 'C2'`, etc.).
* **Métricas Calculadas:**
    * `VentaTotal` (`FV.Quantity * FV.UnitPrice`).
    * `VentaAcumuladaPais` (Usando `SUM() OVER (PARTITION BY Country ORDER BY InvoiceDate)` para análisis de tendencia).
