@echo off&title ������
%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&&exit
ping 127.0 -n 1 >nul
echo ��������滻���������ȷ���˿�8080δ��ռ��!
echo ����رոô���, ����mitmֹͣ���Զ����ϵͳ����...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f 
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "127.0.0.1:8080" /f 
ping 127.0 -n 3 >nul
cd /d %~dp0
start "����ת��" "mitmdump.exe" -s proxy.py --ssl-insecure
cls


ping 127.0 -n 3 >nul
:top
echo ����رոô���, ����mitmֹͣ���Զ����ϵͳ����...
cls
for /l %%i in (12,-1,1) do (
	tasklist|findstr -i "mitmdump.exe"
		if ERRORLEVEL 1 (
			echo Error..
			reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f 
			reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "" /f 
			exit
		)
	)
goto top



