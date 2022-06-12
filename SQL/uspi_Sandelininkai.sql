if exists (select 1 from sysobjects where name = 'uspi_Sandelininkai')
drop procedure uspi_Sandelininkai
go

create procedure uspi_Sandelininkai
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piVardas nvarchar(255) = null,
	@piPavarde nvarchar(255) = null,
	@piSandeliuGrupesId int = null,
	@piTeisesId int = null
as

declare @vError nvarchar(max), @vNewRecId int, @vSandelininkaiId int
	

select @poValue = -1

if not EXISTS(SELECT 1 FROM Sandelininkai WHERE Kodas = @piKodas)
begin
	select @vSandelininkaiId = max(SandelininkaiId)
	from Sandelininkai

  insert into Sandelininkai(
    Kodas,
		Pavadinimas,
		Vardas,
		Pavarde,
		SandeliuGrupesId,
		TeisesId
  )
  values(
    @piKodas,
    @piPavadinimas,
		@piVardas,
		@piPavarde,
		@piSandeliuGrupesId,
		@piTeisesId)
end
	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

