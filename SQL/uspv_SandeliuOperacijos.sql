if exists (select 1 from sysobjects where name = 'uspv_SandeliuOperacijos')
drop procedure uspv_SandeliuOperacijos
go

create procedure uspv_SandeliuOperacijos
  @poValue int = null output,
	@piOparacijosId int = null,
	@piSandelininkaiId int = null,
	@piSandelioVietosId int = null,
	@piPrekesId int = null,
	@piPartijosId int = null,
	@piOperacijuTipaiId int = null,
	@piPartneriaiId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		so.OperacijosId,
		so.Kiekis,
		s.Vardas + ' ' + s.Pavarde,
		sv.Pavadinimas,
		p.Pavadinimas,
		p.Barkodas,
		p.Kodas,
		pp.Kodas,
		pp.SerijosNumeris,
		pp.PartijosData,
		pp.GaliojimoData,
		ot.Pavadinimas,
		p.Pavadinimas
	from SandeliuOperacijos so
		left join Sandelininkai s on s.SandelininkaiId = so.SandelininkaiId
		left join SandeliuVietos sv on sv.SandeliuVietosId = so.SandelioVietosId
		left join Prekes p on p.PrekesId = so.PrekesId
		left join PrekiuPartijos pp on pp.PrekiuPartijosId = so.PartijosId
		inner join OperacijuTipai ot on ot.OperacijuTipaiId = so.OperacijuTipaiId
		left join Partneriai part on part.PartneriaiId = so.PartneriaiId
	where 
		so.SandelininkaiId = case when isnull(@piSandelininkaiId, 0) != 0 then @piSandelininkaiId else so.SandelininkaiId end
		and so.SandelioVietosId = case when isnull(@piSandelioVietosId, 0) != 0 then @piSandelioVietosId else so.SandelioVietosId end
		and so.PrekesId = case when isnull(@piPrekesId, 0) != 0 then @piPrekesId else so.PrekesId end
		and so.PartijosId = case when isnull(@piPartijosId, 0) != 0 then @piPartijosId else so.PartijosId end
		and so.OperacijuTipaiId = case when isnull(@piOperacijuTipaiId, 0) != 0 then @piOperacijuTipaiId else so.OperacijuTipaiId end
		and so.PartneriaiId = case when isnull(@piPartneriaiId, 0) != 0 then @piPartneriaiId else so.PartneriaiId end
	

if @piEditForm = 1
	select 
		so.OperacijosId,
		so.Kiekis,
		s.Vardas + ' ' + s.Pavarde,
		sv.Pavadinimas,
		p.Pavadinimas,
		p.Barkodas,
		p.Kodas,
		pp.Kodas,
		pp.SerijosNumeris,
		pp.PartijosData,
		pp.GaliojimoData,
		ot.Pavadinimas,
		p.Pavadinimas
	from SandeliuOperacijos so
		left join Sandelininkai s on s.SandelininkaiId = so.SandelininkaiId
		left join SandeliuVietos sv on sv.SandeliuVietosId = so.SandelioVietosId
		left join Prekes p on p.PrekesId = so.PrekesId
		left join PrekiuPartijos pp on pp.PrekiuPartijosId = so.PartijosId
		inner join OperacijuTipai ot on ot.OperacijuTipaiId = so.OperacijuTipaiId
		left join Partneriai part on part.PartneriaiId = so.PartneriaiId
	where so.OperacijosId = @piOparacijosId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

