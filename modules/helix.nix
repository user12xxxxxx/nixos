{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    extraPackages = with pkgs; [
      nixd
      nil
      wl-clipboard
    ];
    settings = {
      theme = "base16_transparent";
      # editor.cursor-shape = {
        # normal = "bar";
        # insert = "bar";
        # select = "bar";
      # };
    };
    languages = { 
      language = [
        {
          name = "nix";
          auto-format = true;
          language-servers = [ "nixd" "nil" ];
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
          language-servers = [ "clangd" ];
        }
        {
          name = "arduino";
          scope = "source.arduino";
          injection-regex = "arduino";
          file-types = [ "ino" ];
          roots = [ "sketch.yaml" "arduino-cli.yaml" ".git" ];
          auto-format = true;
          language-servers = [ "arduino-language-server" ];
        }
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
          # args = [
          #   "-cli" "arduino-cli"
          #   "-clangd" "clangd" 
          # ];
        };
      };
    };
  };
  
  xdg.desktopEntries = {
    "Helix" = {
      name = "Helix";
      genericName = "Text Editor";
      exec = "env ghostty --maximize -e hx %F"; 
      terminal = false; 
      icon = "helix"; 
      categories = [ "Utility" "TextEditor" ];
      mimeType = [ "text/plain" ];
    };
  };
}
