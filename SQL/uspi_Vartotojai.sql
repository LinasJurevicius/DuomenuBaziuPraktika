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

