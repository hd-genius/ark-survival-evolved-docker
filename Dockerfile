# container setup
FROM cm2network/steamcmd

ARG APP_HOME=/home/game-host/applications/ark-survival-evolved

ENV MAP_NAME=TheIsland
ENV SESSION_NAME="containerized ark server"
ENV SERVER_PASSWORD=""
ENV SERVER_ADMIN_PASSWORD="123admin"

# Game port
EXPOSE 7777
# EXPOSE ${GAME_PORT + 1}
# Query port
EXPOSE 27015
# Rcon port
EXPOSE 27020

VOLUME ${APP_HOME}/mods

# folder where the application is hosted
WORKDIR ${APP_HOME}

# region Dependencies
# RUN apt-get install lib32gcc1
# endregion

COPY . .

# region Ark system configuration
USER root
RUN echo "fs.file-max=100000" >> /etc/sysctl.conf
# RUN sysctl -p /etc/sysctl.conf

RUN echo "*               soft    nofile          1000000" >> /etc/security/limits.conf
RUN echo "*               hard    nofile          1000000" >> /etc/security/limits.conf

RUN echo "session required pam_limits.so" >> /etc/pam.d/common-session
# endregion

USER steam

ENTRYPOINT [ "./start-server.sh" ]