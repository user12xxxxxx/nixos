{ ... }:

{
  programs.btop = {
    enable = true;
    
    settings = {
      theme_background = false;
      rounded_corners = false;
      tree = true;
      vim_keys = true;
      proc_tree = true;
      update_ms = 100;
    };
  };

  xdg.desktopEntries = {
    "btop" = {
      name = "btop";
      genericName = "System Monitor";
      exec = "env ghostty  --window-width=135 --window-height=30 -e btop --force-utf";
      terminal = false;
      icon = "btop";
      categories = [ "System" "Monitor" "ConsoleOnly" ];
    };
  };    
}
