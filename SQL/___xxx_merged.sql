if not EXISTS(SELECT 1 FROM sysobjects WHERE sysobjects.name = 'PrekiuTipai')
create table PrekiuTipai (
PrekiuTipaiId int identity,
Kodas nvarchar(50),
Pavadinimas nvarchar(255),
Aprasymas nvarchar(512)
)
GO

if not EXISTS(SELECT 1 FROM sysobjects WHERE sysobjects.name = 'OperacijuTipai')
create table OperacijuTipai (
OperacijuTipaiId int identity,
Kodas nvarchar(50),
Pavadinimas nvarchar(255),
Aprasymas nvarchar(512)
)
GO

if not EXISTS(SELECT 1 FROM sysobjects WHERE sysobjects.name = 'Sandelininkai')
create table Sandelininkai (
SandelininkaiId int identity,
Kodas nvarchar(50),
Pavadinimas nvarchar(255),
Vardas nvarchar(255),
Pavarde nvarchar(255),
SandeliuGrupesId int,
TeisesId int
)
GO

if not EXISTS(SELECT 1 FROM sysobjects WHERE sysobjects.name = 'Teises')
create table Teises (
TeisesId int identity,
Kodas nvarchar(50),
Pavadinimas nvarchar(255),
Aprasymas nvarchar(512)
)
GO

if not EXISTS(SELECT 1 FROM sysobjects WHERE sysobjects.name = 'PrekiuPartijos')
create table PrekiuPartijos (
PrekiuPartijosId int identity,
Kodas nvarchar(50),
SerijosNumeris nvarchar(50),
Kiekis numeric(18,6),
PrekesId int,
PartijosData datetime,
GaliojimoData datetime
)
GO

if not EXISTS(SELECT 1 FROM sysobjects WHERE sysobjects.name = 'Prekes')
create table Prekes (
PrekesId int identity,
Kodas nvarchar(50),
Pavadinimas nvarchar(255),
Barkodas nvarchar(255),
PrekiuTipaiId int,
Kiekis numeric(18,6),
PartneriaiId int
)
GO

if not EXISTS(SELECT 1 FROM sysobjects WHERE sysobjects.name = 'SandeliuOperacijos')
create table SandeliuOperacijos (
OperacijosId int identity,
SandelininkaiId int,
SandelioVietosId int,
PrekesId int,
PartijosId int,
Kiekis numeric(18,6),
OperacijuTipaiId int,
PartneriaiId int
)
GO

if not EXISTS(SELECT 1 FROM sysobjects WHERE sysobjects.name = 'Adresai')
create table Adresai (
AdresaiId int identity,
Salis nvarchar(255),
Miestas nvarchar(255),
Adresas nvarchar(512)
)
GO

if not EXISTS(SELECT 1 FROM sysobjects WHERE sysobjects.name = 'Vartotojai')
create table Vartotojai (
VartotojaiId int identity,
VartotojoVardas nvarchar(50),
SandelininkaiId int,
PartneriaiId int,
VartotojuTipaiId int,
Slaptazodis nvarchar(50)
)
GO

if not EXISTS(SELECT 1 FROM sysobjects WHERE sysobjects.name = 'Partneriai')
create table Partneriai (
PartneriaiId int identity,
Pavadinimas nvarchar(255),
AdresaiId int,
ImonesKodas nvarchar(255),
PVMKodas nvarchar(255)
)
GO

if not EXISTS(SELECT 1 FROM sysobjects WHERE sysobjects.name = 'SandeliuVietuTipai')
create table SandeliuVietuTipai (
SandeliuVietuTipaiId int identity,
Kodas nvarchar(50),
Pavadinimas nvarchar(255),
Aprasymas nvarchar(512)
)
GO

if not EXISTS(SELECT 1 FROM sysobjects WHERE sysobjects.name = 'SandeliuVietos')
create table SandeliuVietos (
SandeliuVietosId int identity,
Kodas nvarchar(50),
Pavadinimas nvarchar(255),
SandeliaiId int,
PrekiuPartijosId int,
SandeliuVietuTipaiId int
)
GO

if not EXISTS(SELECT 1 FROM sysobjects WHERE sysobjects.name = 'SandeliuGrupiuSandeliai')
create table SandeliuGrupiuSandeliai (
SandeliuGrupiuSandeliaiId int identity,
SandeliuGrupiuId int,
SandeliaiId int
)
GO

if not EXISTS(SELECT 1 FROM sysobjects WHERE sysobjects.name = 'SandeliuGrupes')
create table SandeliuGrupes (
SandeliuGrupesId int identity,
Kodas nvarchar(50),
Pavadinimas nvarchar(255),
Aprasymas nvarchar(512)
)
GO

if not EXISTS(SELECT 1 FROM sysobjects WHERE sysobjects.name = 'VartotojuTipai')
create table VartotojuTipai (
VartotojuTipaiId int identity,
Kodas nvarchar(50),
Pavadinimas nvarchar(255),
Aprasymas nvarchar(512)
)
GO

