if exists (select 1 from sysobjects where name = 'uspd_PrekiuTipai')
drop procedure uspd_PrekiuTipai 
go

create procedure uspd_PrekiuTipai 
  @poValue int = null output,
	@piPrekiuTipaiId int = null
as

declare @vError nvarchar(max)
	
select @poValue = -1

if not exists (select 1 from Prekes where PrekiuTipaiId = @piPrekiuTipaiId)
delete from PrekiuTipai where PrekiuTipaiId = @piPrekiuTipaiId
	
select @poValue = 0

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

