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

EXIT



:CONNECT
    
CLS

ECHO PARA CONECTAR UM NOVO DISPOSITIVO, VOCE DEVE CONECTAR O SEU SMARTPHONE 
ECHO ANDROID AO SEU COMPUTADOR, ATRAVES DE UM CABO USB:
ECHO ---------------------------------------------------

SET /P $COPTIONS=CASO TENHA CONECTADO O CABO, DIGITE 'S', PARA PROSSEGUIR:

IF $COPTIONS EQU S OR $COPTIONS EQU s GOTO CONNECTINI
IF $COPTIONS NEQ S OR $COPTIONS NEQ s EXIT
 


:CONNECTINI

CLS

ECHO PRONTO! AGORA E SO ESPERAR, ESTAMOS CONFIGURANDO PARA VOCE.
ECHO -----------------------------------------------------------

cd C:\Users\migue\AppData\Local\Android\Sdk\platform-tools

adb tcpip 5555


@PAUSE

CLS


adb shell ip -f inet addr show wlan0


ECHO ----------------------------------------------------------------------------------------------------------
SET /P $userip= AGORA VOCE IRA DIGITAR O IP ENCOTRADO ACIMA, EXEMPLO(inet '192.168.0.111'), DEMONSTRADO NA SEGUNDA LINHA :

adb connect %$userip%:5555

CLS

adb devices


ECHO PRONTO, DESCONECTE O SEU SMARTPHONE, AGORA VOCE PODERA COMPILAR SEUS APPS DIRETAMENTE EM SEU CELULAR.

@PAUSE

