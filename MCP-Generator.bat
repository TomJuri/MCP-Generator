@echo off
echo Hello,
echo I'm MCP-Generator, and I will install and setup you every MCP you want.
echo.
echo The first decision you need to make is which main client version you want.
echo Choose: [1.8]
SET /p mainversion=#
if '%mainversion%' == '1.8' goto mainversion1.8 (
) else (
goto syntaxerror
)

:mainversion1.8
cls
echo Good! You chose 1.8.
echo Now it's time to chose the subversion.
echo Choose: [1.8.8]
SET /p subversion=#
if '%subversion%' == '1.8.8' goto subversion1.8.8 (
) else (
goto syntaxerror
)
goto end

:subversion1.8.8
cls
echo Great! I will now install and setup your MCP 1.8.8. You can now lay back for a few minutes.
if exist MCP-1.8.8 (
goto folderalreadyexistserror
) else (
echo.
echo Downloading MCP-1.8.8...
echo.
curl http://www.modcoderpack.com/files/mcp918.zip --out MCP-1.8.8.zip
cls
echo Unzipping MCP-1.8.8...
powershell -Command "Expand-Archive MCP-1.8.8.zip"
del MCP-1.8.8.zip
cls
echo Setting up MCP-1.8.8... (this will take a long time)
cd MCP-1.8.8
runtime\bin\python\python_mcp runtime\decompile.py %*
echo.
cls
echo Removing irrelevant files...
del *.bat
del *.sh
del CHANGELOG
rmdir /Q /S bin
rmdir /Q /S conf
rmdir /Q /S docs
rmdir /Q /S logs
rmdir /Q /S reobf
rmdir /Q /S runtime
rmdir /Q /S temp
cls
echo Congrats! Your MCP-%subversiob% is successfully set up and installed. You can use, move and rename it now!
goto end
)

:syntaxerror
cls
color 4
echo Please check again if you didn't mistype. Error code: tjmcpg-0
goto end

:folderalreadyexistserror
cls
color 4
echo Please remove, move or rename the folder MCP-%subversion%. Error code: tjmcpg-1
goto end

:end
pause