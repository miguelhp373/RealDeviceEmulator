@ECHO OFF

TITLE Real Device Emulator - by MIGUELHP

ECHO ===================================
ECHO =========== BEM VINDO =============
ECHO ===================================

ECHO -----------------------------------
ECHO OPCOES:
ECHO [1] - MEUS DISPOSITIVOS
ECHO [2] - CONECTAR UM NOVO DISPOSITIVO
ECHO [3] - SAIR
ECHO -----------------------------------

SET /P $TYPE=OPCAO DESEJADA:


IF %$TYPE% EQU 1 GOTO SEARCH
IF %$TYPE% EQU 2 GOTO CONNECT
if %$TYPE% EQU 3 goto CLOSE
if %$TYPE% NEQ 1 OR  %TYPE%  NEQ 2 OR %TYPE%  NEQ 3  GOTO CLOSE

:SEARCH

CLS

cd C:\Users\migue\AppData\Local\Android\Sdk\platform-tools

adb devices

@PAUSE



:CONNECT
    
CLS

ECHO PARA CONECTAR UM NOVO DISPOSITIVO, VOCE DEVE CONECTAR O SEU SMARTPHONE 
ECHO ANDROID AO SEU COMPUTADOR, ATRAVES DE UM CABO USB:
ECHO -------------------------------------------------
ECHO .
SET /P $COPTIONS=CASO TENHA CONECTADO O CABO, DIGITE 'S', PARA PROSSEGUIR:

IF $COPTIONS EQU S OR $COPTIONS EQU s GOTO CONNECTINI



:CONNECTINI

CLS

ECHO PRONTO! AGORA E SO ESPERAR, ESTAMOS CONFIGURANDO PARA VOCE.

cd C:\Users\migue\AppData\Local\Android\Sdk\platform-tools

adb tcpip 5555

@PAUSE

@ECHO ON

adb shell ip -f inet addr show wlan0

SET /P $userip= AGORA VOCÊ IRA DIGITAR O IP ENCOTRADO ACIMA, EXEMPLO: (INET '192.168.0.111') :

adb connect %$userip%:5555

@ECHO OFF

CLS

adb devices


ECHO PRONTO, DESCONECTE O SEU SMARTPHONE, AGORA VOCE PODERA COMPILAR SEUS APPS DIRETAMENTE EM SEU CELULAR.

@PAUSE

