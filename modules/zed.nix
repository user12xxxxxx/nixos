{ pkgs, ... }:

{
  # home.sessionVariables.VISUAL = "zeditor";
  programs.zed-editor = {
    enable = true;
    extensions = [ "nix" "toml" "html" "scss" "fish" "make" ];
    extraPackages = [ pkgs.nixd pkgs.nil ];
    userSettings = {
      terminal = {
        cursor_shape = "bar"; 
        shell.program = "/etc/profiles/per-user/nautesh/bin/fish";
      };
      # lsp = {
      #   nix = {
      #     binary = {
      #       path_lookup = true;
      #       path = lib.getExe' pkgs.nixd;
      #     };
      #   };
      # };
      lsp.nil.initialization_options.nix.flake.autoArchive = true;
    };
  };
}