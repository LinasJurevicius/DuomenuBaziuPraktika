if exists (select 1 from sysobjects where name = 'uspu_PrekiuPartijos')
drop procedure uspu_PrekiuPartijos
go

create procedure uspu_PrekiuPartijos
  @poValue int = null output,
	@piPrekiuPartijosId int = null,
  @piKodas nvarchar(255) = null,
	@piSerijosNumeris int = null,
	@piKiekis float = null,
	@piPrekesId int = null,
	@piGaliojimoData datetime = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrSerijosNumeris int, @vCurrKiekis float, @vCurrPrekesId int, @vCurrGaliojimoData datetime
	

select @poValue = -1

select 
	@vCurrKodas = Kodas
from PrekiuPartijos
where PrekiuPartijosId = @piPrekiuPartijosId

update PrekiuPartijos set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	SerijosNumeris = @piSerijosNumeris,
	Kiekis = @piKiekis,
	PrekesId = @piPrekesId,
	GaliojimoData = @piGaliojimoData
where PrekiuPartijosId = @piPrekiuPartijosId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

