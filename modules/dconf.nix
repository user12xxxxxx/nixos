{ config, lib, ... }:

let
  enabledExtensions = [
    "appindicatorsupport@rgcjonas.gmail.com"
    "caffeine@patapon.info"
    "clipboard-indicator@tudmotu.com"
    # "color-picker@tuberry"
    "gnome-ui-tune@itstime.tech"
    "just-perfection-desktop@just-perfection"
    "static-workspace-background@CleoMenezesJr.github.io"
    # "Vitals@CoreCoding.com"
    "screentospace@dilzhan.dev"
    "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
    "azwallpaper@azwallpaper.gitlab.com"
    "valent@andyholmes.ca"
  ];
in
{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        enabled-extensions = enabledExtensions;
      };
      "org/gnome/desktop/interface" = {
        show-battery-percentage = true;
        gtk-theme = "adw-gtk3-dark";
      };
      "org/gnome/mutter" = {
        attach-modal-dialogs = true;
        overlay-key = "";
      };
      "org/gnome/shell/extensions/appindicator" = {
        legacy-tray-enabled = false;
      };
      "org/gnome/shell/extensions/caffeine" = {
        restore-state = true;
        enable-fullscreen = false;
        show-notifications = false;
      };
      "org/gnome/shell/extensions/gnome-ui-tune" = {
        increase-thumbnails-size = "400%";
      };
      "org/gnome/shell/extensions/just-perfection" = {
        dash = false;
        startup-status = 0;
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
      "org/gnome/shell/extensions/azwallpaper" = {
        slideshow-slide-duration = lib.hm.gvariant.mkTuple [ 1 0 0 ];
        slideshow-queue-sort-type = "A-Z";
        slideshow-directory = "${config.home.homeDirectory}/Pictures/wallpaper";
      };
      "org/gnome/shell/extensions/color-picker" = {
        enable-format = true;
      };
      "org/gnome/shell/keybindings" = {
        toggle-quick-settings = [];
        toggle-application-view = [];
        toggle-overview = [ "<Super>space" ];
      };
      "org/gnome/desktop/wm/keybindings" = {
        close = [ "<Super>q" ];
        move-to-workspace-left = [ "<Super>d" ];
        move-to-workspace-right = [ "<Super>f" ];
        switch-to-workspace-left = [ "<Super>a" ];
        switch-to-workspace-right = [ "<Super>s" ];
        switch-windows = [ "<Super>e" ];
        toggle-maximized = [ "<Super>Up" ];
        switch-applications = [ "<Super>w" ];
        switch-applications-backward = [ "<Shift><Super>w" ];
        cycle-group = ["<Super>e"];
        cycle-group-backward = ["<Shift><Super>e"];
      };
    };
  };
}
