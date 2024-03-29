USE [Veterinaria]
GO
/****** Object:  StoredProcedure [dbo].[Insert_Recommendations]    Script Date: 5/01/2024 3:34:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Insert_Recommendations]
	
	
	@idRecomendaciones Int,
	@Recomendacion Varchar(50),
	@TratamientoRecomendado Varchar(50),
	@idAnimal Int
	
	AS
BEGIN
	
	SET NOCOUNT ON;

    Insert 
	Into dbo.Recomendaciones([idRecomendaciones]
	,[Recomendacion]
	,[TratamientoRecomendado]
	,[idAnimal])

    VALUES (@idRecomendaciones
	,@Recomendacion
	,@TratamientoRecomendado
	,@idAnimal);


END
