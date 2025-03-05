#!/bin/bash
set -e

# Start the Tailscale daemon in the background
/usr/sbin/tailscaled &

# Allow some time for tailscaled to initialize
sleep 5

# Bring up Tailscale with the provided auth key
# (Replace this token with a secure method for production!)
tailscale up --authkey tskey-auth-kQ7f7jymh421CNTRL-dQ2aWwNPZ1jq4p9TBc2T1jrbWSKA24Pti

# Start the XRDP service
service xrdp start

# Keep the container running so the services remain active
tail -f /dev/null
