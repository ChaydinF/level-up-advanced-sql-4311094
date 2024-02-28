SELECT 
  E.employeeId
  ,E.firstName
  ,E.lastName
  ,count(*) AS Conteo
FROM sales S
INNER JOIN employee E 
  ON S.employeeId= E.employeeId 
GROUP BY E.employeeId
        ,E.firstName
        ,E.lastName
ORDER BY Conteo DESC;