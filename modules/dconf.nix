{ ... }:

let
  enabledExtensions = [
    "appindicatorsupport@rgcjonas.gmail.com"
    "caffeine@patapon.info"
    "clipboard-indicator@tudmotu.com"
    "color-picker@tuberry"
    "gnome-ui-tune@itstime.tech"
    "gsconnect@andyholmes.github.io"
    "just-perfection-desktop@just-perfection"
    # "pomodoro@arun.codito.in"
    "static-workspace-background@CleoMenezesJr.github.io"
    "Vitals@CoreCoding.com"
    "lomotion@lorens.com"
    "screentospace@dilzhan.dev"
    "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
  ];
in
{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        enabled-extensions = enabledExtensions;
      };
      "org/gnome/shell/extensions/appindicator" = {
        legacy-tray-enabled = false;
      };
      "org/gnome/shell/extensions/caffeine" = {
        restore-state = true;
        enable-fullscreen = false;
        show-notifications = false;
      };
      # "org/gnome/shell/extensions/color-picker" = {
      # };
      "org/gnome/shell/extensions/gnome-ui-tune" = {
        increase-thumbnails-size = "400%";
      };
      "org/gnome/shell/extensions/just-perfection" = {
        dash = false;
      };
      "org/gnome/shell/extensions/clipboard-indicator" = {
        toggle-menu = [ "<Super>v" ];
      };
      "org/gnome/shell/extensions/vitals" = {
        update-time = 1;
        show-fan = false;
        icon-style = 1;
        show-battery = true;
        hot-sensors = [ "_memory_usage_" "_processor_usage_" "__network-rx_max__" ];
        menu-centered = true;
      };
      "org/gnome/shell/extensions/color-picker" = {
        enable-format = true;
      };
      # "org/gnome/desktop/sound" = {
      #   event-sounds = false;
      # };
    };
  };
}