if exists (select 1 from sysobjects where name = 'uspi_PrekiuPartijos')
drop procedure uspi_PrekiuPartijos
go

create procedure uspi_PrekiuPartijos
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piSerijosNumeris int = null,
	@piKiekis float = null,
	@piPrekesId int = null,
	@piGaliojimoData datetime = null
as

declare @vError nvarchar(max), @vNewRecId int, @vPrekiuPartijosId int
	

select @poValue = -1


select @vPrekiuPartijosId = max(PrekiuPartijosId)
from PrekiuPartijos

insert into PrekiuPartijos(
	Kodas,
	SerijosNumeris,
	Kiekis,
	PrekesId,
	PartijosData,
	GaliojimoData
)
values(
	@piKodas,
	@piSerijosNumeris,
	@piKiekis,
	@piPrekesId,
	getdate(),
	@piGaliojimoData)

	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

