if exists (select 1 from sysobjects where name = 'uspu_Prekes')
drop procedure uspu_Prekes
go

create procedure uspu_Prekes
  @poValue int = null output,
	@piPrekesId int = null,
  @piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piBarkodas nvarchar(255) = null,
	@piPrekiuTipaiId int = null,
	@piKiekis float = null,
	@piPartneriaiId int = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrBarkodas nvarchar(255), @vCurrKiekis float, @vCurrPrekiuTipaiId int, @vCurrPartneriaiId int
	

select @poValue = -1

select 
	@vCurrKodas = Kodas
from Prekes
where PrekesId = @piPrekesId

update Prekes set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	Pavadinimas = @piPavadinimas,
	Barkodas = @piBarkodas,
	PrekiuTipaiId = @piPrekiuTipaiId,
	Kiekis = @piKiekis,
	PartneriaiId = @piPartneriaiId
where PrekesId = @piPrekesId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

