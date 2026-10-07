#!/bin/bash
# Installs WiFi Share: adds it to the menu (Internet → WiFi Share) and the desktop.
set -e
HERE="$(cd "$(dirname "$0")" && pwd)"
APP_DIR="$HOME/.local/share/wifi-share"

if ! command -v nmcli >/dev/null; then
    echo "NetworkManager isn't active on this Pi."
    echo "Turn it on with: sudo raspi-config → Advanced Options → Network Config → NetworkManager"
    echo "Reboot, then run this installer again."
    exit 1
fi

if ! python3 -c "import tkinter" 2>/dev/null; then
    echo "Installing python3-tk…"
    sudo apt-get update && sudo apt-get install -y python3-tk
fi

mkdir -p "$APP_DIR" "$HOME/.local/share/applications"
cp "$HERE/wifi_share.py" "$APP_DIR/"
chmod +x "$APP_DIR/wifi_share.py"

DESKTOP_FILE="[Desktop Entry]
Type=Application
Name=WiFi Share
Comment=Share Wi-Fi to the Ethernet port and see who's connected
Exec=python3 $APP_DIR/wifi_share.py
Icon=network-wired
Terminal=false
Categories=Network;"

echo "$DESKTOP_FILE" > "$HOME/.local/share/applications/wifi-share.desktop"
if [ -d "$HOME/Desktop" ]; then
    echo "$DESKTOP_FILE" > "$HOME/Desktop/wifi-share.desktop"
    chmod +x "$HOME/Desktop/wifi-share.desktop"
fi

echo "Done! Open it from the menu: Internet → WiFi Share"
echo "(or run: python3 $APP_DIR/wifi_share.py)"
