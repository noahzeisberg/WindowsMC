:INIT
@echo off
title WindowsMC - Minecraft's start.bat reimagined

:CHECKER
if not exist winmc_config.txt goto SETUP
set server_dir=<winmc_config.txt
cd %server_dir%

:SETUP
set /p server_dir_path="Enter path to server folder: "
echo server_dir_path > winmc_config.txt
set server_dir=<winmc_config.txt
cd %server_dir%
if not exist server.jar goto INSTALL_SERVER
mkdir WindowsMC

:INSTALL_SERVER
cd %server_dir%
set /p selected_version="Enter minecraft version: "
curl "https://papermc.io/api/v1/paper/%selected_version%/latest/download" --output server.jar

:MAIN