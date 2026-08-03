#!/usr/bin/env bash

CONFIG_DIR="$HOME/.hp14"
# DCONF_DIR="$CONFIG_DIR/modules/gnome"
DCONF_DIR="$CONFIG_DIR/modules/user/gnome/settings"

# Maping files
declare -A DCONF_PATHS=(
    ["extensions"]="/org/gnome/shell/extensions/"
    ["interface"]="/org/gnome/desktop/interface/"
    ["mutter"]="/org/gnome/mutter/"
    ["peripherals"]="/org/gnome/desktop/peripherals/"
    ["shellKeybinds"]="/org/gnome/shell/keybindings/"
    ["wm"]="/org/gnome/desktop/wm/"
    ["customKeybinds"]="/org/gnome/settings-daemon/plugins/media-keys/"
)

echo "Syncing GNOME settings to $DCONF_DIR"

for name in "${!DCONF_PATHS[@]}"; do
    path="${DCONF_PATHS[$name]}"
    output_file="$DCONF_DIR/${name}.nix"

    # Capture raw dconf data
    dump_data=$(dconf dump "$path")

    # Check if the path has any custom settings
    if [ -z "$dump_data" ]; then
        echo "  ↳ Skipping $name (No custom settings found)"
        echo "{ dconf.settings = {}; }" > "$output_file"
    else
        echo "  ↳ Dumping $name -> ${name}.nix..."
        # Piping it into dconf2nix
        echo "$dump_data" | nix run nixpkgs#dconf2nix -- --root "$path" > "$output_file"
    fi
done

echo "Sync Successfull"
