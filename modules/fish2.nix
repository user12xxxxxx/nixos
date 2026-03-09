{ ... }:

{
  programs.fish.enable = true;
  xdg.configFile."fish/config.fish".source = ./config/config.fish;
}