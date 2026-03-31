{ config, lib, ... }:

let
  dotfilesDir = "${config.home.homeDirectory}/.hp14/config";
  configs = [
    "gtk-3.0"
    "gtk-4.0"
    # "micro"
    # "pqivrc"
    # "satty"
    # "btop"
    "kicad"
    "fish"
    "ghostty"
  ];
in
{
  xdg.configFile =
    lib.genAttrs configs
      (name: {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/${name}";
      });
}