--Vartotoju tipai
if not EXISTS(SELECT 1 FROM VartotojuTipai WHERE VartotojuTipaiId = 1)
begin
	insert into VartotojuTipai(VartotojuTipaiId, Pavadinimai)
	values(1, '') 
end
if not EXISTS(SELECT 1 FROM VartotojuTipai WHERE VartotojuTipaiId = 2)
begin
	insert into VartotojuTipai(VartotojuTipaiId, Pavadinimai)
	values(2, 'Superadmin') 
end
if not EXISTS(SELECT 1 FROM VartotojuTipai WHERE VartotojuTipaiId = 3)
begin
	insert into VartotojuTipai(VartotojuTipaiId, Pavadinimai)
	values(3, 'Admin') 
end

if not EXISTS(SELECT 1 FROM VartotojuTipai WHERE VartotojuTipaiId = 4)
begin
	insert into VartotojuTipai(VartotojuTipaiId, Pavadinimai)
	values(4, 'Sandelininkas') 
end

if not EXISTS(SELECT 1 FROM VartotojuTipai WHERE VartotojuTipaiId = 5)
begin
	insert into VartotojuTipai(VartotojuTipaiId, Pavadinimai)
	values(5, 'SandelioVadovas') 
end
if not EXISTS(SELECT 1 FROM VartotojuTipai WHERE VartotojuTipaiId = 6)
begin
	insert into VartotojuTipai(VartotojuTipaiId, Pavadinimai)
	values(6, 'Klientas') 
end
GO

if not EXISTS(SELECT 1 FROM Vartotojai WHERE VartotojaiId = 1)
begin
	insert into Vartotojai(VartotojaiId, VartotojoVardas, SandelininkaiId, PartneriaiId, VartotojuTipaiId, Slaptazodis)
	values(1, 'SA', 1, 1, 2, 'sa') 
end
GO

--Sandelininkai
if not EXISTS(SELECT 1 FROM Sandelininkai WHERE SandelininkaiId = 1)
begin
	insert into Sandelininkai(SandelininkaiId)
	values(1) 
end

--Partneriai
SET IDENTITY_INSERT Partneriai ON
if not EXISTS(SELECT 1 FROM Partneriai WHERE PartneriaiId = 1)
begin
	insert into Partneriai(PartneriaiId)
	values(1) 
end
SET IDENTITY_INSERT Partneriai OFF

--Adresai
SET IDENTITY_INSERT Adresai ON
if not EXISTS(SELECT 1 FROM Adresai WHERE AdresaiId = 1)
begin
	insert into Adresai(AdresaiId)
	values(1) 
end
SET IDENTITY_INSERT Adresai OFF
GO
if exists (select 1 from sysobjects where name = 'usp_Login')
drop procedure usp_Login
go

create procedure usp_Login
  @poValue int = null output,
  @piVartotojoVardas nvarchar(50) = null,
  @piSlaptazodis nvarchar(255) = null,
  @poError nvarchar(max) = null output,
	@poUser nvarchar(max) = null output,
	@poUserId int = null output,
	@poAsmuoId int = null output
as

declare @vError nvarchar(max), @vVartotojuTipaiId int, @vVartotojaiId int, @vVartotojoVardas nvarchar(255)

select @poValue = -1

if not EXISTS(SELECT 1 FROM Vartotojai WHERE VartotojoVardas = @piVartotojoVardas and Slaptazodis = @piSlaptazodis)
	goto ERROR_Pass
	
select 
	@vVartotojaiId = VartotojaiId,
	@vVartotojuTipaiId = VartotojuTipaiId
from Vartotojai
where VartotojoVardas = @piVartotojoVardas and Slaptazodis = @piSlaptazodis
	
select @poValue = @vVartotojuTipaiId
select @poUser = @piVartotojoVardas
select @poUserId = @vVartotojaiId


return
	
ERROR_Pass:
  set @poError = 'Blogas vartotojo vardas arba slaptazodis'


IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspd_Adresai')
drop procedure uspd_Adresai 
go

create procedure uspd_Adresai 
  @poValue int = null output,
	@piAdresaiId int = null
as

declare @vError nvarchar(max)
	
select @poValue = -1

if not exists (select 1 from Sandeliai where AdresaiId = @piAdresaiId) and not exists (select 1 from Partneriai where AdresaiId = @piAdresaiId) 
delete from Adresai 
where AdresaiId = @piAdresaiId
	
select @poValue = 0

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspd_OperacijuTipai')
drop procedure uspd_OperacijuTipai 
go

create procedure uspd_OperacijuTipai 
  @poValue int = null output,
	@piOperacijuTipaiId int = null
as

declare @vError nvarchar(max)
	
select @poValue = -1

