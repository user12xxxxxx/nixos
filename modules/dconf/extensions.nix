# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/shell/extensions/EasyScreenCast" = {
      active-custom-gsp = false;
      file-container = 5;
      file-resolution-type = -1;
      fps = 60;
      input-audio-source = 1;
      pipeline = "queue max-size-buffers=0 max-size-time=0 max-size-bytes=0 ! videorate ! vp8enc min_quantizer=0 max_quantizer=5 cpu-used=3 deadline=1000000 threads=%T ! queue max-size-buffers=0 max-size-time=0 max-size-bytes=0 ! mux. pulsesrc ! queue max-size-buffers=0 max-size-time=0 max-size-bytes=0 ! audioconvert ! vorbisenc ! queue max-size-buffers=0 max-size-time=0 max-size-bytes=0 ! mux. webmmux name=mux ";
      quality-index = 3;
      quality-webcam = "";
      status-indicators = 0;
    };

    "org/gnome/shell/extensions/caffeine" = {
      cli-toggle = true;
      enable-fullscreen = false;
      indicator-position-max = 3;
      restore-state = true;
      show-notifications = false;
      user-enabled = true;
    };

    "org/gnome/shell/extensions/clipboard-indicator" = {
      disable-down-arrow = true;
      next-history-clear = -1;
      notify-on-cycle = false;
      paste-button = false;
      preview-size = 25;
    };

    "org/gnome/shell/extensions/copyous" = {
      auto-hide-search = true;
      clipboard-history = "keep-pinned-and-tagged";
      clipboard-orientation = "vertical";
      clipboard-position-horizontal = "top";
      clipboard-position-vertical = "fill";
      clipboard-size = 500;
      database-backend = "sqlite";
      disable-hljs-dialog = true;
      dynamic-item-height = true;
      header-controls-visibility = "visible-on-hover";
      item-height = 100;
      item-width = 300;
      open-clipboard-dialog-shortcut = [ "<Super>v" ];
      show-at-pointer = true;
      show-header = false;
      show-scrollbar = false;
    };

    "org/gnome/shell/extensions/copyous/file-item" = {
      file-preview-visibility = "file-info";
    };

    "org/gnome/shell/extensions/copyous/link-item" = {
      link-preview-orientation = "horizontal";
    };

    "org/gnome/shell/extensions/just-perfection" = {
      accent-color-icon = false;
      activities-button = true;
      controls-manager-spacing-size = 1;
      dash = false;
      overlay-key = false;
      search = false;
      startup-status = 0;
      support-notifier-showed-version = 36;
      switcher-popup-delay = false;
      window-preview-close-button = true;
      workspace-switcher-should-show = true;
      workspace-switcher-size = 15;
    };

    "org/gnome/shell/extensions/screentospace" = {
      trigger-on-fullscreen = true;
      trigger-on-maximize = true;
      triggers-migrated = true;
    };

    "org/gnome/shell/extensions/vitals" = {
      fixed-widths = true;
      hide-icons = true;
      memory-measurement = 1;
      show-system = false;
      show-temperature = false;
      show-voltage = false;
      use-higher-precision = false;
    };

  };
}
