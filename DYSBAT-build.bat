REM ######  DYSBAT GENERATE FILES  ######
REM ###################################
REM 
@echo off 
setlocal enabledelayedexpansion 
SET PROJECT=DYSBAT


set ITEM[1]=ryobiTestV1
set ITEM[2]=ryobiTestV2
set ITEM[3]=dewaltTestV1Top
set ITEM[4]=dewaltTestV1Bottom
set ITEM[5]=dewaltTestV1
set ITEM[6]=ZZZZ
set ITEM[7]=laserTest
set ITEM[8]=ZZZZ
set ITEM[9]=dewaltBatteryNutHelper
set ITEM[10]=ZZZZ
set ITEM[11]=ALL


SET STYLE=3DPR
SET FILEFULL=output\%PROJECT%
SET LASERFILE=C:\DB\Dropbox\LALA-Laser Files\BBBB-projectFiles\%PROJECT%

del %FILEFULL%.stl

(for /l %%i in (7,1,11) do (
    echo Making Index: %%i Filename: %FILEFULL%-!ITEM[%%i]!	
    del %FILEFULL%-!ITEM[%%i]!-3DPR.stl   
    openscad -o %FILEFULL%-!ITEM[%%i]!-3DPR.stl -D "i=%%i;o=\"3DPR"" DYSBAT-3DPR.scad
    del %FILEFULL%-!ITEM[%%i]!-3DPR.png   
    openscad -o %FILEFULL%-!ITEM[%%i]!-3DPR.png -D "i=%%i;o=\"3DPR"" DYSBAT-3DPR.scad	
    del %FILEFULL%-!ITEM[%%i]!-LAZE.dxf
    openscad -o %FILEFULL%-!ITEM[%%i]!-LAZE.dxf -D "i=%%i;o=\"LAZE"" DYSBAT-LAZE.scad
    del "%LASERFILE%-!ITEM[%%i]!-LAZE.dxf"
    copy %FILEFULL%-!ITEM[%%i]!-LAZE.dxf "%LASERFILE%-!ITEM[%%i]!-LAZE.dxf"
    del %FILEFULL%-!ITEM[%%i]!-LAZE.svg
    openscad -o %FILEFULL%-!ITEM[%%i]!-LAZE.svg -D "i=%%i;o=\"LAZE"" DYSBAT-LAZE.scad
	del %FILEFULL%-!ITEM[%%i]!-LAZE.pdf
	inkscape.exe --export-filename="%FILEFULL%-!ITEM[%%i]!-LAZE.pdf" "%FILEFULL%-!ITEM[%%i]!-LAZE.svg"	
	REM prusa-slicer-console.exe --export-gcode --repair --output %FILEFULL%-!ITEM[%%i]!-3DPR.gcode  -load "C:\DB\Dropbox\BBBB-Product Working\3DPR\3DPR-commandLine\OOBB-run.ini" %FILEFULL%-!ITEM[%%i]!-3DPR.stl  
))


REM #############################################################################
REM ######      ALL DONE !!!!!! #################################################
REM #############################################################################
pause