if not exists (select 1 from SandeliuOperacijos where OperacijuTipaiId = @piOperacijuTipaiId)
delete from OperacijuTipai where OperacijuTipaiId = @piOperacijuTipaiId
	
select @poValue = 0

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspd_Partneriai')
drop procedure uspd_Partneriai 
go

create procedure uspd_Partneriai 
  @poValue int = null output,
	@piPartneriaiId int = null
as

declare @vError nvarchar(max)
	
select @poValue = -1

if not exists (select 1 from SandeliuOperacijos where PartneriaiId = @piPartneriaiId) 
	and not exists (select 1 from Vartotojai where PartneriaiId = @piPartneriaiId) 
	and not exists (select 1 from Prekes where PartneriaiId = @piPartneriaiId) 
delete from Partneriai where PartneriaiId = @piPartneriaiId
	
select @poValue = 0

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspd_Prekes')
drop procedure uspd_Prekes 
go

create procedure uspd_Prekes 
  @poValue int = null output,
	@piPrekesId int = null
as

declare @vError nvarchar(max)
	
select @poValue = -1

if not exists (select 1 from SandeliuOperacijos where PrekesId = @piPrekesId)
delete from Prekes where PrekesId = @piPrekesId
	
select @poValue = 0

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspd_PrekiuTipai')
drop procedure uspd_PrekiuTipai 
go

create procedure uspd_PrekiuTipai 
  @poValue int = null output,
	@piPrekiuTipaiId int = null
as

declare @vError nvarchar(max)
	
select @poValue = -1

if not exists (select 1 from Prekes where PrekiuTipaiId = @piPrekiuTipaiId)
delete from PrekiuTipai where PrekiuTipaiId = @piPrekiuTipaiId
	
select @poValue = 0

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspd_SandelioOperacijos')
drop procedure uspd_SandelioOperacijos 
go

create procedure uspd_SandelioOperacijos 
  @poValue int = null output,
	@piOperacijosId int = null
as

declare @vError nvarchar(max)
	
select @poValue = -1

delete from SandeliuOperacijos where OperacijosId = @piOperacijosId
	
select @poValue = 0

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspd_SandeliuVietuTipai')
drop procedure uspd_SandeliuVietuTipai 
go

create procedure uspd_SandeliuVietuTipai 
  @poValue int = null output,
	@piSandeliuVietuTipuId int = null
as

declare @vError nvarchar(max)
	
select @poValue = -1

if not exists (select 1 from SandeliuVietos where SandeliuVietuTipaiId = @piSandeliuVietuTipuId)
delete from SandeliuVietos where SandeliuVietuTipaiId = @piSandeliuVietuTipuId
	
select @poValue = 0

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspd_VartotojuTipai')
drop procedure uspd_VartotojuTipai 
go

create procedure uspd_VartotojuTipai 
  @poValue int = null output,
	@piVartotojuTipaiId int = null
as

declare @vError nvarchar(max)
	
select @poValue = -1

if not exists (select 1 from Vartotojai where VartotojuTipaiId = @piVartotojuTipaiId)
delete from VartotojuTipai where VartotojuTipaiId = @piVartotojuTipaiId
	
select @poValue = 0

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

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

if exists (select 1 from sysobjects where name = 'uspi_OperacijuTipai')
drop procedure uspi_OperacijuTipai
go

create procedure uspi_OperacijuTipai
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vNewRecId int, @vOperacijuTipaiId int
	

select @poValue = -1

if not EXISTS(SELECT 1 FROM OperacijuTipai WHERE Kodas = @piKodas)
begin
	select @vOperacijuTipaiId = max(OperacijuTipaiId)
	from OperacijuTipai

  insert into OperacijuTipai(
    Kodas,
		Pavadinimas,
		Aprasymas
  )
  values(
    @piKodas,
    @piPavadinimas,
		@piAprasymas)
end
	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspi_Partneriai')
drop procedure uspi_Partneriai
go

create procedure uspi_Partneriai
  @poValue int = null output,
	@piPavadinimas nvarchar(255) = null,
	@piAdresaiId int = null,
	@piImonesKodas nvarchar(50) = null,
	@piPVMKodas nvarchar(50) = null
as

declare @vError nvarchar(max), @vNewRecId int, @vPartneriaId int
	

select @poValue = -1

select @vPartneriaId = max(PartneriaiId)
from Partneriai

insert into Partneriai(
	Pavadinimas,
	AdresaiId,
	ImonesKodas,
	PVMKodas
)
values(
	@piPavadinimas,
	@piAdresaiId,
	@piImonesKodas,
	@piPVMKodas)

	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspi_Prekes')
drop procedure uspi_Prekes
go

create procedure uspi_Prekes
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piBarkodas nvarchar(255) = null,
	@piPrekiuTipaiId int = null,
	@piKiekis float = null,
	@piPartneriaiId int = null
as

declare @vError nvarchar(max), @vNewRecId int, @vPrekesId int
	

