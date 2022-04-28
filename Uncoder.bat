@echo off
set /p IN=Исходный файл: 
set /p IN_CP=Его кодировка: 
set /p OUT=Выходной файл: 
set /p OUT_CP=Желаемая кодировка: 
for /f "tokens=2 delims=:" %%i in ('chcp.com') do set CP=%%i
::в следующей строке выводятся байты \xFF\xFE (BOM):
set /p p= ?<nul >utf-16.tmp
(
chcp.com %IN_CP%>nul
cmd.exe /u /c type %IN%>>utf-16.tmp
chcp.com %OUT_CP%>nul
cmd.exe /c type utf-16.tmp>%OUT%
chcp.com %CP%>nul
)
del utf-16.tmp
