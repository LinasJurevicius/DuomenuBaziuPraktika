if exists (select 1 from sysobjects where name = 'uspu_Adresai')
drop procedure uspu_Adresai
go

create procedure uspu_Adresai
  @poValue int = null output,
	@piAdresaiId int = null,
  @piSalis nvarchar(255) = null,
	@piMiestas nvarchar(255) = null,
	@piAdresas nvarchar(255) = null
as

declare @vError nvarchar(max), @vCurrSalis nvarchar(255), @vCurrMiestas nvarchar(255), @vCurrAdresas nvarchar(255), 
	@vCurrAsmensKodas nvarchar(255)
	

select @poValue = -1

select 
	@vCurrSalis = Salis,
	@vCurrMiestas = Miestas,
	@vCurrAdresas = Adresas
from Adresai
where AdresaiId = @piAdresaiId

update Adresai set
	Salis = @piSalis,
	Miestas = @piMiestas,
	Adresas = @piAdresas
where AdresaiId = @piAdresaiId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

