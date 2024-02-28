WITH cte AS(
SELECT 
  E.employeeId
  ,E.firstName
  ,E.lastName
  ,M.modelId
  ,M.model
  ,COUNT(M.modelId) AS ConteoModelos
FROM employee E 
INNER JOIN sales S 
ON E.employeeId=S.employeeId
INNER JOIN inventory I
ON S.inventoryId=I.inventoryId
INNER JOIN model M
ON I.modelId=M.modelId
GROUP BY E.employeeId
        ,E.firstName
        ,E.lastName
        ,M.modelId
        ,M.model
)
SELECT
  employeeId
  ,firstName
  ,lastName
  ,modelId
  ,model
  ,MAX(ConteoModelos) MasVendidos
FROM cte
GROUP BY employeeId
        ,firstName
        ,lastName
ORDER BY employeeId


----solucion real porque pidio usar una función ventana (over)-----
SELECT emp.firstName, emp.lastName, mdl.model,
  count(model) AS NumberSold,
  rank() OVER (PARTITION BY sls.employeeId 
              ORDER BY count(model) desc) AS Rank
FROM sales sls
INNER JOIN employee emp
  ON sls.employeeId = emp.employeeId
INNER JOIN inventory inv
  ON inv.inventoryId = sls.inventoryId
INNER JOIN model mdl
  ON mdl.modelId = inv.modelId
GROUP BY emp.firstName, emp.lastName, mdl.model