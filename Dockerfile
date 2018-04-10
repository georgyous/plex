FROM oraclelinux:7-slim

RUN \
 echo "*** add plex user ***" && \
 useradd -u 995 -U -c "PlexUser" --home-dir /plex  -s /sbin/nologin plex

COPY root/ /

EXPOSE 32400 32400/udp 32469 32469/udp 5353/udp 1900/udp
VOLUME /plex /data /transcode
#CMD LD_LIBRARY_PATH=/usr/lib/plexmediaserver /usr/lib/plexmediaserver/Plex\ Media\ Server
CMD /etc/init.d/start_plex.sh