select @poValue = -1


select @vPrekesId = max(PrekesId)
from Prekes

insert into Prekes(
	Kodas,
	Pavadinimas,
	Barkodas,
	PrekiuTipaiId,
	Kiekis,
	PartneriaiId
)
values(
	@piKodas,
	@piPavadinimas,
	@piBarkodas,
	@piPrekiuTipaiId,
	@piKiekis,
	@piPartneriaiId)

	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspi_PrekiuPartijos')
drop procedure uspi_PrekiuPartijos
go

create procedure uspi_PrekiuPartijos
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piSerijosNumeris int = null,
	@piKiekis float = null,
	@piPrekesId int = null,
	@piGaliojimoData datetime = null
as

declare @vError nvarchar(max), @vNewRecId int, @vPrekiuPartijosId int
	

select @poValue = -1


select @vPrekiuPartijosId = max(PrekiuPartijosId)
from PrekiuPartijos

insert into PrekiuPartijos(
	Kodas,
	SerijosNumeris,
	Kiekis,
	PrekesId,
	PartijosData,
	GaliojimoData
)
values(
	@piKodas,
	@piSerijosNumeris,
	@piKiekis,
	@piPrekesId,
	getdate(),
	@piGaliojimoData)

	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspi_PrekiuTipai')
drop procedure uspi_PrekiuTipai
go

create procedure uspi_PrekiuTipai
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vNewRecId int, @vPrekiuTipaiId int
	

select @poValue = -1

if not EXISTS(SELECT 1 FROM PrekiuTipai WHERE Kodas = @piKodas)
begin
	select @vPrekiuTipaiId = max(PrekiuTipaiId)
	from PrekiuTipai

  insert into PrekiuTipai(
    Kodas,
		Pavadinimas,
		Aprasymas
  )
  values(
    @piKodas,
    @piPavadinimas,
		@piAprasymas)
end
	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspi_Sandeliai')
drop procedure uspi_Sandeliai
go

create procedure uspi_Sandeliai
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAdresaiId int = null,
	@piSandeliuGrupesId int = null
as

declare @vError nvarchar(max), @vNewRecId int, @vSandeliaiId int
	

select @poValue = -1

if not EXISTS(SELECT 1 FROM Sandeliai WHERE Kodas = @piKodas)
begin
	select @vSandeliaiId = max(SandeliaiId)
	from Sandeliai

  insert into Sandeliai(
    Kodas,
		Pavadinimas,
		AdresaiId,
		SandeliuGrupesId
  )
  values(
    @piKodas,
    @piPavadinimas,
		@piAdresaiId,
		@piSandeliuGrupesId)
end
	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspi_Sandelininkai')
drop procedure uspi_Sandelininkai
go

create procedure uspi_Sandelininkai
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piVardas nvarchar(255) = null,
	@piPavarde nvarchar(255) = null,
	@piSandeliuGrupesId int = null,
	@piTeisesId int = null
as

declare @vError nvarchar(max), @vNewRecId int, @vSandelininkaiId int
	

select @poValue = -1

if not EXISTS(SELECT 1 FROM Sandelininkai WHERE Kodas = @piKodas)
begin
	select @vSandelininkaiId = max(SandelininkaiId)
	from Sandelininkai

  insert into Sandelininkai(
    Kodas,
		Pavadinimas,
		Vardas,
		Pavarde,
		SandeliuGrupesId,
		TeisesId
  )
  values(
    @piKodas,
    @piPavadinimas,
		@piVardas,
		@piPavarde,
		@piSandeliuGrupesId,
		@piTeisesId)
end
	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspi_SandelioOperacijos')
drop procedure uspi_SandelioOperacijos
go

create procedure uspi_SandelioOperacijos
  @poValue int = null output,
  @piSandelininkaiId int = null,
	@piSandelioVietosId int = null,
	@piPrekesId int = null,
	@piPartijosId int = null,
	@piKiekis float = null,
	@piPartneriaiId int = null,
	@piOperacijuTipaiId int = null
as

declare @vError nvarchar(max), @vNewRecId int, @vOperacijosId int
	

select @poValue = -1


select @vOperacijosId = max(OperacijosId)
from SandeliuOperacijos

insert into SandeliuOperacijos(
	SandelininkaiId,
	SandelioVietosId,
	PrekesId,
	PartijosId,
	Kiekis,
	OperacijuTipaiId,
	PartneriaiId
)
values(
	@piSandelininkaiId,
	@piSandelioVietosId,
	@piPrekesId,
	@piPartijosId,
	@piKiekis,
	@piOperacijuTipaiId,
	@piPartneriaiId)
	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspi_SandeliuGrupes')
drop procedure uspi_SandeliuGrupes
go

create procedure uspi_SandeliuGrupes
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vNewRecId int, @vSandeliuGrupesId int
	

select @poValue = -1

