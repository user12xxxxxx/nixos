{
  description = "Rust devshell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system} = {

        # BASIC SHELL
        default = pkgs.mkShell {
          packages = with pkgs; [
            cargo
            rustc
            rustfmt
            clippy
            rust-analyzer
          ];
          shellHook = ''
            echo "🦀 Rust"
          '';
        };

        # GTK4
        gtk4 = pkgs.mkShell {
          packages = with pkgs; [
            cargo
            rustc
            rustfmt
            clippy
            rust-analyzer

            pkg-config
            gtk4
            glib
            pango
            cairo
            gdk-pixbuf
            gsettings-desktop-schemas
          ];
          shellHook = ''
            export XDG_DATA_DIRS=${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}:${pkgs.gtk4}/share/gsettings-schemas/${pkgs.gtk4.name}:$XDG_DATA_DIRS

            echo "🦀 Rust + 📦 GTK4"
          '';
        };

        # GTK4 + ADWAITA
        adwaitaGtk4 = pkgs.mkShell {
          packages = with pkgs; [
            cargo
            rustc
            rustfmt
            clippy
            rust-analyzer

            pkg-config
            gtk4
            libadwaita
            glib
            gsettings-desktop-schemas
          ];
          shellHook = ''
            export XDG_DATA_DIRS=${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}:${pkgs.gtk4}/share/gsettings-schemas/${pkgs.gtk4.name}:$XDG_DATA_DIRS

            echo "🦀 Rust + 📦 GTK4 + 👣 Adwaita"
          '';
        };
      };
    };
}
