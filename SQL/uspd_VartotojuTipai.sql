if exists (select 1 from sysobjects where name = 'uspd_VartotojuTipai')
drop procedure uspd_VartotojuTipai 
go

create procedure uspd_VartotojuTipai 
  @poValue int = null output,
	@piVartotojuTipaiId int = null
as

declare @vError nvarchar(max)
	
select @poValue = -1

if not exists (select 1 from Vartotojai where VartotojuTipaiId = @piVartotojuTipaiId)
delete from VartotojuTipai where VartotojuTipaiId = @piVartotojuTipaiId
	
select @poValue = 0

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

