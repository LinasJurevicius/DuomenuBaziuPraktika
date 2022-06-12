if exists (select 1 from sysobjects where name = 'uspv_PrekiuTipai')
drop procedure uspv_PrekiuTipai
go

create procedure uspv_PrekiuTipai
  @poValue int = null output,
	@piPrekiuTipaiId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		PrekiuTipaiId = PrekiuTipaiId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from PrekiuTipai

if @piEditForm = 1
	select 
		PrekiuTipaiId = PrekiuTipaiId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from PrekiuTipai
	where PrekiuTipaiId = @piPrekiuTipaiId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

