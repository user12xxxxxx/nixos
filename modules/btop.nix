{ ... }:

{
  programs.btop = {
    enable = true;
    
    settings = {
      theme_background = false;
      vim_keys = true;
      rounded_corners = false;
      update_ms = 1000;
      net_auto = false;
    };
  };
}
