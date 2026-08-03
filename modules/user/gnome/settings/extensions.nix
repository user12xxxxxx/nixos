# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/shell/extensions/EasyScreenCast" = {
      active-custom-gsp = false;
      area-screen = 3;
      corner-position-webcam = 0;
      delay-time = 0;
      device-webcam = "";
      device-webcam-index = 0;
      draw-cursor = true;
      execute-post-cmd = false;
      execute-pre-cmd = false;
      file-container = 5;
      file-folder = "/home/nautesh/Videos/Screencasts";
      file-name = "Screencast From %Y-%m-%d %H-%M-%S";
      file-resolution-type = -1;
      fps = 60;
      height-rec = 314;
      height-webcam = 10;
      input-audio-source = 1;
      margin-x-webcam = 0;
      margin-y-webcam = 0;
      pipeline = "queue max-size-buffers=0 max-size-time=0 max-size-bytes=0 ! videorate ! vp8enc min_quantizer=0 max_quantizer=5 cpu-used=3 deadline=1000000 threads=%T ! queue max-size-buffers=0 max-size-time=0 max-size-bytes=0 ! mux. pulsesrc ! queue max-size-buffers=0 max-size-time=0 max-size-bytes=0 ! audioconvert ! vorbisenc ! queue max-size-buffers=0 max-size-time=0 max-size-bytes=0 ! mux. webmmux name=mux ";
      post-cmd = "xdg-open _fpath &";
      quality-index = 3;
      quality-webcam = "";
      show-area-rec = false;
      show-notify-alert = true;
      status-indicators = 0;
      type-unit-webcam = 0;
      verbose-debug = false;
      width-rec = 283;
      width-webcam = 20;
      x-pos = 765;
      y-pos = 151;
    };

    "org/gnome/shell/extensions/advanced-alt-tab-window-switcher" = {
      app-switcher-popup-fav-apps = false;
      app-switcher-popup-sorting = 2;
      switcher-ws-thumbnails = 2;
      win-switcher-popup-sorting = 2;
    };

    "org/gnome/shell/extensions/awesome-tiles" = {
      enable-bottom-gap = false;
      gap-size-in-pixels = true;
      shortcut-tile-window-to-center = [ "<Super>j" ];
      shortcut-tile-window-to-left = [ "<Super>k" ];
      shortcut-tile-window-to-right = [ "<Super>l" ];
      tiling-steps-center = "1, 0.75, 0.25";
      tiling-steps-side = "0.5, 0.33";
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      rounded-blur-found = false;
      settings-version = 2;
    };

    "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
      brightness = 0.6;
      sigma = 30;
    };

    "org/gnome/shell/extensions/blur-my-shell/applications" = {
      blur = false;
      opacity = 238;
      pipeline = "pipeline_default";
      whitelist = [ "org.gnome.Shell.Extensions" ];
    };

    "org/gnome/shell/extensions/blur-my-shell/coverflow-alt-tab" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      blur = false;
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
      blur = false;
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur = false;
      brightness = 0.6;
      corner-radius = 0;
      pipeline = "pipeline_default";
      sigma = 30;
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

    "org/gnome/shell/extensions/color-picker" = {
      color-history = [ (mkUint32 1908000) 1908000 2631720 ];
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

    "org/gnome/shell/extensions/coverflowalttab" = {
      bind-to-switch-applications = true;
      bind-to-switch-windows = true;
      coverflow-switch-applications = [ "" ];
      coverflow-switch-applications-backward = [ "<Shift>" ];
      coverflow-switch-applications-on-all-workspaces = [ "" ];
      coverflow-switch-applications-on-all-workspaces-backward = [ "<Shift>" ];
      coverflow-switch-windows = [ "" ];
      coverflow-switch-windows-backward = [ "<Shift>" ];
      coverflow-switch-windows-on-all-workspaces = [ "" ];
      coverflow-switch-windows-on-all-workspaces-backward = [ "<Shift>" ];
      switcher-background-color = mkTuple [ 1.0 1.0 1.0 ];
    };

    "org/gnome/shell/extensions/grimble" = {
      fullscreen-switch = 0;
      keybinding-close = [];
      keybinding-focus = [];
      keybinding-focus-bottom = [];
      keybinding-focus-left = [];
      keybinding-focus-right = [];
      keybinding-focus-top = [];
      keybinding-maximize = [];
      keybinding-move = [];
      keybinding-move-bottom = [];
      keybinding-move-left = [];
      keybinding-move-right = [];
      keybinding-move-top = [];
      keybinding-next-monitor = [];
      keybinding-next-workspace = [];
      keybinding-open-settings = [ "<Control><Super>g" ];
      keybinding-previous-workspace = [];
      keybinding-resize = [];
      keybinding-resize-bottom = [];
      keybinding-resize-left = [];
      keybinding-resize-right = [];
      keybinding-resize-top = [];
      keybinding-rotation = [];
      keybinding-search = [];
      keybinding-toggle-tile = [];
      monitor-tile-insertion-behavior = 0;
      mouse-follow = true;
      search-entry-position = 0;
    };

    "org/gnome/shell/extensions/just-perfection" = {
      accent-color-icon = false;
      accessibility-menu = true;
      activities-button = true;
      animation = 1;
      controls-manager-spacing-size = 1;
      dash = false;
      dash-icon-size = 0;
      overlay-key = false;
      panel = true;
      panel-in-overview = true;
      ripple-box = true;
      search = false;
      show-apps-button = true;
      startup-status = 1;
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

    "org/gnome/shell/extensions/mouse-tail" = {
      alpha = 0.5;
      color = [ 1.0 1.0 1.0 ];
      color-mode = "solid";
      fade-duration = 200;
      line-width = 8;
      rainbow-fixed-config = "#FF6B6B 500n#4ECDC4 500n#FFE66D";
      rainbow-ratio-config = "#FF6B6B 1n#4ECDC4 1n#FFE66D 1";
      rainbow-time-config = "#FF6B6B 500n#4ECDC4 500n#FFE66D 500";
      render-mode = "precise";
    };

    "org/gnome/shell/extensions/mousewarp" = {
      keyboard-only = true;
    };

    "org/gnome/shell/extensions/paperwm" = {
      default-focus-mode = 1;
      last-used-display-server = "Wayland";
      restore-attach-modal-dialogs = "";
      restore-edge-tiling = "";
      restore-keybinds = ''
        {}\\\\\\\\\\\\\\\\n\\\\\\\\n\\\\n\\n\n
      '';
      restore-workspaces-only-on-primary = "";
      show-window-position-bar = false;
      show-workspace-indicator = false;
    };

    "org/gnome/shell/extensions/paperwm/workspaces" = {
      list = [ "8b373d7a-2a71-4ad6-b134-83ba67a1843b" "dc58d7e7-5bb4-4a33-ba33-2bca224d7b5c" ];
    };

    "org/gnome/shell/extensions/paperwm/workspaces/8b373d7a-2a71-4ad6-b134-83ba67a1843b" = {
      index = 0;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/dc58d7e7-5bb4-4a33-ba33-2bca224d7b5c" = {
      index = 1;
    };

    "org/gnome/shell/extensions/rounded-window-corners-reborn" = {
      settings-version = mkUint32 9;
      skip-libadwaita-app = true;
    };

    "org/gnome/shell/extensions/screentospace" = {
      insert-workspace-after-current = true;
      trigger-on-fullscreen = true;
      trigger-on-maximize = true;
      triggers-migrated = true;
    };

    "org/gnome/shell/extensions/simple-tiling/domoel" = {
      exceptions = [ "extension-manager" "gnome-screenshot" "org.gnome.nautiluspreviewer" "evolution-alarm-notify" "org.gnome.nautilus" ];
      last-focused-app-id = "com.mattjakeman.extensionmanager";
      last-focused-wm-class = "com.mattjakeman.extensionmanager";
      new-window-behavior = "stack";
      outer-gap-horizontal = 35;
      outer-gap-vertical = 25;
      pick-mode = false;
    };

    "org/gnome/shell/extensions/switchfocustype" = {
      show-notifications = false;
      use-sloppy = true;
    };

    "org/gnome/shell/extensions/vitals" = {
      fixed-widths = true;
      hide-icons = true;
      hot-sensors = [ "_memory_usage_" "__network-rx_max__" "_processor_usage_" ];
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

  };
}
