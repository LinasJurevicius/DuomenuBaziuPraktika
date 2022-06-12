if exists (select 1 from sysobjects where name = 'usp_Login')
drop procedure usp_Login
go

create procedure usp_Login
  @poValue int = null output,
  @piVartotojoVardas nvarchar(50) = null,
  @piSlaptazodis nvarchar(255) = null,
  @poError nvarchar(max) = null output,
	@poUser nvarchar(max) = null output,
	@poUserId int = null output,
	@poAsmuoId int = null output
as

declare @vError nvarchar(max), @vVartotojuTipaiId int, @vVartotojaiId int, @vVartotojoVardas nvarchar(255)

select @poValue = -1

if not EXISTS(SELECT 1 FROM Vartotojai WHERE VartotojoVardas = @piVartotojoVardas and Slaptazodis = @piSlaptazodis)
	goto ERROR_Pass
	
select 
	@vVartotojaiId = VartotojaiId,
	@vVartotojuTipaiId = VartotojuTipaiId
from Vartotojai
where VartotojoVardas = @piVartotojoVardas and Slaptazodis = @piSlaptazodis
	
select @poValue = @vVartotojuTipaiId
select @poUser = @piVartotojoVardas
select @poUserId = @vVartotojaiId


return
	
ERROR_Pass:
  set @poError = 'Blogas vartotojo vardas arba slaptazodis'


IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

