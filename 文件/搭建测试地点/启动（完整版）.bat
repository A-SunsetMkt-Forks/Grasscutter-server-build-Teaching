@echo off
title ��������-���ĵȴ�������
cd %~dp0"Dataserver\MongoDB"
echo �������ݿ� ...
start �������ݿ�.bat
echo �������ݿ��ֹ����ɱ����...
start ���ݿ�ű�.bat
echo ������Ϸ���� ...
cd %~dp0"grasscutter"
start grasscutter.bat
if exist keystore.p12 del keystore.p12
exit