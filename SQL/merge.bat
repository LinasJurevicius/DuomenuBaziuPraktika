rem @ECHO OFF
del ___xxx_merged.sql
ECHO Creating ___xxx_merged.sql...
rem TYPE 00_Settings-sql2005-08.sql >> ___xxx_merged.sql
rem TYPE 00_varchar_To_nvarchar.sql >> ___xxx_merged.sql
TYPE inserts.sql >> ___xxx_merged.sql
TYPE usp_Login.sql >> ___xxx_merged.sql
TYPE uspd_Adresai.sql >> ___xxx_merged.sql
TYPE uspd_OperacijuTipai.sql >> ___xxx_merged.sql
TYPE uspd_Partneriai.sql >> ___xxx_merged.sql
TYPE uspd_Prekes.sql >> ___xxx_merged.sql
TYPE uspd_PrekiuTipai.sql >> ___xxx_merged.sql
TYPE uspd_SandelioOperacijos.sql >> ___xxx_merged.sql
TYPE uspd_SandeliuVietuTipai.sql >> ___xxx_merged.sql
TYPE uspd_VartotojuTipai.sql >> ___xxx_merged.sql
TYPE uspi_Adresai.sql >> ___xxx_merged.sql
TYPE uspi_OperacijuTipai.sql >> ___xxx_merged.sql
TYPE uspi_Partneriai.sql >> ___xxx_merged.sql
TYPE uspi_Prekes.sql >> ___xxx_merged.sql
TYPE uspi_PrekiuPartijos.sql >> ___xxx_merged.sql
TYPE uspi_PrekiuTipai.sql >> ___xxx_merged.sql
TYPE uspi_Sandeliai.sql >> ___xxx_merged.sql
TYPE uspi_Sandelininkai.sql >> ___xxx_merged.sql
TYPE uspi_SandelioOperacijos.sql >> ___xxx_merged.sql
TYPE uspi_SandeliuGrupes.sql >> ___xxx_merged.sql
TYPE uspi_SandeliuVietos.sql >> ___xxx_merged.sql
TYPE uspi_SandeliuVietuTipai.sql >> ___xxx_merged.sql
TYPE uspi_Teises.sql >> ___xxx_merged.sql
TYPE uspi_Vartotojai.sql >> ___xxx_merged.sql
TYPE uspi_VartotojuTipai.sql >> ___xxx_merged.sql
TYPE uspu_Adresai.sql >> ___xxx_merged.sql
TYPE uspu_OperacijuTipai.sql >> ___xxx_merged.sql
TYPE uspu_Partneriai.sql >> ___xxx_merged.sql
TYPE uspu_Prekes.sql >> ___xxx_merged.sql
TYPE uspu_PrekiuPartijos.sql >> ___xxx_merged.sql
TYPE uspu_PrekiuTipai.sql >> ___xxx_merged.sql
TYPE uspu_Sandeliai.sql >> ___xxx_merged.sql
TYPE uspu_Sandelininkai.sql >> ___xxx_merged.sql
TYPE uspu_SandelioOperacijos.sql >> ___xxx_merged.sql
TYPE uspu_SandeliuGrupes.sql >> ___xxx_merged.sql
TYPE uspu_SandeliuVietos.sql >> ___xxx_merged.sql
TYPE uspu_SandeliuVietuTipai.sql >> ___xxx_merged.sql
TYPE uspu_Teises.sql >> ___xxx_merged.sql
TYPE uspu_Vartotojai.sql >> ___xxx_merged.sql
TYPE uspu_VartotojuTipai.sql >> ___xxx_merged.sql
TYPE uspv_Adresai.sql >> ___xxx_merged.sql
TYPE uspv_OperacijuTipai.sql >> ___xxx_merged.sql
TYPE uspv_Partneriai.sql >> ___xxx_merged.sql
TYPE uspv_Prekes.sql >> ___xxx_merged.sql
TYPE uspv_PrekiuPartijos.sql >> ___xxx_merged.sql
TYPE uspv_PrekiuTipai.sql >> ___xxx_merged.sql
TYPE uspv_Sandeliai.sql >> ___xxx_merged.sql
TYPE uspv_Sandelininkai.sql >> ___xxx_merged.sql
TYPE uspv_SandeliuGrupes.sql >> ___xxx_merged.sql
TYPE uspv_SandeliuOperacijos.sql >> ___xxx_merged.sql
TYPE uspv_SandeliuVietos.sql >> ___xxx_merged.sql
TYPE uspv_SandeliuVietuTipai.sql >> ___xxx_merged.sql
TYPE uspv_Teises.sql >> ___xxx_merged.sql
TYPE uspv_Vartotojai.sql >> ___xxx_merged.sql
TYPE uspv_VartotojuTipai.sql >> ___xxx_merged.sql
pause