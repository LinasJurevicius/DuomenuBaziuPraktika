if exists (select 1 from sysobjects where name = 'uspu_OperacijuTipai')
drop procedure uspu_OperacijuTipai
go

create procedure uspu_OperacijuTipai
  @poValue int = null output,
	@piOperacijuTipaiId int = null,
  @piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrAprasymas nvarchar(255)
	

select @poValue = -1

select 
	@vCurrKodas = Kodas,
	@vCurrPavadinimas = Pavadinimas,
	@vCurrAprasymas = Aprasymas
from OperacijuTipai
where OperacijuTipaiId = @piOperacijuTipaiId

update OperacijuTipai set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	Aprasymas = @piAprasymas,
	Pavadinimas = @piPavadinimas
where OperacijuTipaiId = @piOperacijuTipaiId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

