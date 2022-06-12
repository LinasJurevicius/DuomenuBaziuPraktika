if exists (select 1 from sysobjects where name = 'uspu_Vartotojai')
drop procedure uspu_Vartotojai
go

create procedure uspu_Vartotojai
  @poValue int = null output,
	@piVartotojaiId int = null,
	@piSandelininkaiId int = null,
	@piPartneriaiId int = null,
	@piVartotojuTipaiId int = null,
	@piSlaptazodis nvarchar(50) = null
as

declare @vError nvarchar(max)
	

select @poValue = -1


update Vartotojai set
	SandelininkaiId = @piSandelininkaiId,
	PartneriaiId = @piPartneriaiId,
	VartotojuTipaiId = @piVartotojuTipaiId,
	Slaptazodis = @piSlaptazodis
where VartotojaiId = @piVartotojaiId


return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

