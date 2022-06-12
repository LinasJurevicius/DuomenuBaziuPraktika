if exists (select 1 from sysobjects where name = 'uspi_Partneriai')
drop procedure uspi_Partneriai
go

create procedure uspi_Partneriai
  @poValue int = null output,
	@piPavadinimas nvarchar(255) = null,
	@piAdresaiId int = null,
	@piImonesKodas nvarchar(50) = null,
	@piPVMKodas nvarchar(50) = null
as

declare @vError nvarchar(max), @vNewRecId int, @vPartneriaId int
	

select @poValue = -1

select @vPartneriaId = max(PartneriaiId)
from Partneriai

insert into Partneriai(
	Pavadinimas,
	AdresaiId,
	ImonesKodas,
	PVMKodas
)
values(
	@piPavadinimas,
	@piAdresaiId,
	@piImonesKodas,
	@piPVMKodas)

	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

