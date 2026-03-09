{ config, ... }:

{
  xdg.configFile = 
    let
      dotfilesDir = "${config.home.homeDirectory}/.hp14/config";
    in 
    {
      "gtk-3.0".source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/gtk-3.0";
      "gtk-4.0".source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/gtk-4.0";
      "micro".source   = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/micro";
      "pqivrc".source  = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/pqivrc";
      "satty".source   = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/satty";
      "btop".source    = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/btop";
      "kicad".source   = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/kicad";
      "fish".source    = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/fish";
    };
}