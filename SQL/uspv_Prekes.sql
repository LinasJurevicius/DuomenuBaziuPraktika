if exists (select 1 from sysobjects where name = 'uspv_Prekes')
drop procedure uspv_Prekes
go

create procedure uspv_Prekes
  @poValue int = null output,
	@piPrekesId int = null,
	@piPartneriaiId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		PrekesId = p.PrekesId,
		PrKodas = p.Kodas,
		PrPavadinimas = p.Pavadinimas,
		PrBarkodas = p.Barkodas,
		Kiekis = p.Kiekis,
		PTPavadinimas = pt.Pavadinimas,
		PrekiuTipaiId = pt.PrekiuTipaiId
	from Prekes p
		left join Partneriai part on part.PartneriaiId = p.PartneriaiId
		inner join PrekiuTipai pt on pt.PrekiuTipaiId = p.PrekiuTipaiId
	where part.PartneriaiId = case when isnull(@piPartneriaiId, 0) > 0 then @piPartneriaiId else part.PartneriaiId end

if @piEditForm = 1
	select distinct
		PrekesId = p.PrekesId,
		PrKodas = p.Kodas,
		PrPavadinimas = p.Pavadinimas,
		PrBarkodas = p.Barkodas,
		Kiekis = p.Kiekis,
		PTPavadinimas = pt.Pavadinimas,
		PrekiuTipaiId = pt.PrekiuTipaiId
	from Prekes p
		inner join PrekiuPartijos pp on pp.PrekesId = pp.Prekesid
		left join Partneriai part on part.PartneriaiId = p.PartneriaiId
		inner join PrekiuTipai pt on pt.PrekiuTipaiId = p.PrekiuTipaiId
	where p.PrekesId = @piPrekesId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

