CREATE OR ALTER FUNCTION funGetAccountName(@P_AccountNumber VARCHAR(15))
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @name VARCHAR(50);

    IF @P_AccountNumber IS NULL
        SET @name = 'UNDEFINED';
    ELSE
        SELECT 
            @name = name 
        FROM Purchasing.Vendor pv
        WHERE pv.AccountNumber = @P_AccountNumber;

	RETURN @name
END;