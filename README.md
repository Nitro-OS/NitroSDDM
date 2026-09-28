# NitroSDDM

NitroSDDM is a Qt 6 SDDM theme for Nitro OS. It provides a keyboard-friendly
login screen with session selection, power controls, custom fonts, and a
configurable background.

<img width="1922" height="1077" alt="image" src="https://github.com/user-attachments/assets/e3b7ffd6-3ee5-41ca-914f-18119f92ab5a" />

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/edae0008-60f0-46e5-954d-d2beefebe571" />

## Requirements

- SDDM with Qt 6 support
- `sudo` for a system-wide installation, unless the script is run as root

## Installation

Clone or download this repository, then run the installer from its directory:

```sh
chmod +x install.sh
./install.sh
```

The installer copies the theme to `/usr/share/sddm/themes/NitroSDDM`. It does
not change the active SDDM theme or modify system configuration.

To install into a staging directory, use `INSTALL_ROOT`:

```sh
INSTALL_ROOT="$PWD/package" ./install.sh
```

## Activate the theme

Set the theme in `/etc/sddm.conf.d/theme.conf`:

```ini
[Theme]
Current=NitroSDDM
```

Restart SDDM or reboot to apply the change. Save your work before restarting
the display manager because it ends the current graphical session.

## Configuration

Edit the installed `theme.conf` to change the background and colors. The
default background is `Assets/background.jpg`, and paths are relative to the
theme directory.

## Remove

Remove the installed theme with:

```sh
sudo rm -rf /usr/share/sddm/themes/NitroSDDM
```

## License

NitroSDDM is released under the MIT License. See [LICENSE](LICENSE).
