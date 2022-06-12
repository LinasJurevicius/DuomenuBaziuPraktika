if exists (select 1 from sysobjects where name = 'uspi_Prekes')
drop procedure uspi_Prekes
go

create procedure uspi_Prekes
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piBarkodas nvarchar(255) = null,
	@piPrekiuTipaiId int = null,
	@piKiekis float = null,
	@piPartneriaiId int = null
as

declare @vError nvarchar(max), @vNewRecId int, @vPrekesId int
	

select @poValue = -1


select @vPrekesId = max(PrekesId)
from Prekes

insert into Prekes(
	Kodas,
	Pavadinimas,
	Barkodas,
	PrekiuTipaiId,
	Kiekis,
	PartneriaiId
)
values(
	@piKodas,
	@piPavadinimas,
	@piBarkodas,
	@piPrekiuTipaiId,
	@piKiekis,
	@piPartneriaiId)

	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

