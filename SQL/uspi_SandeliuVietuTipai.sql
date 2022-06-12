if exists (select 1 from sysobjects where name = 'uspi_SandeliuVietuTipai')
drop procedure uspi_SandeliuVietuTipai
go

create procedure uspi_SandeliuVietuTipai
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vNewRecId int, @vSandeliuVietuTipuId int
	

select @poValue = -1

if not EXISTS(SELECT 1 FROM SandeliuVietuTipai WHERE Kodas = @piKodas)
begin
	select @vSandeliuVietuTipuId = max(SandeliuVietuTipaiId)
	from SandeliuVietuTipai

  insert into SandeliuVietuTipai(
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

