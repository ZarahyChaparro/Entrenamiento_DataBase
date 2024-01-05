DECLARE @idAnimal INT;
DECLARE @NombreAnimal VARCHAR(50);
DECLARE @PropietarioNombre VARCHAR(50);
DECLARE @RowCount INT = 1;

-- Obtener el número total de filas en la tabla Animal
DECLARE @TotalRows INT = (SELECT COUNT(*) FROM Animal);

-- Inicializar el índice
SET @idAnimal = 1;

-- Bucle WHILE para recorrer las filas
WHILE @RowCount <= @TotalRows
BEGIN
    -- Obtener información del animal actual
    SELECT
        @NombreAnimal = A.Nombre,
        @PropietarioNombre = P.Nombre
    FROM
        Animal A
    INNER JOIN
        Propietario P ON A.idPropietario = P.idPropietario
    WHERE
        A.id = @idAnimal;

    -- Procesar la información
    PRINT 'ID Animal: ' + CAST(@idAnimal AS VARCHAR(10)) + ', Nombre Animal: ' + @NombreAnimal + ', Propietario: ' + @PropietarioNombre;

    -- Incrementar el índice y el contador
    SET @idAnimal = @idAnimal + 1;
    SET @RowCount = @RowCount + 1;
END;