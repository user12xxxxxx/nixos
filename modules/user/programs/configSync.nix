{ config, lib, ... }:

let
  dotfilesDir = "${config.home.homeDirectory}/.hp14/modules/user/config";
  configs = [
    "gtk-3.0"
    "gtk-4.0"
    "fish"
    "ghostty"
    "yazi"
    "tmux"
  ];
in
{
  xdg.configFile = lib.genAttrs configs(name: {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/${name}";
    }
  );
}
