#!/bin/bash

set -e

mkfifo /tmp/audio_in || true
mkfifo /tmp/audio_out || true

python3 /bridge.py &

exec pjsua \
  --id sip:${SIP_USER}@${SIP_SERVER} \
  --registrar sip:${SIP_SERVER} \
  --username ${SIP_USER} \
  --password ${SIP_PASSWORD} \
  --auto-answer 200 \
  --clock-rate 8000 \
  --play-file /tmp/audio_in \
  --rec-file /tmp/audio_out \
  --log-level 4
