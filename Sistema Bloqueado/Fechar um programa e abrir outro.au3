#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_icon=D:\00 BACKUP DE DADOS\00 ARQUIVOS ARCADE\07 Icones\30.ico
#AutoIt3Wrapper_Res_Comment=Função: Fechar um program e abrir outro e vice-versa
#AutoIt3Wrapper_Res_Description=Belini Scripts
#AutoIt3Wrapper_Res_LegalCopyright=Feito por Belini em 31.10.2010
#AutoIt3Wrapper_Run_Obfuscator=y
#Obfuscator_Parameters=/sf=1 /sv=1
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

;******************************************************
;Autoit V3
;Autor  Belini
;Data 31/10/2010
;Objetivo: Fechar um program e abrir outro e vice-versa
;******************************************************

if not FileExists(".\config.ini") Then
IniWrite(".\config.ini","Tecla que fecha um programa e abre outro","Tecla1","x")
IniWrite(".\config.ini","Tecla que fecha 0 Script e os programas","Tecla2","f")
IniWrite(".\config.ini","Caminho do Primeiro programa","Caminho1","")
IniWrite(".\config.ini","Nome do Primeiro programa","Programa1","")
IniWrite(".\config.ini","Caminho do Segundo programa","Caminho2","")
IniWrite(".\config.ini","Nome do Segundo programa","Programa2","")
endif

$tecla1=IniRead(".\config.ini","Tecla que fecha um programa e abre outro","Tecla1","")
$tecla2=IniRead(".\config.ini","Tecla que fecha 0 Script e os programas","Tecla2","")
$caminho1=IniRead(".\config.ini","Caminho do Primeiro programa","Caminho1","")
$programa1=IniRead(".\config.ini","Nome do Primeiro programa","Programa1","")
$caminho2=IniRead(".\config.ini","Caminho do Segundo programa","Caminho2","")
$programa2=IniRead(".\config.ini","Nome do Segundo programa","Programa2","")

HotKeySet($tecla1,"close_open"); instala a hotkey usando a tecla "X"
HotKeySet($tecla2,"fecha_script"); instala a hotkey usando a tecla "F"

; rotina de loop que mantém o script aberto.
While 1
sleep(200); dá um intervalo de 200 milisegundos
wend

func close_open(); troca o programa quando a tecla "X" for pressionada

if ProcessExists($programa1) Then; verifica se o programa 1 esta aberto
ProcessClose($programa1); fecha o programa 1
ShellExecute($programa2, "", $caminho2); executa o programa 2
else
ProcessClose($programa2); fecha o programa 2
ShellExecute($programa1, "", $caminho1); executa o programa 1
endif

endfunc 

func fecha_script(); fecha o script quando a letra "F" for pressionada

HotKeySet($tecla2); Remove a hotkey "X"
HotKeySet($tecla2); Remove a hotkey "F"

if ProcessExists($programa1) then
ProcessClose($programa1); fecha o programa 1
endif

if ProcessExists($programa2) then
ProcessClose($programa2); fecha o programa 1
endif

Exit; encerra o script

endfunc


