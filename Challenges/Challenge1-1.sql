SELECT *
FROM Employee

SELECT E.firstName,E.lastName, M.firstName AS managerName, M.lastName AS managerLastname
FROM employee E
JOIN employee M
ON E.employeeId = M.managerId 
ORDER BY E.firstName
