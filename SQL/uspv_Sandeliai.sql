if exists (select 1 from sysobjects where name = 'uspv_Sandeliai')
drop procedure uspv_Sandeliai
go

create procedure uspv_Sandeliai
  @poValue int = null output,
	@piSandeliaiId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		SandeliaiId = s.SandeliaiId,
		Kodas = s.Kodas,
		Pavadinimas = s.Pavadinimas,
		Adresas = a.Adresas,
		Miestas = a.Miestas,
		Salis = a.Salis,
		SandeliuGrupe = sg.Pavadinimas
	from Sandeliai s
		left join Adresai a on a.AdresaiId = s.AdresaiId
		left join SandeliuGrupes sg on sg.SandeliuGrupesId = s.SandeliuGrupesId
	

if @piEditForm = 1
	select 
		SandeliaiId = s.SandeliaiId,
		Kodas = s.Kodas,
		Pavadinimas = s.Pavadinimas,
		Adresas = a.Adresas,
		Miestas = a.Miestas,
		Salis = a.Salis,
		SandeliuGrupe = sg.Pavadinimas,
		AdresaiId = isnull(s.AdresaiId, 1),
		SandeliuGrupesId = isnull(sg.SandeliuGrupesId, 1)
	from Sandeliai s
		left join Adresai a on a.AdresaiId = s.AdresaiId
		left join SandeliuGrupes sg on sg.SandeliuGrupesId = s.SandeliuGrupesId
	where SandeliaiId = @piSandeliaiId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

