SELECT 
  E.employeeId
  ,E.firstName
  ,E.lastName
  ,SUM(S.salesAmount) SalesSum
  ,COUNT(S.salesId) CountSales
FROM employee E
INNER JOIN sales S 
  ON E.employeeId = S.employeeId
WHERE strftime('%Y', S.soldDate) >= '2023'
GROUP BY E.employeeId
        ,E.firstName
        ,E.lastName
HAVING CountSales >=5        
ORDER BY CountSales DESC


