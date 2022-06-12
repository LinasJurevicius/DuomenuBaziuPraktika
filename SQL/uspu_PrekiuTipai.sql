if exists (select 1 from sysobjects where name = 'uspu_PrekiuTipai')
drop procedure uspu_PrekiuTipai
go

create procedure uspu_PrekiuTipai
  @poValue int = null output,
	@piPrekiuTipaiId int = null,
  @piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrAprasymas nvarchar(255), 
	@vCurrAsmensKodas nvarchar(255)
	

select @poValue = -1

select 
	@vCurrKodas = Kodas,
	@vCurrKodas = Kodas
from PrekiuTipai
where PrekiuTipaiId = @piPrekiuTipaiId

update PrekiuTipai set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	Aprasymas = @piAprasymas,
	Pavadinimas = @piPavadinimas
where PrekiuTipaiId = @piPrekiuTipaiId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

