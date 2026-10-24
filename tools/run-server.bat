@echo off
chcp 65001 >nul
rem EasyChatServer 启动（JDK 8 + 覆盖端口）
set "JAVA_HOME=E:\houduan\dev-tools\jdk8"
cd /d %~dp0..
"%JAVA_HOME%\bin\java.exe" -jar target\server-1.0.0.RELEASE.jar --server.port=19004 --server.netty.port=18000
