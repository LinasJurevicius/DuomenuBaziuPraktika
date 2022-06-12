if exists (select 1 from sysobjects where name = 'uspd_OperacijuTipai')
drop procedure uspd_OperacijuTipai 
go

create procedure uspd_OperacijuTipai 
  @poValue int = null output,
	@piOperacijuTipaiId int = null
as

declare @vError nvarchar(max)
	
select @poValue = -1

if not exists (select 1 from SandeliuOperacijos where OperacijuTipaiId = @piOperacijuTipaiId)
delete from OperacijuTipai where OperacijuTipaiId = @piOperacijuTipaiId
	
select @poValue = 0

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

