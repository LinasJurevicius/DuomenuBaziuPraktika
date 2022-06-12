if exists (select 1 from sysobjects where name = 'uspv_SandeliuVietuTipai')
drop procedure uspv_SandeliuVietuTipai
go

create procedure uspv_SandeliuVietuTipai
  @poValue int = null output,
	@piSandeliuVietuTipuId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		SandeliuVietuTipuId = SandeliuVietuTipaiId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from SandeliuVietuTipai

if @piEditForm = 1
	select 
		SandeliuVietuTipuId = SandeliuVietuTipaiId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from SandeliuVietuTipai
	where SandeliuVietuTipaiId = @piSandeliuVietuTipuId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

