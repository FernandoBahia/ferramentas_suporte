@echo off
title MENU DE SUPORTE E REPARO - STARIAN
color 0A


@echo off
:MENU
cls
echo ==============================================
echo         MENU DO SUPORTE TECNICO - STARIAN
echo              por Fernando Bahia - V1.0
echo ==============================================
echo.

echo  1. Verificar e Reparar Disco (CHKDSK)
echo  2. Reparar Arquivos de Sistema (SFC)
echo  3. Limpar Arquivos Temporarios
echo  4. Verificar Erros de Memoria (Diagnostico)
echo  5. Restaurar Sistema
echo  6. Verificar Conectividade de Rede (Ping/Teste)
echo  7. Gerenciar Processos (Task Manager)
echo  8. Backup de Drivers
echo  9. Verificar Atualizacoes do Windows
echo 10. Informacoes do Sistema
echo 11. Limpar Cache DNS
echo 12. Reiniciar Servicos de Rede
echo 13. Desfragmentar Disco
echo 14. Gerenciar Usuarios Locais
echo 15. Verificar Integridade de Arquivos (DISM)
echo 16. Ativar/Desativar Firewall do Windows
echo 17. Ver Logs de Eventos
echo 18. Testar Velocidade de Disco
echo 19. Criar Ponto de Restauracao
echo 20. Executar Comando Personalizado (CMD)
echo 21. Atualizar Todos os Programas (Winget Update)
echo 22. Sair
echo ==============================================
set /p opcao=Escolha uma opcao (1-22): 

if "%opcao%"=="1" chkdsk
if "%opcao%"=="2" sfc /scannow
if "%opcao%"=="3" cleanmgr
if "%opcao%"=="4" mdsched
if "%opcao%"=="5" rstrui
if "%opcao%"=="6" ping 8.8.8.8 -n 5 & pause
if "%opcao%"=="7" taskmgr
if "%opcao%"=="8" echo Backup de drivers requer script adicional.
if "%opcao%"=="9" powershell -command "Get-WindowsUpdateLog"
if "%opcao%"=="10" systeminfo | more
if "%opcao%"=="11" ipconfig /flushdns
if "%opcao%"=="12" netsh winsock reset & netsh int ip reset
if "%opcao%"=="13" defrag C:
if "%opcao%"=="14" lusrmgr.msc
if "%opcao%"=="15" DISM /Online /Cleanup-Image /ScanHealth
if "%opcao%"=="16" netsh advfirewall set allprofiles state off
if "%opcao%"=="17" eventvwr
if "%opcao%"=="18" winsat disk
if "%opcao%"=="19" powershell -Command "Checkpoint-Computer -Description 'Ponto de Restauracao Manual'"
if "%opcao%"=="20" cmd
if "%opcao%"=="21" winget update --all
if "%opcao%"=="22" exit

pause
goto MENU
