{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    extraPackages = with pkgs; [
      nixd
      wl-clipboard
    ];
    settings = {
      theme = "base16_transparent";
      editor = {
        cursor-shape.insert = "bar";
        soft-wrap.enable = true;
        line-number = "relative";
        mouse = false;
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          language-servers = [ "nixd" ];
        }
        {
          name = "rust";
          auto-format = true;
          language-servers = [ "rust-analyzer" ];
        }
        {
          name = "c";
          auto-format = true;
          language-servers = [ "clangd" ];
        }
        {
          name = "cpp";
          auto-format = true;
          language-servers = [
            "clangd"
            "arduino-language-server"
          ];
          file-types = [
            "c"
            "cc"
            "cpp"
            "cxx"
            "h"
            "hpp"
            "ino"
          ];
          roots = [
            "sketch.yaml"
            "arduino-cli.yaml"
            ".git"
          ];
        }
        # {
        #   name = "arduino";
        #   scope = "source.arduino";
        #   injection-regex = "arduino";
        #   file-types = [ "ino" ];
        #   roots = [ "sketch.yaml" "arduino-cli.yaml" ".git" ];
        #   auto-format = true;
        #   language-servers = [ "arduino-language-server" ];
        # }
      ];
      language-server = {
        nixd = {
          command = "nixd";
        };
        rust-analyzer = {
          command = "rust-analyzer";
        };
        arduino-language-server = {
          command = "arduino-language-server";
          args = [
            "-cli"
            "arduino-cli"
            "-clangd"
            "clangd"
          ];
        };
      };
    };
  };

  xdg.desktopEntries = {
    "Helix" = {
      name = "Helix";
      genericName = "Text Editor";
      exec = "env ghostty  --window-width=135 --window-height=30 -e hx %F";
      terminal = false;
      icon = "helix";
      categories = [
        "Utility"
        "TextEditor"
      ];
      mimeType = [ "text/plain" ];
    };
  };
}
