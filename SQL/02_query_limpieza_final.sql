USE PortafolioVentas;
GO

-- CTE: Prepara los datos brutos, filtra, y calcula el valor de la transacción

WITH Ventas_Transacciones_Limpias AS (
    SELECT
        FV.InvoiceNo,
        FV.InvoiceDate,
        DC.Country,
        DP.Description,
        FV.Quantity,
        FV.UnitPrice,
        (FV.Quantity * FV.UnitPrice) AS VentaTotal -- Calculo de una métrica clave
    FROM
        Fact_Ventas FV
    INNER JOIN
        Dim_Clientes DC ON FV.CustomerID = DC.CustomerID -- Une la transacción con el cliente
    INNER JOIN
        Dim_Productos DP ON FV.StockCode = DP.StockCode -- Une la transacción con el producto
    WHERE
        FV.CustomerID IS NOT NULL -- FILTRO 1: Solo clientes identificados
        AND FV.InvoiceNo NOT LIKE 'C%' -- FILTRO 2: Excluir transacciones canceladas
        AND (FV.Quantity * FV.UnitPrice) > 0 -- FILTRO 3: Excluir transacciones nulas o de prueba
        AND FV.StockCode NOT IN ( -- FILTRO 4: Excluir códigos de servicio/ajuste/basura
            'AMAZONFEE', 'BANK CHARGES', 'POST', 'M', 'D', 'C2', 'S', 'DOT', 'CRUK', 'PADS', 'B'
        )
        AND FV.StockCode NOT LIKE 'gift%' -- Excluye todas las tarjetas de regalo
        AND FV.StockCode NOT LIKE 'DCGS%' -- Excluye códigos de sets/digitales
)

-- Selecciona los resultados finales y aplica una WINDOW FUNCTION para el análisis de tendencias

SELECT
    InvoiceDate,
    Country,
    Description,
    VentaTotal,
	Quantity,
    -- WINDOW FUNCTION: Calcula la venta acumulada por país ordenada por fecha
    SUM(VentaTotal) OVER (PARTITION BY Country ORDER BY InvoiceDate) AS VentaAcumuladaPais
FROM
    Ventas_Transacciones_Limpias
ORDER BY
    Country, InvoiceDate;