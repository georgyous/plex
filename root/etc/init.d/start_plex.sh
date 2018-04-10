#!/bin/bash
export PLEX_USER=plex
export PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR="`getent passwd $PLEX_USER|awk -F : '{print $6}'`/Library/Application Support"
export PLEX_MEDIA_SERVER_HOME=/usr/lib/plexmediaserver
export PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS=2
export PLEX_MEDIA_SERVER_TMPDIR=/tmp
export PLEX_PREFERENCES_FILE="`getent passwd $PLEX_USER|awk -F : '{print $6}'`/Library/Application Support/Plex Media Server/Preferences.xml"
export PLEX_PID_FILE="${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}/Plex Media Server/plexmediaserver.pid"
export LD_LIBRARY_PATH=/usr/lib/plexmediaserver
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

/usr/bin/test -d "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}" || /bin/mkdir -p "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}"
/usr/bin/test -d "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}/Plex Media Server" || /bin/mkdir -p "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}/Plex Media Server"

if [ ! -f "${PLEX_PREFERENCES_FILE}" ]; then
cat <<EOF > "${PLEX_PREFERENCES_FILE}"
<?xml version="1.0" encoding="utf-8"?>
<Preferences OldestPreviousVersion="1.1.4.2757-24ffd60" MachineIdentifier="ff72b5cb-8d8b-46ee-b86a-9d01634c3c0c" ProcessedMachineIdentifier="0416a0c360efc562422384c68cb7afdcf68b5ac6" AnonymousMachineIdentifier="3c730612-51c0-425d-b9b6-db262c75b08c" agentAutoEnabled.com.plexapp.agents.lastfm.Artists.com.plexapp.agents.vevo="1" MetricsEpoch="1" GracenoteUser="WEcxA9eplvnjvv0iSkttbdq1gUi+T+d2qeaCvooskoWIKFcZG83juRU2yuDn95GB2ICtTzYpQeX1M2rNoV/2gQFPN9MyulIw2wip07gYc26Cz0kPL1YKnNNqvHjmdnorWLShkgU/iSElert5t4Y7HH52GzQfn0rutKfICr2+8N5Fe3mOrEjZ4a46jDYc8rWX0t8=" AcceptedEULA="1" FriendlyName="plex" PublishServerOnPlexOnlineKey="0" DlnaClientPreferences="IP=192.168.250.141,DirectPlay=true,DirectStream=true,LocalResolution=1920x1080,RemoteResolution=1280x720,OnlineResolution=1280x720,LocalVideoQuality=74,RemoteVideoQuality=49,OnlineVideoQuality=49,SubtitleSize=100,AudioBoost=100,MusicBitrate=192;IP=192.168.250.100,DirectPlay=false,DirectStream=true,LocalResolution=1920x1080,RemoteResolution=1280x720,OnlineResolution=1280x720,LocalVideoQuality=74,RemoteVideoQuality=49,OnlineVideoQuality=49,SubtitleSize=100,AudioBoost=100,MusicBitrate=192;IP=192.168.250.147,DirectPlay=true,DirectStream=true,LocalResolution=1920x1080,RemoteResolution=1280x720,OnlineResolution=1280x720,LocalVideoQuality=74,RemoteVideoQuality=49,OnlineVideoQuality=49,SubtitleSize=100,AudioBoost=100,MusicBitrate=192" FSEventLibraryPartialScanEnabled="0" FSEventLibraryUpdatesEnabled="1" collectUsageData="0" logDebug="0" watchMusicSections="1" ButlerTaskCheckForUpdates="0" GenerateChapterThumbBehavior="asap" ScannerLowPriority="1" ScheduledLibraryUpdateInterval="900" ScheduledLibraryUpdatesEnabled="1" allowedNetworks="192.168.250.0/24,192.168.200.0/24,192.168.245.0/24,192.168.249.0/24"/>
EOF
fi

if [ -f "${PLEX_PID_FILE}" ]; then
rm -rf ${PLEX_PID_FILE}
fi

/usr/lib/plexmediaserver/Plex\ Media\ Server
