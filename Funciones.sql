USE [Veterinaria]
GO
/****** Object:  UserDefinedFunction [dbo].[CalcularEdadPromedio]    Script Date: 5/01/2024 12:46:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
ALTER FUNCTION [dbo].[CalcularEdadPromedio](@idPropietario INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @EdadPromedio DECIMAL(10, 2);

    SELECT @EdadPromedio = AVG(Edad)
    FROM Animal
    WHERE idPropietario = @idPropietario;

    RETURN ISNULL(@EdadPromedio, 0);
END;


/**DECLARE @PropietarioIDConsulta INT = 1;
SELECT dbo.CalcularEdadPromedio(@PropietarioIDConsulta) AS EdadPromedioAnimales;**/
