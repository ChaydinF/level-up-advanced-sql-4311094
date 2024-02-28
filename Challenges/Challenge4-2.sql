SELECT 
   strftime('%Y',soldDate) Anual
  ,strftime('%m',soldDate) Mensual
  ,salesAmount
FROM sales S
WHERE soldDate>='2022-01-01'
ORDER BY Anual,Mensual;


SELECT 
   strftime('%Y',soldDate) Anual
  ,strftime('%m',soldDate) Mensual
  ,FORMAT("$%.2f", SUM(salesAmount)) Suma
FROM sales S
WHERE soldDate>='2022-01-01'
GROUP BY Anual,Mensual
ORDER BY Anual,Mensual;

SELECT 
   strftime('%Y',soldDate) Anual
  ,strftime('%m',soldDate) Mensual
  ,FORMAT("$%.2f",SUM(salesAmount) OVER(PARTITION BY (strftime('%Y',soldDate)) 
                         ORDER BY strftime('%Y',soldDate) 
                                  ,strftime('%m',soldDate))) AS Suma
FROM sales S
WHERE soldDate>='2022-01-01'
GROUP BY Anual,Mensual;

/*Solución de la maestra*/
with cte_sales as (
SELECT strftime('%Y', soldDate) AS Anio, 
  strftime('%m', soldDate) AS Mes,
  SUM(salesAmount) Suma
FROM sales
GROUP BY Anio, Mes
)
SELECT Anio, Mes, 
  FORMAT("$%.2f",SUM(Suma) OVER (
    PARTITION BY Anio 
    ORDER BY Anio, Mes)) AS Suma
FROM cte_sales
ORDER BY Anio, Mes