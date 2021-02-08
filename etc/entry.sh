#!/bin/bash
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export SteamAppId=892970

mkdir -p "${STEAMAPPDIR}" || true
cd "${STEAMAPPDIR}"

bash "${STEAMCMDDIR}/steamcmd.sh" +login anonymous \
                +force_install_dir "${STEAMAPPDIR}" \
                +app_update "${STEAMAPPID}" \
                +quit


# NOTE: Minimum password length is 5 characters & password can't be in the server name
./valheim_server.x86_64 -name "${SERVER_NAME}" -port ${SERVER_PORT} -world "${SERVER_WORLD}" -password "${SERVER_PASSWORD}" -public ${SERVER_PUB}
