SELECT 
   E.firstName
  ,E.lastName
FROM employee E
LEFT JOIN sales S
  ON E.employeeId= S.employeeId
WHERE S.employeeId IS NULL
AND E.title='Sales Person'

