{
  description = "Rust devshell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs =
    { nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      base = with pkgs; [
        cargo
        rustc
        rustfmt
        clippy
        rust-analyzer
      ];

      gtk4 = with pkgs; [        
        pkg-config
        gtk4
        glib
        libadwaita
        pango
        cairo
        gdk-pixbuf
        gsettings-desktop-schemas
      ];
    in
    {
      devShells.${system} = {

        # BASIC SHELL
        default = pkgs.mkShell {
          packages = base;
          shellHook = ''
            echo "🦀 Rust"
          '';
        };

        # GTK4 + ADWAITA
        adwaitaGtk4 = pkgs.mkShell {
          packages = base ++ gtk4;
          shellHook = ''
            export XDG_DATA_DIRS=${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}:${pkgs.gtk4}/share/gsettings-schemas/${pkgs.gtk4.name}:$XDG_DATA_DIRS
            echo "🦀 Rust + 📦 GTK4 + 👣 Adwaita"
          '';
        };
      };
    };
}
