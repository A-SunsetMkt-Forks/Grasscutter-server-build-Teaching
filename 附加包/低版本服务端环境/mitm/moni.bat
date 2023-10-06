@echo off&title
cd /d %~dp0
if "%1" == "h" goto begin
mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit
:begin
REM

%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&&exit
ping 127.0 -n 1 >nul
:top
cls
for /l %%i in (12,-1,1) do (
tasklist|findstr -i "mitmdump.exe"
	if ERRORLEVEL 1 (
		echo Error..
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f 
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "" /f 
		exit
	)
	ping 127.1 -n 1 >nul
)
goto top



