if exists (select 1 from sysobjects where name = 'uspd_SandeliuVietuTipai')
drop procedure uspd_SandeliuVietuTipai 
go

create procedure uspd_SandeliuVietuTipai 
  @poValue int = null output,
	@piSandeliuVietuTipuId int = null
as

declare @vError nvarchar(max)
	
select @poValue = -1

if not exists (select 1 from SandeliuVietos where SandeliuVietuTipaiId = @piSandeliuVietuTipuId)
delete from SandeliuVietos where SandeliuVietuTipaiId = @piSandeliuVietuTipuId
	
select @poValue = 0

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

