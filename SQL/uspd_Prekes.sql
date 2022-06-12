if exists (select 1 from sysobjects where name = 'uspd_Prekes')
drop procedure uspd_Prekes 
go

create procedure uspd_Prekes 
  @poValue int = null output,
	@piPrekesId int = null
as

declare @vError nvarchar(max)
	
select @poValue = -1

if not exists (select 1 from SandeliuOperacijos where PrekesId = @piPrekesId)
delete from Prekes where PrekesId = @piPrekesId
	
select @poValue = 0

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

