if exists (select 1 from sysobjects where name = 'uspu_Partneriai')
drop procedure uspu_Partneriai
go

create procedure uspu_Partneriai
  @poValue int = null output,
	@piPartneriaiId int = null,
  @piPavadinimas nvarchar(255) = null,
	@piAdresaiId int = null,
	@piImonesKodas nvarchar(50) = null,
	@piPVMKodas nvarchar(50) = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrImonesKodas nvarchar(255), 
	@vCurrPVMKodas nvarchar(255)
	

select @poValue = -1

select 
	@vCurrPavadinimas = Pavadinimas
from Partneriai
where PartneriaiId = @piPartneriaiId

update Partneriai set
	Pavadinimas = case when @piPavadinimas is not null then @piPavadinimas else @vCurrPavadinimas end,
	AdresaiId = @piAdresaiId,
	ImonesKodas = @piImonesKodas,
	PVMKodas = @piImonesKodas
where PartneriaiId = @piPartneriaiId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

