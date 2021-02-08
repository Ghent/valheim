# Dockerfile that builds a Valheim dedicated server
# Inspired by CM2Walki - https://github.com/CM2Walki
FROM cm2network/steamcmd:latest

LABEL maintainer="ghentlinux@gmail.com"

ENV STEAMAPPID 896660
ENV STEAMAPP valheim
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}-dedicated"
ENV DLURL https://raw.githubusercontent.com/Ghent/valheim

RUN set -x \
    && mkdir -p "${STEAMAPPDIR}" \
    && wget --max-redirect=30 "${DLURL}/master/etc/entry.sh" -O "${HOMEDIR}/entry.sh" \
    && chmod +x "${HOMEDIR}/entry.sh" \
    && chown -R "${USER}:${USER}" "${HOMEDIR}/entry.sh" "${STEAMAPPDIR}"

ENV SERVER_NAME="${USER}'s Valheim Server" \
    SERVER_PORT=2456 \
    SERVER_WORLD="Dedicated" \
    SERVER_PASSWORD="changeme" \
    SERVER_PUB=1

USER ${USER}

WORKDIR ${HOMEDIR}

VOLUME ${STEAMAPPDIR}

CMD ["bash", "entry.sh"]
