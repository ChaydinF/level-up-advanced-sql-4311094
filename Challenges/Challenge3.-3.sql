SELECT 
    I.inventoryId
    ,I.modelId
    ,I.colour
    ,I.year
    ,I.isAvailable
    ,M.model
    ,M.EngineType
FROM inventory I
INNER JOIN model M
  ON I.modelId = M.modelId
WHERE EngineType = 'Electric';

SELECT salesId
      ,customerId
      ,employeeId
      ,salesAmount
      ,soldDate
FROM sales
where inventoryId IN (SELECT 
                          I.inventoryId
                      FROM inventory I
                      INNER JOIN model M
                        ON I.modelId = M.modelId
                      WHERE EngineType = 'Electric');