if not EXISTS(SELECT 1 FROM SandeliuGrupes WHERE Kodas = @piKodas)
begin
	select @vSandeliuGrupesId = max(SandeliuGrupesId)
	from SandeliuGrupes

  insert into SandeliuGrupes(
    SandeliuGrupesId,
    Kodas,
		Pavadinimas,
		Aprasymas		
  )
  values(
		@vSandeliuGrupesId + 1,
    @piKodas,
    @piPavadinimas,
		@piAprasymas)
end
	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspi_SandeliuVietos')
drop procedure uspi_SandeliuVietos
go

create procedure uspi_SandeliuVietos
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piSandeliaiId int = null,
	@piPrekiuPartijosId int = null,
	@piSandeliuVietuTipaiId int = null
as

declare @vError nvarchar(max), @vNewRecId int, @vSandeliuVietosId int
	

select @poValue = -1

if not EXISTS(SELECT 1 FROM SandeliuVietos WHERE Kodas = @piKodas)
begin
	select @vSandeliuVietosId = max(SandeliuVietosId)
	from SandeliuVietos

  insert into SandeliuVietos(
    SandeliuVietosId,
    Kodas,
		Pavadinimas,
		SandeliaiId,
		PrekiuPartijosId,
		SandeliuVietuTipaiId
  )
  values(
		@vSandeliuVietosId + 1,
    @piKodas,
    @piPavadinimas,
		@piSandeliaiId,
		@piPrekiuPartijosId,
		@piSandeliuVietuTipaiId)
end
	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspi_SandeliuVietuTipai')
drop procedure uspi_SandeliuVietuTipai
go

create procedure uspi_SandeliuVietuTipai
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vNewRecId int, @vSandeliuVietuTipuId int
	

select @poValue = -1

if not EXISTS(SELECT 1 FROM SandeliuVietuTipai WHERE Kodas = @piKodas)
begin
	select @vSandeliuVietuTipuId = max(SandeliuVietuTipaiId)
	from SandeliuVietuTipai

  insert into SandeliuVietuTipai(
    Kodas,
		Pavadinimas,
		Aprasymas
  )
  values(
    @piKodas,
    @piPavadinimas,
		@piAprasymas)
end
	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspi_Teises')
drop procedure uspi_Teises
go

create procedure uspi_Teises
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vNewRecId int, @vTeisesId int
	

select @poValue = -1

if not EXISTS(SELECT 1 FROM Teises WHERE Kodas = @piKodas)
begin
	select @vTeisesId = max(TeisesId)
	from Teises

  insert into Teises(
    Kodas,
		Pavadinimas,
		Aprasymas
  )
  values(
    @piKodas,
    @piPavadinimas,
		@piAprasymas)
end
	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspi_Vartotojai')
drop procedure uspi_Vartotojai
go

create procedure uspi_Vartotojai
  @poValue nvarchar(255) = null output,
 	@piVartotojoVardas nvarchar(50) = null,
	@piSandelininkaiId int = null,
	@piPartneriaiId int = null,
	@piVartotojuTipaiId int = null,
	@piSlaptazodis nvarchar(255) = null
as

declare @vError nvarchar(max), @vVartotojaiId int
	

select @poValue = -1

if not EXISTS(SELECT 1 FROM Vartotojai WHERE VartotojoVardas = @piVartotojoVardas)
begin
  --https://blog.sqlauthority.com/2018/07/08/how-to-generate-random-password-in-sql-server-interview-question-of-the-week-181/
  if isnull(@piSlaptazodis, '') = ''
  begin
    DECLARE @char CHAR = ''
    DECLARE @charI INT = 0
    --DECLARE @password VARCHAR(100) = ''
    DECLARE @len INT = 12 -- Length of Password
    WHILE @len > 0
    BEGIN
      SET @charI = ROUND(RAND()*100,0)
      SET @char = CHAR(@charI)
     
    IF @charI > 48 AND @charI < 122
    BEGIN
      SET @piSlaptazodis += @char
      SET @len = @len - 1
    END
    END
      SELECT @piSlaptazodis [PassWord]
  end

	select @vVartotojaiId = max(VartotojaiId)
	from Vartotojai

  insert into Vartotojai(
		VartotojaiId,
    VartotojoVardas,
    SandelininkaiId,
    PartneriaiId,
    VartotojuTipaiId,
    Slaptazodis
  )
  values(
		@vVartotojaiId + 1,
    @piVartotojoVardas,
    @piSandelininkaiId,
    @piPartneriaiId,
    @piVartotojuTipaiId,
    @piSlaptazodis)
end
  else select @piSlaptazodis = Slaptazodis from Vartotojai where VartotojoVardas = @piVartotojoVardas

select @poValue = @piSlaptazodis

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspi_VartotojuTipai')
drop procedure uspi_VartotojuTipai
go

create procedure uspi_VartotojuTipai
  @poValue int = null output,
	@piPavadinimas nvarchar(255) = null
