{ ... }:

{
  xdg.desktopEntries = {
    "yazi" = {
      name = "Yazi";
      genericName = "File Manager";
      exec = "env ghostty  --window-width=135 --window-height=30 -e yazi %U"; 
      terminal = false;
      icon = "yazi";
      categories = [ "System" "FileTools" "FileManager" "ConsoleOnly" ];
      mimeType = [ "inode/directory" ]; 
    };
      
    "zen-beta" = {
      name = "Zen Browser";
      genericName = "Web Browser";
      exec = "zen-beta --name zen-beta %U";
      icon = "${../config/assets/zen-browser-dark.png}";
      terminal = false;
      type = "Application";
      categories = [ "Network" "WebBrowser" ];
      
      mimeType = [
        "text/html"
        "text/xml"
        "application/xhtml+xml"
        "application/vnd.mozilla.xul+xml"
        "x-scheme-handler/http"
        "x-scheme-handler/https"
      ];

      settings = {
        StartupNotify = "true";
        StartupWMClass = "zen-beta";
        Version = "1.5";
      };

      actions = {
        "new-private-window" = {
          name = "New Private Window";
          exec = "zen-beta --private-window %U";
        };
        "new-window" = {
          name = "New Window";
          exec = "zen-beta --new-window %U";
        };
        "profile-manager-window" = {
          name = "Profile Manager";
          exec = "zen-beta --ProfileManager";
        };
      };
    };
  };
}
