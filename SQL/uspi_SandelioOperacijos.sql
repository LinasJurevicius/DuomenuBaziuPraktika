if exists (select 1 from sysobjects where name = 'uspi_SandelioOperacijos')
drop procedure uspi_SandelioOperacijos
go

create procedure uspi_SandelioOperacijos
  @poValue int = null output,
  @piSandelininkaiId int = null,
	@piSandelioVietosId int = null,
	@piPrekesId int = null,
	@piPartijosId int = null,
	@piKiekis float = null,
	@piPartneriaiId int = null,
	@piOperacijuTipaiId int = null
as

declare @vError nvarchar(max), @vNewRecId int, @vOperacijosId int
	

select @poValue = -1


select @vOperacijosId = max(OperacijosId)
from SandeliuOperacijos

insert into SandeliuOperacijos(
	SandelininkaiId,
	SandelioVietosId,
	PrekesId,
	PartijosId,
	Kiekis,
	OperacijuTipaiId,
	PartneriaiId
)
values(
	@piSandelininkaiId,
	@piSandelioVietosId,
	@piPrekesId,
	@piPartijosId,
	@piKiekis,
	@piOperacijuTipaiId,
	@piPartneriaiId)
	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