as

declare @vError nvarchar(max), @vNewRecId int, @vVartotojuTipaiId int
	

select @poValue = -1


select @vVartotojuTipaiId = max(VartotojuTipaiId)
from VartotojuTipai

insert into VartotojuTipai(
	Pavadinimai
)
values(
	@piPavadinimas)

	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspu_Adresai')
drop procedure uspu_Adresai
go

create procedure uspu_Adresai
  @poValue int = null output,
	@piAdresaiId int = null,
  @piSalis nvarchar(255) = null,
	@piMiestas nvarchar(255) = null,
	@piAdresas nvarchar(255) = null
as

declare @vError nvarchar(max), @vCurrSalis nvarchar(255), @vCurrMiestas nvarchar(255), @vCurrAdresas nvarchar(255), 
	@vCurrAsmensKodas nvarchar(255)
	

select @poValue = -1

select 
	@vCurrSalis = Salis,
	@vCurrMiestas = Miestas,
	@vCurrAdresas = Adresas
from Adresai
where AdresaiId = @piAdresaiId

update Adresai set
	Salis = @piSalis,
	Miestas = @piMiestas,
	Adresas = @piAdresas
where AdresaiId = @piAdresaiId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspu_OperacijuTipai')
drop procedure uspu_OperacijuTipai
go

create procedure uspu_OperacijuTipai
  @poValue int = null output,
	@piOperacijuTipaiId int = null,
  @piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrAprasymas nvarchar(255)
	

select @poValue = -1

select 
	@vCurrKodas = Kodas,
	@vCurrPavadinimas = Pavadinimas,
	@vCurrAprasymas = Aprasymas
from OperacijuTipai
where OperacijuTipaiId = @piOperacijuTipaiId

update OperacijuTipai set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	Aprasymas = @piAprasymas,
	Pavadinimas = @piPavadinimas
where OperacijuTipaiId = @piOperacijuTipaiId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspu_Partneriai')
drop procedure uspu_Partneriai
go

create procedure uspu_Partneriai
  @poValue int = null output,
	@piPartneriaiId int = null,
  @piPavadinimas nvarchar(255) = null,
	@piAdresaiId int = null,
	@piImonesKodas nvarchar(50) = null,
	@piPVMKodas nvarchar(50) = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrImonesKodas nvarchar(255), 
	@vCurrPVMKodas nvarchar(255)
	

select @poValue = -1

select 
	@vCurrPavadinimas = Pavadinimas
from Partneriai
where PartneriaiId = @piPartneriaiId

update Partneriai set
	Pavadinimas = case when @piPavadinimas is not null then @piPavadinimas else @vCurrPavadinimas end,
	AdresaiId = @piAdresaiId,
	ImonesKodas = @piImonesKodas,
	PVMKodas = @piImonesKodas
where PartneriaiId = @piPartneriaiId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspu_Prekes')
drop procedure uspu_Prekes
go

create procedure uspu_Prekes
  @poValue int = null output,
	@piPrekesId int = null,
  @piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piBarkodas nvarchar(255) = null,
	@piPrekiuTipaiId int = null,
	@piKiekis float = null,
	@piPartneriaiId int = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrBarkodas nvarchar(255), @vCurrKiekis float, @vCurrPrekiuTipaiId int, @vCurrPartneriaiId int
	

select @poValue = -1

select 
	@vCurrKodas = Kodas
from Prekes
where PrekesId = @piPrekesId

update Prekes set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	Pavadinimas = @piPavadinimas,
	Barkodas = @piBarkodas,
	PrekiuTipaiId = @piPrekiuTipaiId,
	Kiekis = @piKiekis,
	PartneriaiId = @piPartneriaiId
where PrekesId = @piPrekesId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspu_PrekiuPartijos')
drop procedure uspu_PrekiuPartijos
go

create procedure uspu_PrekiuPartijos
  @poValue int = null output,
	@piPrekiuPartijosId int = null,
  @piKodas nvarchar(255) = null,
	@piSerijosNumeris int = null,
	@piKiekis float = null,
	@piPrekesId int = null,
	@piGaliojimoData datetime = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrSerijosNumeris int, @vCurrKiekis float, @vCurrPrekesId int, @vCurrGaliojimoData datetime
	

select @poValue = -1

select 
	@vCurrKodas = Kodas
from PrekiuPartijos
where PrekiuPartijosId = @piPrekiuPartijosId

update PrekiuPartijos set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	SerijosNumeris = @piSerijosNumeris,
	Kiekis = @piKiekis,
	PrekesId = @piPrekesId,
	GaliojimoData = @piGaliojimoData
where PrekiuPartijosId = @piPrekiuPartijosId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspu_PrekiuTipai')
drop procedure uspu_PrekiuTipai
go

