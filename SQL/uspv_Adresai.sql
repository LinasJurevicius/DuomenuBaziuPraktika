if exists (select 1 from sysobjects where name = 'uspv_Adresai')
drop procedure uspv_Adresai
go

create procedure uspv_Adresai
  @poValue int = null output,
	@piAdresaiId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		AdresaiId = AdresaiId,
		Salis = Salis,
		Miestas = Miestas,
		Adresas = Adresas
	from Adresai

if @piEditForm = 1
	select 
		AdresaiId = AdresaiId,
		Salis = Salis,
		Miestas = Miestas,
		Adresas = Adresas
	from Adresai
	where AdresaiId = @piAdresaiId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

