if exists (select 1 from sysobjects where name = 'uspv_SandeliuVietos')
drop procedure uspv_SandeliuVietos
go

create procedure uspv_SandeliuVietos
  @poValue int = null output,
	@piSandeliuVietosId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		SandeliuVietosId = sv.SandeliuVietosId,
		Kodas = sv.Kodas,
		Pavadinimas = sv.Pavadinimas,
		Sandelis = s.Pavadinimas,
		SandelioVietosTipas = svt.Pavadinimas
	from SandeliuVietos sv
		inner join Sandeliai s on s.SandeliaiId = sv.SandeliaiId
		inner join SandeliuVietuTipai svt on svt.SandeliuVietuTipaiId = sv.SandeliuVietuTipaiId
	

if @piEditForm = 1
	select 
		SandeliuVietosId = sv.SandeliuVietosId,
		Kodas = sv.Kodas,
		Pavadinimas = sv.Pavadinimas,
		Sandelis = s.Pavadinimas,
		SandelioVietosTipas = svt.Pavadinimas
	from SandeliuVietos sv
		inner join Sandeliai s on s.SandeliaiId = sv.SandeliaiId
		inner join SandeliuVietuTipai svt on svt.SandeliuVietuTipaiId = sv.SandeliuVietuTipaiId
	where SandeliuVietosId = @piSandeliuVietosId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

