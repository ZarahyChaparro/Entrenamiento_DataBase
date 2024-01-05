USE [Veterinaria]
GO

/****** Object:  View [dbo].[VistaAnimalesPropietario]    Script Date: 5/01/2024 3:32:09 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[VistaAnimalesPropietario] AS
SELECT
    A.id,
    A.Nombre AS NombreAnimal,
    A.Especie,
    A.Raza,
    A.Edad,
    A.Sexo,
    A.HistorialMedico,
	A.idPropietario,
    P.Nombre AS NombrePropietario,
    P.Direccion,
    P.Telefono,
    P.CorreoElectronico
   
FROM
    dbo.Animal A
JOIN
    Propietario P ON A.idPropietario = P.idPropietario;

SELECT
    Animal.id,
    Animal.Nombre AS NombreAnimal,
    Propietario.Nombre AS NombrePropietario
FROM
    Animal
INNER JOIN
    Propietario ON Animal.idPropietario = Propietario.idPropietario;


GO


