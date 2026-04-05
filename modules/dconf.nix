{ config, lib, ... }:

let
  enabledExtensions = [
    "appindicatorsupport@rgcjonas.gmail.com"
    "caffeine@patapon.info"
    "clipboard-indicator@tudmotu.com"
    # "color-picker@tuberry"
    "just-perfection-desktop@just-perfection"
    "static-workspace-background@CleoMenezesJr.github.io"
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
      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/"
        ];
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Super>r";
        command = "zen-beta";
        name = "browser";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        binding = "<Super>x";
        command = "nautilus --new-window";
        name = "file";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
        binding = "<Super>c";
        command = "ghostty";
        name = "terminal";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
        binding = "<Super>t";
        command = ''sh -c "ghostty --window-width=135 --window-height=30 -e btop --force-utf"'';
        name = "btop";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4" = {
        binding = "<Super>g";
        command = "env ghostty --window-width=135 --window-height=30 -e yazi";
        name = "yazi";
      };
      # EXTENSIONS
      "org/gnome/shell/extensions/appindicator" = {
        legacy-tray-enabled = false;
      };
      "org/gnome/shell/extensions/caffeine" = {
        restore-state = true;
        enable-fullscreen = false;
        show-notifications = false;
      };
      "org/gnome/shell/extensions/just-perfection" = {
        dash = false;
        startup-status = 0;
        workspace-switcher-size = 15;
        workspace-switcher-should-show=true;
      };
      "org/gnome/shell/extensions/clipboard-indicator" = {
        toggle-menu = [ "<Super>v" ];
      };
      "org/gnome/shell/extensions/azwallpaper" = {
        slideshow-slide-duration = lib.hm.gvariant.mkTuple [ 1 0 0 ];
        slideshow-queue-sort-type = "A-Z";
        slideshow-directory = "${config.home.homeDirectory}/Pictures/wallpaper";
      };
      "org/gnome/shell/extensions/color-picker" = {
        enable-format = true;
      };
    };
  };
}
