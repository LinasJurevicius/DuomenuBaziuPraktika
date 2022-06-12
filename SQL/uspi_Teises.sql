if exists (select 1 from sysobjects where name = 'uspi_Teises')
drop procedure uspi_Teises
go

create procedure uspi_Teises
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vNewRecId int, @vTeisesId int
	

select @poValue = -1

if not EXISTS(SELECT 1 FROM Teises WHERE Kodas = @piKodas)
begin
	select @vTeisesId = max(TeisesId)
	from Teises

  insert into Teises(
    Kodas,
		Pavadinimas,
		Aprasymas
  )
  values(
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

