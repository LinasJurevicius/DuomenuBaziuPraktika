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
