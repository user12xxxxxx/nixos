# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/shell/extensions/azwallpaper" = {
      prefs-visible-page = "";
      slideshow-directory = "/home/nautesh/Pictures/wallpaper";
      slideshow-pause = false;
      slideshow-pause-notifications = false;
      slideshow-pause-on-fullscreen = true;
      slideshow-queue-sort-type = "A-Z";
      slideshow-show-quick-settings-entry = true;
      slideshow-slide-duration = mkTuple [ 1 0 0 ];
      update-notifier-project-version = 19;
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      rounded-blur-found = false;
      settings-version = 2;
    };

    "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
      blur = true;
      brightness = 0.6;
      sigma = 30;
    };

    "org/gnome/shell/extensions/blur-my-shell/applications" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/coverflow-alt-tab" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      blur = true;
      brightness = 0.6;
      pipeline = "pipeline_default_rounded";
      sigma = 30;
      static-blur = true;
      style-dash-to-dock = 0;
    };

    "org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      blur = true;
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      brightness = 0.6;
      corner-radius = 0;
      force-light-text = false;
      override-background = true;
      pipeline = "pipeline_default";
      sigma = 30;
      static-blur = true;
      style-panel = 0;
      unblur-in-overview = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/screenshot" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/window-list" = {
      brightness = 0.6;
      sigma = 30;
    };

    "org/gnome/shell/extensions/caffeine" = {
      cli-toggle = true;
      enable-fullscreen = false;
      indicator-position-max = 6;
      restore-state = true;
      show-notifications = false;
      user-enabled = true;
    };

    "org/gnome/shell/extensions/chromaleon" = {
      accent-color = "#d27a46";
      custom-color = false;
      darker = true;
      full-light = true;
      gnome-colors = false;
      last-error = "";
      morewaita = true;
      prefer-light = true;
      recolor-apps = true;
      recolor-folders = true;
      tint-apps = true;
      tint-gtk3 = true;
      tint-panel = true;
      tint-shell = true;
      tinting-strength = 3;
    };

    "org/gnome/shell/extensions/clipboard-indicator" = {
      disable-down-arrow = true;
      next-history-clear = -1;
      notify-on-cycle = false;
      paste-button = false;
      preview-size = 25;
    };

    "org/gnome/shell/extensions/color-picker" = {
      color-history = [ 1908000 1908000 2631720 ];
    };

    "org/gnome/shell/extensions/context-window-title" = {
      activate-button = true;
      activate-clock = false;
      enable-context = false;
      enable-title = true;
      enable-weekday = false;
      enable-window = false;
    };

    "org/gnome/shell/extensions/copyous" = {
      auto-hide-search = true;
      clipboard-history = "keep-all";
      clipboard-orientation = "vertical";
      clipboard-position-horizontal = "top";
      clipboard-position-vertical = "fill";
      clipboard-size = 500;
      database-backend = "sqlite";
      disable-hljs-dialog = true;
      dynamic-item-height = true;
      header-controls-visibility = "visible-on-hover";
      item-height = 90;
      open-clipboard-dialog-behavior = "toggle";
      open-clipboard-dialog-shortcut = [ "<Super>v" ];
      show-at-pointer = true;
      show-content-indicator = false;
      show-header = false;
      show-scrollbar = false;
      swap-copy-shortcut = false;
    };

    "org/gnome/shell/extensions/copyous/file-item" = {
      file-preview-visibility = "file-info";
    };

    "org/gnome/shell/extensions/copyous/link-item" = {
      link-preview-orientation = "horizontal";
    };

    "org/gnome/shell/extensions/copyous/text-item" = {
      show-text-info = false;
    };

    "org/gnome/shell/extensions/just-perfection" = {
      accent-color-icon = false;
      accessibility-menu = true;
      activities-button = true;
      animation = 1;
      controls-manager-spacing-size = 0;
      dash = false;
      dash-icon-size = 0;
      overlay-key = false;
      panel = true;
      panel-in-overview = true;
      ripple-box = true;
      search = false;
      show-apps-button = true;
      startup-status = 0;
      support-notifier-showed-version = 36;
      support-notifier-type = 0;
      switcher-popup-delay = false;
      theme = false;
      window-demands-attention-focus = false;
      window-picker-icon = true;
      window-preview-close-button = true;
      workspace = true;
      workspace-switcher-should-show = true;
      workspace-switcher-size = 15;
      workspaces-in-app-grid = true;
    };

    "org/gnome/shell/extensions/mousewarp" = {
      keyboard-only = true;
    };

    "org/gnome/shell/extensions/rounded-window-corners-reborn" = {
      settings-version = 9;
      skip-libadwaita-app = true;
    };

    "org/gnome/shell/extensions/switcher" = {
      launcher-stats = ''
        {"nixos-manual.desktop":1}
      '';
      max-width-percentage = 40;
      only-current-workspace = true;
    };

    "org/gnome/shell/extensions/vitals" = {
      fixed-widths = true;
      hide-icons = true;
      hot-sensors = [ "_processor_usage_" "_memory_usage_" "__network-rx_max__" ];
      icon-style = 1;
      memory-measurement = 1;
      menu-centered = true;
      show-fan = false;
      show-system = false;
      show-temperature = false;
      show-voltage = false;
      update-time = 1;
      use-higher-precision = false;
    };

    "org/gnome/shell/extensions/window-title-pro" = {
      colored-icon = false;
      fixed-width = true;
      font-size = 14;
      icon-size = 14;
      per-app-color = false;
      separator = " - ";
      show-icon = false;
      show-title = true;
      show-window-count = false;
      show-workspace = false;
      width = 20;
    };

  };
}
