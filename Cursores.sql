-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE MostrarInformacionAnimales
AS
BEGIN
    DECLARE @id INT;
    DECLARE @NombreAnimal VARCHAR(50);
    DECLARE @PropietarioNombre VARCHAR(50);

    -- Declarar e inicializar el cursor
    DECLARE AnimalCursor CURSOR FOR
    SELECT
        A.idPropietario,
        A.Nombre AS NombreAnimal,
        P.Nombre AS NombrePropietario
    FROM
        Animal A
    INNER JOIN
        Propietario P ON A.idPropietario = P.idPropietario;

    -- Abrir el cursor
    OPEN AnimalCursor;

    -- Inicializar variables
    FETCH NEXT FROM AnimalCursor INTO @id, @NombreAnimal, @PropietarioNombre;

    -- Recorrer el cursor
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Procesar la fila actual
        PRINT 'ID Animal: ' + CAST(@id AS VARCHAR(10)) + ', Nombre Animal: ' + @NombreAnimal + ', Propietario: ' + @PropietarioNombre;

        -- Obtener la siguiente fila
        FETCH NEXT FROM AnimalCursor INTO @id, @NombreAnimal, @PropietarioNombre;
    END;

    -- Cerrar y desasociar el cursor
    CLOSE AnimalCursor;
    DEALLOCATE AnimalCursor;
END;
