-- Los que coinciden

SELECT cus.firstName, cus.lastName, cus.email, sls.salesAmount, sls.soldDate
FROM customer cus
INNER JOIN sales sls
    ON cus.customerId = sls.customerId
UNION
-- Los que estan en Customer pero no en sales
SELECT cus.firstName, cus.lastName, cus.email, sls.salesAmount, sls.soldDate
FROM customer cus
LEFT JOIN sales sls
    ON cus.customerId = sls.customerId
WHERE sls.salesId IS NULL
UNION
-- Los que estan en sales pero no en Customer
SELECT cus.firstName, cus.lastName, cus.email, sls.salesAmount, sls.soldDate
FROM sales sls
LEFT JOIN customer cus
    ON cus.customerId = sls.customerId
WHERE cus.customerId IS NULL;

                        --NOTA  SUPER IMPORTANTE--
/*La diferencia entre UNION y UNION ALL es que UNION elimina los
duplicados y UNION ALL no. Peeeeeero si sabemos que no habrá duplicados
es mejor usar UNION ALL porque te da un mejor performance*/