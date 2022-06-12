if exists (select 1 from sysobjects where name = 'uspv_Teises')
drop procedure uspv_Teises
go

create procedure uspv_Teises
  @poValue int = null output,
	@piTeisesId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		TeisesId = TeisesId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from Teises

if @piEditForm = 1
	select 
		TeisesId = TeisesId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from Teises
	where TeisesId = @piTeisesId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

