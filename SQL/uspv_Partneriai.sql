if exists (select 1 from sysobjects where name = 'uspv_Partneriai')
drop procedure uspv_Partneriai
go

create procedure uspv_Partneriai
  @poValue int = null output,
	@piPartneriaiId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		PartneriaiId = p.PartneriaiId,
		Pavadinimas = p.Pavadinimas,
		Adresas = a.Adresas,
		Miestas = a.Miestas,
		Salis = a.Salis,
		ImonesKodas = p.ImonesKodas,
		PVMKodas = p.PVMKodas
	from Partneriai p
		left join Adresai a on a.AdresaiId = p.AdresaiId


if @piEditForm = 1
	select 
		PartneriaiId = p.PartneriaiId,
		Pavadinimas = p.Pavadinimas,
		Adresas = a.Adresas,
		Miestas = a.Miestas,
		Salis = a.Salis,
		ImonesKodas = p.ImonesKodas,
		PVMKodas = p.PVMKodas
	from Partneriai p
		left join Adresai a on a.AdresaiId = p.AdresaiId
	where p.PartneriaiId = @piPartneriaiId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

