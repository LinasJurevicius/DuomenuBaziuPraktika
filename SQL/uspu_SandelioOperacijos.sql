if exists (select 1 from sysobjects where name = 'uspu_SandelioOperacijos')
drop procedure uspu_SandelioOperacijos
go

create procedure uspu_SandelioOperacijos
  @poValue int = null output,
	@piOperacijosId int = null,
  @piSandelininkaiId int = null,
	@piSandelioVietosId int = null,
	@piPrekesId int = null,
	@piPartijosId int = null,
	@piKiekis float = null,
	@piPartneriaiId int = null
as

declare @vError nvarchar(max)
	

select @poValue = -1


update SandeliuOperacijos set
	SandelininkaiId = @piSandelininkaiId,
	SandelioVietosId = @piSandelioVietosId,
	PrekesId = @piPrekesId,
	PartijosId = @piPartijosId,
	Kiekis = @piKiekis,
	PartneriaiId = @piPartneriaiId
where OperacijosId = @piOperacijosId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

