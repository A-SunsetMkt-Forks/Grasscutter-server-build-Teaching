@echo off&title 清除代理
echo 正在清理代理
ping 127.0 -n 1 >nul 
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f 
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "" /f 
echo 代理清理完毕
ping 127.0 -n 2 >nul 
exit