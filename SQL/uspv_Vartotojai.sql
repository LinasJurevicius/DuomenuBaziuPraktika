if exists (select 1 from sysobjects where name = 'uspv_Vartotojai')
drop procedure uspv_Vartotojai
go

create procedure uspv_Vartotojai
  @poValue int = null output,
	@piVartotojaiId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		VartotojaiId = v.VartotojaiId,
		VartotojoVardas = v.VartotojoVardas,
		Asmuo = s.Vardas + ' ' + s.Pavarde,
		Partneris = p.Pavadinimas,
		VartotojoTipas = vt.Pavadinimai
	from Vartotojai v
		left join Sandelininkai s on s.SandelininkaiId = v.SandelininkaiId
		left join Partneriai p on p.PartneriaiId = p.PartneriaiId
		inner join VartotojuTipai vt on vt.VartotojuTipaiId = v.VartotojuTipaiId

if @piEditForm = 1
	select 
		VartotojaiId = v.VartotojaiId,
		VartotojoVardas = v.VartotojoVardas,
		Asmuo = s.Vardas + ' ' + s.Pavarde,
		Partneris = p.Pavadinimas,
		VartotojoTipas = vt.Pavadinimai
	from Vartotojai v
		left join Sandelininkai s on s.SandelininkaiId = v.SandelininkaiId
		left join Partneriai p on p.PartneriaiId = p.PartneriaiId
		inner join VartotojuTipai vt on vt.VartotojuTipaiId = v.VartotojuTipaiId
	where VartotojaiId = @piVartotojaiId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

