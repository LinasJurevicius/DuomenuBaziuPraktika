if exists (select 1 from sysobjects where name = 'uspi_SandeliuVietos')
drop procedure uspi_SandeliuVietos
go

create procedure uspi_SandeliuVietos
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piSandeliaiId int = null,
	@piPrekiuPartijosId int = null,
	@piSandeliuVietuTipaiId int = null
as

declare @vError nvarchar(max), @vNewRecId int, @vSandeliuVietosId int
	

select @poValue = -1

if not EXISTS(SELECT 1 FROM SandeliuVietos WHERE Kodas = @piKodas)
begin
	select @vSandeliuVietosId = max(SandeliuVietosId)
	from SandeliuVietos

  insert into SandeliuVietos(
    SandeliuVietosId,
    Kodas,
		Pavadinimas,
		SandeliaiId,
		PrekiuPartijosId,
		SandeliuVietuTipaiId
  )
  values(
		@vSandeliuVietosId + 1,
    @piKodas,
    @piPavadinimas,
		@piSandeliaiId,
		@piPrekiuPartijosId,
		@piSandeliuVietuTipaiId)
end
	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

