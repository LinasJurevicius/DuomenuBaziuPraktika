if exists (select 1 from sysobjects where name = 'uspv_SandeliuGrupes')
drop procedure uspv_SandeliuGrupes
go

create procedure uspv_SandeliuGrupes
  @poValue int = null output,
	@piSandeliuGrupesId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		SandeliuGrupesId = SandeliuGrupesId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from SandeliuGrupes

if @piEditForm = 1
	select 
		SandeliuGrupesId = SandeliuGrupesId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from SandeliuGrupes
	where SandeliuGrupesId = @piSandeliuGrupesId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

