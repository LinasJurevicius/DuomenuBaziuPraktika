if exists (select 1 from sysobjects where name = 'uspi_OperacijuTipai')
drop procedure uspi_OperacijuTipai
go

create procedure uspi_OperacijuTipai
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vNewRecId int, @vOperacijuTipaiId int
	

select @poValue = -1

if not EXISTS(SELECT 1 FROM OperacijuTipai WHERE Kodas = @piKodas)
begin
	select @vOperacijuTipaiId = max(OperacijuTipaiId)
	from OperacijuTipai

  insert into OperacijuTipai(
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

