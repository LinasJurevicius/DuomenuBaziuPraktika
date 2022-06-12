if exists (select 1 from sysobjects where name = 'uspu_VartotojuTipai')
drop procedure uspu_VartotojuTipai
go

create procedure uspu_VartotojuTipai
  @poValue int = null output,
	@piVartotojuTipaiId int = null,
	@piPavadinimas nvarchar(255) = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrAprasymas nvarchar(255), 
	@vCurrAsmensKodas nvarchar(255)
	

select @poValue = -1

update VartotojuTipai set
	Pavadinimai = @piPavadinimas
where VartotojuTipaiId = @piVartotojuTipaiId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

