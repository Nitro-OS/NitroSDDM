# NitroSDDM

NitroSDDM is a Qt 6 SDDM theme for Nitro OS. It provides a keyboard-friendly
login screen with session selection, power controls, custom fonts, and a
configurable background.

<img width="1896" height="1023" alt="image" src="https://github.com/user-attachments/assets/dcbba95d-c0b6-47e7-92ac-ceec127f98b6" />

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/abd4a173-0f20-475b-9afd-9e0b55deb1b9" />

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