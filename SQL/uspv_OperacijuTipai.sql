if exists (select 1 from sysobjects where name = 'uspv_OperacijuTipai')
drop procedure uspv_OperacijuTipai
go

create procedure uspv_OperacijuTipai
  @poValue int = null output,
	@piOperacijuTipaiId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		OperacijuTipaiId = OperacijuTipaiId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from OperacijuTipai

if @piEditForm = 1
	select 
		OperacijuTipaiId = OperacijuTipaiId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from OperacijuTipai
	where OperacijuTipaiId = @piOperacijuTipaiId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

