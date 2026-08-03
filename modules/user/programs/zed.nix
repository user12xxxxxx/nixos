{ pkgs, ... }:

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
    ];
    extraPackages = [
      # pkgs.nil
      pkgs.nixd
    ];
    userSettings = {
      helix_mode = true;
      gutter.min_line_number_digits = 3;
      relative_line_numbers = "enabled";
      tab_bar.show = false;
      disable_ai = true;

      autosave.after_delay.milliseconds = 1000;
      ui_font_size = 24.0;
      ui_font_family = "Adwaita Sans";
      buffer_font_size = 24.0;
      buffer_font_family = "JetBrainsMono Nerd Font Mono";

      terminal = {
        cursor_shape = "bar";
        shell.program = "/etc/profiles/per-user/nautesh/bin/fish";
      };

      languages.Nix.language_servers = [
        "!nil"
        "nixd"
      ];
      # lsp.nil.initialization_options.nix.flake.autoArchive = true;
    };
  };
}
