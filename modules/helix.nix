{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    extraPackages = [ pkgs.nixd pkgs.nil ];
    settings = {
      theme = "base16_transparent";
      editor.cursor-shape = {
        normal = "underline";
        insert = "bar";
        select = "underline";
      };
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
      ];
      language-server = {
        nixd = {
          command = "nixd";
        };
        rust-analyzer = {
          command = "rust-analyzer";
        };
      };
    };
  };
}