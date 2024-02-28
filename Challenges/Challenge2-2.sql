SELECT 
  E.employeeId
  ,E.firstName
  ,E.lastName
  ,MAX(S.salesAmount) Maximo
  ,MIN(S.salesAmount) Minimo
FROM employee E
INNER JOIN sales S
  ON E.employeeId = S.employeeId
WHERE strftime('%Y', S.soldDate) >= '2023'
--WHERE S.soldDate >= date('','start of year')
GROUP BY E.employeeId
        ,E.firstName
        ,E.lastName
ORDER BY E.employeeId
  
