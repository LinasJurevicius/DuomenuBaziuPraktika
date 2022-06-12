if exists (select 1 from sysobjects where name = 'uspv_PrekiuPartijos')
drop procedure uspv_PrekiuPartijos
go

create procedure uspv_PrekiuPartijos
  @poValue int = null output,
	@piPrekiuPartijosId int = null,
	@piPrekesId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		PrekiuPartijosId = pp.PrekiuPartijosId,
		Kodas = pp.Kodas,
		SerijosNumeris = pp.SerijosNumeris,
		PrekesId = pp.PrekesId,
		GaliojimoData = pp.GaliojimoData,
		PartijosData = pp.PartijosData,
		PrKodas = p.Kodas,
		PrPavadinimas = p.Pavadinimas,
		PrBarkodas = p.Barkodas,
		PartPavas = part.Pavadinimas
	from PrekiuPartijos pp
		inner join Prekes p on p.PrekesId = pp.Prekesid
		left join Partneriai part on part.PartneriaiId = p.PartneriaiId
	where p.PrekesId = case when isnull(@piPrekesId, 0) != 0 then @piPrekesId else p.PrekesId end

if @piEditForm = 1
	select 
		PrekiuPartijosId = pp.PrekiuPartijosId,
		Kodas = pp.Kodas,
		SerijosNumeris = pp.SerijosNumeris,
		PrekesId = pp.PrekesId,
		GaliojimoData = pp.GaliojimoData,
		PartijosData = pp.PartijosData,
		PrKodas = p.Kodas,
		PrPavadinimas = p.Pavadinimas,
		PrBarkodas = p.Barkodas,
		PartPavas = part.Pavadinimas
	from PrekiuPartijos pp
		inner join Prekes p on p.PrekesId = pp.Prekesid
		left join Partneriai part on part.PartneriaiId = p.PartneriaiId
	where pp.PrekiuPartijosId = @piPrekiuPartijosId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

