@echo off
chcp 65001 >nul
rem EasyChat 测试环境一键启动：Redis 6379 + EasyChatServer 19004/18000
if not exist "E:\houduan\dev-tools\redis\redis-server.exe" (
    echo ERROR: E:\houduan\dev-tools\redis not found
    pause
    exit /b 1
)
if not exist "E:\houduan\easychat-server\target\server-1.0.0.RELEASE.jar" (
    echo ERROR: server jar not found, build it first with mvn package
    pause
    exit /b 1
)
echo [1/2] Starting Redis on 6379...
start "Redis-6379" /min "E:\houduan\dev-tools\redis\redis-server.exe" --port 6379 --bind 127.0.0.1
echo [2/2] Starting EasyChatServer (HTTP 19004 / Netty 18000)...
start "EasyChatServer" cmd /k "E:\houduan\easychat-server\tools\run-server.bat"
echo.
echo Test environment is starting.
echo Verify: http://127.0.0.1:19004/system/onlineNum
echo To re-run the full test suite:
echo   python "C:\Users\陈宇\WorkBuddy\2026-10-19-14-59-04\easychat-test-practice\scripts\run_tests.py"
echo   (or import the Postman collection from easychat-test-practice\postman\)
echo.
pause
