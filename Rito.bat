@Echo Off
title Testando o lag na RITO

SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)



call :cor 0e "Serao executados 10 disparos, a media deles sera exibida no final de cada teste"
Echo.
call :cor 0c "Para cancelar o teste precione [CTROL + C] e em seguida [S]"
Echo.
Echo.

:inicio
Echo -------------------------------------------------------------------
call :cor 0a "Iniciando teste em"
call :cor 0e " Servidor Riot BR 1"
Echo.
Echo -------------------------------------------------------------------
Ping 8.23.24.100 -n 10


Echo.
Echo -------------------------------------------------------------------
call :cor 0a "Precione qualquer tecla para testar seu ping no outro servidor."
echo.
call :cor 0e "Ou para cancelar [CTROL + C] e em seguida [S]"
Echo .
Pause > nul

cls

Echo -------------------------------------------------------------------
call :cor 0a "Iniciando teste em"
call :cor 0e " Servidor Riot BR 2"
Echo.
Echo -------------------------------------------------------------------
Ping 8.23.24.5 -n 10

Echo.
Echo -------------------------------------------------------------------
call :cor 0a "Precione qualquer tecla para proseguir."
Echo.
Pause > nul
Cls


call :cor 07 "Voce deseja refazer os testes "
call :cor 0a " [S]IM"
call :cor 0c " [N]AO"
choice /C SN /M " " 

If errorlevel=2 goto NAO
If errorlevel=1 goto SIM

:SIM
cls
Goto inicio
@Echo off
Cls

:NAO
exit

:cor
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i
