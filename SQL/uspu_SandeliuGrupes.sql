if exists (select 1 from sysobjects where name = 'uspu_SandeliuGrupes')
drop procedure uspu_SandeliuGrupes
go

create procedure uspu_SandeliuGrupes
  @poValue int = null output,
	@piSandeliuGrupesId int = null,
  @piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrAprasymas nvarchar(255), 
	@vCurrAsmensKodas nvarchar(255)
	

select @poValue = -1

select 
	@vCurrKodas = Kodas
from SandeliuGrupes
where SandeliuGrupesId = @piSandeliuGrupesId

update SandeliuGrupes set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	Aprasymas = @piAprasymas,
	Pavadinimas = @piPavadinimas
where SandeliuGrupesId = @piSandeliuGrupesId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

