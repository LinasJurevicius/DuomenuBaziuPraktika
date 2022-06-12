if exists (select 1 from sysobjects where name = 'uspd_Partneriai')
drop procedure uspd_Partneriai 
go

create procedure uspd_Partneriai 
  @poValue int = null output,
	@piPartneriaiId int = null
as

declare @vError nvarchar(max)
	
select @poValue = -1

if not exists (select 1 from SandeliuOperacijos where PartneriaiId = @piPartneriaiId) 
	and not exists (select 1 from Vartotojai where PartneriaiId = @piPartneriaiId) 
	and not exists (select 1 from Prekes where PartneriaiId = @piPartneriaiId) 
delete from Partneriai where PartneriaiId = @piPartneriaiId
	
select @poValue = 0

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

