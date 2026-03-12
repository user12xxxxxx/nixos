{ pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;
    extensions = [ "nix" "toml" "html" "scss" "fish" "make" ];
    extraPackages = [ pkgs.nixd pkgs.nil ];
    userSettings = {
      terminal = {
        cursor_shape = "bar"; 
        shell.program = "/etc/profiles/per-user/nautesh/bin/fish";
      };
      lsp.nil.initialization_options.nix.flake.autoArchive = true;
    };
  };
}