if exists (select 1 from sysobjects where name = 'uspi_PrekiuTipai')
drop procedure uspi_PrekiuTipai
go

create procedure uspi_PrekiuTipai
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vNewRecId int, @vPrekiuTipaiId int
	

select @poValue = -1

if not EXISTS(SELECT 1 FROM PrekiuTipai WHERE Kodas = @piKodas)
begin
	select @vPrekiuTipaiId = max(PrekiuTipaiId)
	from PrekiuTipai

  insert into PrekiuTipai(
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

