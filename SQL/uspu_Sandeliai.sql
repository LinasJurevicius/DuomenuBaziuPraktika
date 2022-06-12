if exists (select 1 from sysobjects where name = 'uspu_Sandeliai')
drop procedure uspu_Sandeliai
go

create procedure uspu_Sandeliai
  @poValue int = null output,
	@piSandeliaiId int = null,
  @piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAdresaiId int = null,
	@piSandeliuGrupesId int = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255)
	

select @poValue = -1

select 
	@vCurrKodas = Kodas
from SandeliuVietos
where SandeliaiId = @piSandeliaiId

update Sandeliai set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	Pavadinimas = @piPavadinimas,
	AdresaiId = @piAdresaiId,
	SandeliuGrupesId = @piSandeliuGrupesId
where SandeliaiId = @piSandeliaiId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

