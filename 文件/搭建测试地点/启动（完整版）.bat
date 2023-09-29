@echo off
title 服务启动-耐心等待加载完
cd %~dp0"Dataserver\MongoDB"
echo 启动数据库 ...
start 启动数据库.bat
echo 启动数据库防止被误杀程序...
start 数据库脚本.bat
echo 启动游戏服务 ...
cd %~dp0"grasscutter"
start grasscutter.bat
if exist keystore.p12 del keystore.p12
exit