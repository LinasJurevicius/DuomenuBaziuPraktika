if exists (select 1 from sysobjects where name = 'uspu_Sandelininkai')
drop procedure uspu_Sandelininkai
go

create procedure uspu_Sandelininkai
  @poValue int = null output,
	@piSandelininkaiId int = null,
  @piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piVardas nvarchar(255) = null,
	@piPavarde nvarchar(255) = null,
	@piSandeliuGrupesId int = null,
	@piTeisesId int = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrVardas nvarchar(255), @vCurrPavarde nvarchar(255), @vCurrSandeliuGrupesId int,
	@vCurrTeisesId int
	

select @poValue = -1

select 
	@vCurrKodas = Kodas
from Sandelininkai
where SandelininkaiId = @piSandelininkaiId

update Sandelininkai set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	Pavadinimas = @piPavadinimas,
	Vardas = @piVardas,
	Pavarde = @piPavarde,
	SandeliuGrupesId = @piSandeliuGrupesId,
	TeisesId = @piTeisesId
where SandelininkaiId = @piSandelininkaiId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

