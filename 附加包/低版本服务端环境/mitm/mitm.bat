@echo off&title  
cd /d %~dp0


%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&&exit
ping 127.0 -n 1 >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f 
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "127.0.0.1:8080" /f 
ping 127.0 -n 1 >nul
cd /d %~dp0
start "代理转发" "mitmdump.exe" -s proxy.py --ssl-insecure
ping 127.0 -n 1 >nul
start moni.bat
exit



