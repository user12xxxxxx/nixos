{ ... }:

{
  programs.zed-editor = {
    enable = true;
    extensions = [ "nix" "toml" "html" "scss" "fish" "make" ];
  };
}