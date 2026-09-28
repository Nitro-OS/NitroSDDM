#!/bin/sh

set -eu

theme_name='NitroSDDM'
script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
install_root=${INSTALL_ROOT:-/}
theme_dir=${install_root%/}/usr/share/sddm/themes/$theme_name

if [ -z "$install_root" ]; then
    install_root='/'
fi

use_sudo=0
if [ "$(id -u)" -ne 0 ] && [ ! -w "$(dirname "$theme_dir")" ]; then
    use_sudo=1
fi

run() {
    if [ "$use_sudo" -eq 1 ]; then
        sudo "$@"
    else
        "$@"
    fi
}

if [ "$use_sudo" -eq 1 ] && ! command -v sudo >/dev/null 2>&1; then
    printf '%s\n' 'Error: sudo is required to install the theme system-wide.' >&2
    exit 1
fi

run install -d "$theme_dir" "$theme_dir/Assets" "$theme_dir/Components" "$theme_dir/Utils"
run install -m 644 \
    "$script_dir/Main.qml" \
    "$script_dir/metadata.desktop" \
    "$script_dir/theme.conf" \
    "$theme_dir/"
run cp -R "$script_dir/Assets/." "$theme_dir/Assets/"
run cp -R "$script_dir/Components/." "$theme_dir/Components/"
run cp -R "$script_dir/Utils/." "$theme_dir/Utils/"

printf 'Installed %s to %s\n' "$theme_name" "$theme_dir"