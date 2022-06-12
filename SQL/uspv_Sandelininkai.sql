if exists (select 1 from sysobjects where name = 'uspv_Sandelininkai')
drop procedure uspv_Sandelininkai
go

create procedure uspv_Sandelininkai
  @poValue int = null output,
	@piSandelininkaiId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		SandelininkaiId = s.SandelininkaiId,
		Kodas = s.Kodas,
		Pavadinimas = s.Pavadinimas,
		Asmuo = s.Vardas + ' ' + s.Pavarde,
		SGPavadinimas = sg.Pavadinimas,
		TeisesPavad = t.Pavadinimas,
		TeisesAprasymas = t.Aprasymas
	from Sandelininkai s
		left join SandeliuGrupes sg on sg.SandeliuGrupesId = s.SandeliuGrupesId
		left join Teises t on t.TeisesId = s.TeisesId
	

if @piEditForm = 1
	select 
		SandelininkaiId = s.SandelininkaiId,
		Kodas = s.Kodas,
		Pavadinimas = s.Pavadinimas,
		Asmuo = s.Vardas + ' ' + s.Pavarde,
		SGPavadinimas = sg.Pavadinimas,
		TeisesPavad = t.Pavadinimas,
		TeisesAprasymas = t.Aprasymas
	from Sandelininkai s
		left join SandeliuGrupes sg on sg.SandeliuGrupesId = s.SandeliuGrupesId
		left join Teises t on t.TeisesId = s.TeisesId
	where SandelininkaiId = @piSandelininkaiId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

