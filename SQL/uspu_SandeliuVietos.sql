if exists (select 1 from sysobjects where name = 'uspu_SandeliuVietos')
drop procedure uspu_SandeliuVietos
go

create procedure uspu_SandeliuVietos
  @poValue int = null output,
	@piSandeliuVietosId int = null,
  @piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piSandeliaiId int = null,
	@piPrekiuPartijosId int = null,
	@piSandeliuVietuTipuId int = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255)
	

select @poValue = -1

select 
	@vCurrKodas = Kodas
from SandeliuVietos
where SandeliuVietosId = @piSandeliuVietosId

update SandeliuVietos set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	Pavadinimas = @piPavadinimas,
	SandeliaiId = @piSandeliaiId,
	PrekiuPartijosId = @piPrekiuPartijosId,
	SandeliuVietuTipaiId = @piSandeliuVietuTipuId
where SandeliuVietosId = @piSandeliuVietosId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

