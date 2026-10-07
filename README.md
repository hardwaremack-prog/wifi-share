# WiFi Share

Shares a computer's Wi-Fi internet through its Ethernet port and shows the devices plugged in (name, IP, MAC, online status, last seen). Comes in two versions with the same layout.

![WiFi Share screenshot](<WiFi Share - screenshot (from manual).png>)

## Windows

Double-click `WiFi Share.exe` and click Yes on the admin prompt. See `WiFi Share Manual.pdf` for the full guide.

## Raspberry Pi

In the [`raspberry-pi`](raspberry-pi) folder. Needs Raspberry Pi OS Bookworm or newer (NetworkManager). Tested on a Pi 400.

```
git clone https://github.com/hardwaremack-prog/wifi-share
cd wifi-share/raspberry-pi
./install.sh
```

It then appears in the menu under **Internet → WiFi Share** and as a desktop icon. No `sudo` needed to run it.

- **Start sharing automatically at boot** checkbox keeps sharing on after a restart.
- The Pi's Ethernet port becomes `10.42.0.1`; plugged-in devices get `10.42.0.x` addresses.
- Don't plug the Pi's Ethernet into your home router while sharing is on — it would hand out conflicting addresses.

---
Made by hardwaremack.