create procedure uspu_PrekiuTipai
  @poValue int = null output,
	@piPrekiuTipaiId int = null,
  @piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrAprasymas nvarchar(255), 
	@vCurrAsmensKodas nvarchar(255)
	

select @poValue = -1

select 
	@vCurrKodas = Kodas,
	@vCurrKodas = Kodas
from PrekiuTipai
where PrekiuTipaiId = @piPrekiuTipaiId

update PrekiuTipai set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	Aprasymas = @piAprasymas,
	Pavadinimas = @piPavadinimas
where PrekiuTipaiId = @piPrekiuTipaiId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspu_Sandeliai')
drop procedure uspu_Sandeliai
go

create procedure uspu_Sandeliai
  @poValue int = null output,
	@piSandeliaiId int = null,
  @piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAdresaiId int = null,
	@piSandeliuGrupesId int = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255)
	

select @poValue = -1

select 
	@vCurrKodas = Kodas
from SandeliuVietos
where SandeliaiId = @piSandeliaiId

update Sandeliai set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	Pavadinimas = @piPavadinimas,
	AdresaiId = @piAdresaiId,
	SandeliuGrupesId = @piSandeliuGrupesId
where SandeliaiId = @piSandeliaiId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspu_Sandelininkai')
drop procedure uspu_Sandelininkai
go

create procedure uspu_Sandelininkai
  @poValue int = null output,
	@piSandelininkaiId int = null,
  @piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piVardas nvarchar(255) = null,
	@piPavarde nvarchar(255) = null,
	@piSandeliuGrupesId int = null,
	@piTeisesId int = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrVardas nvarchar(255), @vCurrPavarde nvarchar(255), @vCurrSandeliuGrupesId int,
	@vCurrTeisesId int
	

select @poValue = -1

select 
	@vCurrKodas = Kodas
from Sandelininkai
where SandelininkaiId = @piSandelininkaiId

update Sandelininkai set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	Pavadinimas = @piPavadinimas,
	Vardas = @piVardas,
	Pavarde = @piPavarde,
	SandeliuGrupesId = @piSandeliuGrupesId,
	TeisesId = @piTeisesId
where SandelininkaiId = @piSandelininkaiId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspu_SandelioOperacijos')
drop procedure uspu_SandelioOperacijos
go

create procedure uspu_SandelioOperacijos
  @poValue int = null output,
	@piOperacijosId int = null,
  @piSandelininkaiId int = null,
	@piSandelioVietosId int = null,
	@piPrekesId int = null,
	@piPartijosId int = null,
	@piKiekis float = null,
	@piPartneriaiId int = null
as

declare @vError nvarchar(max)
	

select @poValue = -1


update SandeliuOperacijos set
	SandelininkaiId = @piSandelininkaiId,
	SandelioVietosId = @piSandelioVietosId,
	PrekesId = @piPrekesId,
	PartijosId = @piPartijosId,
	Kiekis = @piKiekis,
	PartneriaiId = @piPartneriaiId
where OperacijosId = @piOperacijosId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspu_SandeliuGrupes')
drop procedure uspu_SandeliuGrupes
go

create procedure uspu_SandeliuGrupes
  @poValue int = null output,
	@piSandeliuGrupesId int = null,
  @piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrAprasymas nvarchar(255), 
	@vCurrAsmensKodas nvarchar(255)
	

select @poValue = -1

select 
	@vCurrKodas = Kodas
from SandeliuGrupes
where SandeliuGrupesId = @piSandeliuGrupesId

update SandeliuGrupes set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	Aprasymas = @piAprasymas,
	Pavadinimas = @piPavadinimas
where SandeliuGrupesId = @piSandeliuGrupesId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspu_SandeliuVietos')
drop procedure uspu_SandeliuVietos
go

create procedure uspu_SandeliuVietos
  @poValue int = null output,
	@piSandeliuVietosId int = null,
  @piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piSandeliaiId int = null,
	@piPrekiuPartijosId int = null,
	@piSandeliuVietuTipuId int = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255)
	

select @poValue = -1

select 
	@vCurrKodas = Kodas
from SandeliuVietos
where SandeliuVietosId = @piSandeliuVietosId

update SandeliuVietos set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	Pavadinimas = @piPavadinimas,
	SandeliaiId = @piSandeliaiId,
	PrekiuPartijosId = @piPrekiuPartijosId,
	SandeliuVietuTipaiId = @piSandeliuVietuTipuId
where SandeliuVietosId = @piSandeliuVietosId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspu_SandeliuVietuTipai')
drop procedure uspu_SandeliuVietuTipai
go

create procedure uspu_SandeliuVietuTipai
  @poValue int = null output,
	@piSandeliuVietuTipuId int = null,
  @piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrAprasymas nvarchar(255), 
	@vCurrAsmensKodas nvarchar(255)
	

select @poValue = -1

select 
	@vCurrKodas = Kodas
