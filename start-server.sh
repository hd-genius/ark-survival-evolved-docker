#!/bin/bash

cd ~
./steamcmd

login anonymous
force_install_dir /home/game-host/applications/ark-survival-evolved
app_update 376030 validate
exit

./ShooterGameServer TheIsland?listen?SessionName=<server_name>?ServerPassword=<join_password>?ServerAdminPassword=<admin_password> -server -log