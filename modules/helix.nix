{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    extraPackages = with pkgs; [
      nixd
      wl-clipboard
    ];
    settings = {
      theme = "nyxvamp-veil";
      editor = {
        trim-trailing-whitespace = true;
        indent-guides.render = true;
        cursor-shape.insert = "bar";
        file-picker.hidden = false;
        soft-wrap.enable = true;
        line-number = "relative";
        lsp.display-inlay-hints = true;
        mouse = false;
        auto-save = {
          after-delay.enable = true;
          after-delay.timeout = 1000;
        };
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
          file-types = [ "c" "cc" "cpp" "cxx" "h" "hpp" "ino" ];
          roots = [
            "sketch.yaml"
            "arduino-cli.yaml"
            ".git"
          ];
        }
      ];
      language-server = {
        nixd = {
          command = "nixd";
        };
        rust-analyzer = {
          command = "direnv";
          args = [ "exec" "." "rust-analyzer" ];
        };
        arduino-language-server = {
          command = "direnv";
          args = [
            "exec"
            "."
            "arduino-language-server"
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
      exec = "env ghostty --window-width=135 --window-height=30 -e hx %F";
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