from SandeliuVietuTipai
where SandeliuVietuTipaiId = @piSandeliuVietuTipuId

update SandeliuVietuTipai set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	Aprasymas = @piAprasymas,
	Pavadinimas = @piPavadinimas
where SandeliuVietuTipaiId = @piSandeliuVietuTipuId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspu_Teises')
drop procedure uspu_Teises
go

create procedure uspu_Teises
  @poValue int = null output,
	@piTeisesId int = null,
  @piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrAprasymas nvarchar(255)
	

select @poValue = -1

select 
	@vCurrKodas = Kodas
from Teises
where TeisesId = @piTeisesId

update Teises set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	Aprasymas = @piAprasymas,
	Pavadinimas = @piPavadinimas
where TeisesId = @piTeisesId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

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

if exists (select 1 from sysobjects where name = 'uspu_VartotojuTipai')
drop procedure uspu_VartotojuTipai
go

create procedure uspu_VartotojuTipai
  @poValue int = null output,
	@piVartotojuTipaiId int = null,
	@piPavadinimas nvarchar(255) = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrAprasymas nvarchar(255), 
	@vCurrAsmensKodas nvarchar(255)
	

select @poValue = -1

update VartotojuTipai set
	Pavadinimai = @piPavadinimas
where VartotojuTipaiId = @piVartotojuTipaiId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspv_Adresai')
drop procedure uspv_Adresai
go

create procedure uspv_Adresai
  @poValue int = null output,
	@piAdresaiId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		AdresaiId = AdresaiId,
		Salis = Salis,
		Miestas = Miestas,
		Adresas = Adresas
	from Adresai

if @piEditForm = 1
	select 
		AdresaiId = AdresaiId,
		Salis = Salis,
		Miestas = Miestas,
		Adresas = Adresas
	from Adresai
	where AdresaiId = @piAdresaiId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspv_OperacijuTipai')
drop procedure uspv_OperacijuTipai
go

create procedure uspv_OperacijuTipai
  @poValue int = null output,
	@piOperacijuTipaiId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		OperacijuTipaiId = OperacijuTipaiId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from OperacijuTipai

if @piEditForm = 1
	select 
		OperacijuTipaiId = OperacijuTipaiId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from OperacijuTipai
	where OperacijuTipaiId = @piOperacijuTipaiId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

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

if exists (select 1 from sysobjects where name = 'uspv_PrekiuTipai')
drop procedure uspv_PrekiuTipai
go

create procedure uspv_PrekiuTipai
  @poValue int = null output,
	@piPrekiuTipaiId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		PrekiuTipaiId = PrekiuTipaiId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from PrekiuTipai

if @piEditForm = 1
	select 
		PrekiuTipaiId = PrekiuTipaiId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from PrekiuTipai
	where PrekiuTipaiId = @piPrekiuTipaiId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

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

if exists (select 1 from sysobjects where name = 'uspv_SandeliuGrupes')
drop procedure uspv_SandeliuGrupes
go

create procedure uspv_SandeliuGrupes
  @poValue int = null output,
	@piSandeliuGrupesId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		SandeliuGrupesId = SandeliuGrupesId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from SandeliuGrupes

if @piEditForm = 1
	select 
		SandeliuGrupesId = SandeliuGrupesId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from SandeliuGrupes
	where SandeliuGrupesId = @piSandeliuGrupesId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

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

if exists (select 1 from sysobjects where name = 'uspv_SandeliuVietuTipai')
drop procedure uspv_SandeliuVietuTipai
go

create procedure uspv_SandeliuVietuTipai
  @poValue int = null output,
	@piSandeliuVietuTipuId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		SandeliuVietuTipuId = SandeliuVietuTipaiId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from SandeliuVietuTipai

if @piEditForm = 1
	select 
		SandeliuVietuTipuId = SandeliuVietuTipaiId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from SandeliuVietuTipai
	where SandeliuVietuTipaiId = @piSandeliuVietuTipuId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

if exists (select 1 from sysobjects where name = 'uspv_Teises')
drop procedure uspv_Teises
go

create procedure uspv_Teises
  @poValue int = null output,
	@piTeisesId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		TeisesId = TeisesId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from Teises

if @piEditForm = 1
	select 
		TeisesId = TeisesId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from Teises
	where TeisesId = @piTeisesId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

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

if exists (select 1 from sysobjects where name = 'uspv_VartotojuTipai')
drop procedure uspv_VartotojuTipai
go

create procedure uspv_VartotojuTipai
  @poValue int = null output,
	@piVartotojuTipaiId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		VartotojuTipaiId = VartotojuTipaiId,
		Pavadinimas = Pavadinimai
	from VartotojuTipai

if @piEditForm = 1
	select 
		VartotojuTipaiId = VartotojuTipaiId,
		Pavadinimas = Pavadinimai
	from VartotojuTipai
	where VartotojuTipaiId = @piVartotojuTipaiId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
go

