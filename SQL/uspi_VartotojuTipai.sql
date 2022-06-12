if exists (select 1 from sysobjects where name = 'uspi_VartotojuTipai')
drop procedure uspi_VartotojuTipai
go

create procedure uspi_VartotojuTipai
  @poValue int = null output,
	@piPavadinimas nvarchar(255) = null
as

declare @vError nvarchar(max), @vNewRecId int, @vVartotojuTipaiId int
	

select @poValue = -1


select @vVartotojuTipaiId = max(VartotojuTipaiId)
from VartotojuTipai

insert into VartotojuTipai(
	Pavadinimai
)
values(
	@piPavadinimas)

	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

