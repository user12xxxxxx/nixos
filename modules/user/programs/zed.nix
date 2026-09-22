# { pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
      "html"
      "scss"
      "fish"
      "make"
      "live-server"
    ];
    # extraPackages = [
    #   # pkgs.nil
    #   pkgs.nixd
    # ];
    userSettings = {
      helix_mode = true;
      gutter.min_line_number_digits = 3;
      relative_line_numbers = "enabled";

      autosave.after_delay.milliseconds = 1000;
      terminal = {
        cursor_shape = "bar";
        # shell.program = "/etc/profiles/per-user/nautesh/bin/fish";
      };

      # languages.Nix.language_servers = [
      #   "!nil"
      #   "nixd"
      # ];
      # lsp.nil.initialization_options.nix.flake.autoArchive = true;
    };
  };
}
