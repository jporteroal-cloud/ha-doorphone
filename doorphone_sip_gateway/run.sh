#!/bin/bash

mkfifo /tmp/audio_in
mkfifo /tmp/audio_out

python3 /bridge.py &

pjsua \
  --id sip:jesus@homeassistant.local \
  --registrar sip:homeassistant.local \
  --username jesus		 \
  --password 195403 \
  --auto-answer 200 \
  --clock-rate 8000 \
  --play-file /tmp/audio_in \
  --rec-file /tmp/audio_out
