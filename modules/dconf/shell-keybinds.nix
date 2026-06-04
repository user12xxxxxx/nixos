# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/shell/keybindings" = {
      focus-active-notification = [];
      shift-overview-down = [ "<Super><Alt>Down" ];
      shift-overview-up = [ "<Super><Alt>Up" ];
      toggle-application-view = [];
      toggle-message-tray = [];
      toggle-overview = [ "<Super>space" ];
      toggle-quick-settings = [];
    };

  };
}
