if exists (select 1 from sysobjects where name = 'uspd_SandelioOperacijos')
drop procedure uspd_SandelioOperacijos 
go

create procedure uspd_SandelioOperacijos 
  @poValue int = null output,
	@piOperacijosId int = null
as

declare @vError nvarchar(max)
	
select @poValue = -1

delete from SandeliuOperacijos where OperacijosId = @piOperacijosId
	
select @poValue = 0

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

