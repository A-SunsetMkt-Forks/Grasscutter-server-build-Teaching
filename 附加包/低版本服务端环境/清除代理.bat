@echo off&title �������
echo �����������
ping 127.0 -n 1 >nul 
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f 
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "" /f 
echo �����������
ping 127.0 -n 2 >nul 
exit