if exists (select 1 from sysobjects where name = 'uspi_Sandeliai')
drop procedure uspi_Sandeliai
go

create procedure uspi_Sandeliai
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAdresaiId int = null,
	@piSandeliuGrupesId int = null
as

declare @vError nvarchar(max), @vNewRecId int, @vSandeliaiId int
	

select @poValue = -1

if not EXISTS(SELECT 1 FROM Sandeliai WHERE Kodas = @piKodas)
begin
	select @vSandeliaiId = max(SandeliaiId)
	from Sandeliai

  insert into Sandeliai(
    Kodas,
		Pavadinimas,
		AdresaiId,
		SandeliuGrupesId
  )
  values(
    @piKodas,
    @piPavadinimas,
		@piAdresaiId,
		@piSandeliuGrupesId)
end
	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

