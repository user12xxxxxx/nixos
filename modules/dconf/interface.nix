# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      accent-color = "red";
      clock-format = "12h";
      clock-show-weekday = true;
      color-scheme = "prefer-dark";
      cursor-size = 24;
      cursor-theme = "Bibata-Modern-Ice";
      enable-animations = true;
      font-antialiasing = "rgba";
      gtk-theme = "adw-gtk3-dark";
      icon-theme = "Adwaita";
      show-battery-percentage = true;
      text-scaling-factor = 1.0;
      toolkit-accessibility = false;
    };

  };
}
