#!/usr/bin/env bash

# 1. Kill any existing instances of the virtual mic loopback
pkill -f "node.name=Phone_Mic" 2>/dev/null

# 2. Create native PipeWire Sink and Source nodes
pw-loopback \
  --capture-props='media.class=Audio/Sink node.name=Phone_Sink node.description="Phone_Sink"' \
  --playback-props='media.class=Audio/Source node.name=Phone_Mic node.description="Phone_Microphone"' &
LOOPBACK_PID=$!

# Wait briefly for PipeWire to register the nodes
sleep 0.5

echo "Virtual Microphone 'Phone_Microphone' active."
echo "Starting scrcpy... Press Ctrl+C in this terminal to stop."

# 3. Background safety worker: force-unlink from headphones & route to Phone_Sink
(
  sleep 1.2
  # Disconnect scrcpy from any headphone/speaker playback ports
  pw-link -l 2>/dev/null | grep -E "scrcpy.*->" | while read -r out_port arrow in_port; do
    if [[ "$in_port" != *"Phone_Sink"* ]] && [[ -n "$in_port" ]]; then
      pw-link -d "$out_port" "$in_port" 2>/dev/null
    fi
  done

  # Explicitly link scrcpy output to Phone_Sink input
  pw-link scrcpy:output_FL Phone_Sink:playback_FL 2>/dev/null
  pw-link scrcpy:output_FR Phone_Sink:playback_FR 2>/dev/null
  pw-link scrcpy:output_MONO Phone_Sink:playback_FL 2>/dev/null
  pw-link scrcpy:output_MONO Phone_Sink:playback_FR 2>/dev/null
) &

# 4. Launch scrcpy targeting the virtual sink
PIPEWIRE_NODE="Phone_Sink" PULSE_SINK="Phone_Sink" scrcpy --no-video --audio-source=mic --audio-buffer=50 --audio-codec=raw

# 5. Clean up virtual device on exit
echo "Stopping virtual microphone..."
kill "$LOOPBACK_PID" 2>/dev/null
wait "$LOOPBACK_PID" 2>/dev/null
echo "Done."
