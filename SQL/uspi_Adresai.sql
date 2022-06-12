if exists (select 1 from sysobjects where name = 'uspi_Adresai')
drop procedure uspi_Adresai
go

create procedure uspi_Adresai
  @poValue int = null output,
	@piSalis nvarchar(255) = null,
	@piMiestas nvarchar(255) = null,
	@piAdresas nvarchar(255) = null
as

declare @vError nvarchar(max), @vNewRecId int, @vAdresaiId int
	

select @poValue = -1


select @vAdresaiId = max(AdresaiId)
from Adresai

insert into Adresai(
	Salis,
	Miestas,
	Adresas
)
values(
	@piSalis,
	@piMiestas,
	@piAdresas)

	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

