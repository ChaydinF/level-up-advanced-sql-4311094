WITH cte AS (
SELECT strftime('%Y', soldDate) AS soldYear, --fomato de fechas sqlite
  salesAmount
FROM sales
)
SELECT soldYear, 
  FORMAT("$%.2f", sum(salesAmount)) AS AnnualSales --formato de numero agrengando simbolo de dolares y 2 decimales despues del punto
FROM cte
GROUP BY soldYear
ORDER BY soldYear
