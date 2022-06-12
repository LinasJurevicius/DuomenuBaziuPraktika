if exists (select 1 from sysobjects where name = 'uspi_SandeliuGrupes')
drop procedure uspi_SandeliuGrupes
go

create procedure uspi_SandeliuGrupes
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vNewRecId int, @vSandeliuGrupesId int
	

select @poValue = -1

if not EXISTS(SELECT 1 FROM SandeliuGrupes WHERE Kodas = @piKodas)
begin
	select @vSandeliuGrupesId = max(SandeliuGrupesId)
	from SandeliuGrupes

  insert into SandeliuGrupes(
    SandeliuGrupesId,
    Kodas,
		Pavadinimas,
		Aprasymas		
  )
  values(
		@vSandeliuGrupesId + 1,
    @piKodas,
    @piPavadinimas,
		@piAprasymas)
end
	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

