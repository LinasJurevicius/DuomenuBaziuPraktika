if exists (select 1 from sysobjects where name = 'uspd_Adresai')
drop procedure uspd_Adresai 
go

create procedure uspd_Adresai 
  @poValue int = null output,
	@piAdresaiId int = null
as

declare @vError nvarchar(max)
	
select @poValue = -1

if not exists (select 1 from Sandeliai where AdresaiId = @piAdresaiId) and not exists (select 1 from Partneriai where AdresaiId = @piAdresaiId) 
delete from Adresai 
where AdresaiId = @piAdresaiId
	
select @poValue = 0

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

