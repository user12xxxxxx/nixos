{
  description = "Rust development environments";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    rust-overlay.url = "github:oxalica/rust-overlay";
    rust-overlay.inputs.nixpkgs.follows = "nixpkgs";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, rust-overlay, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ (import rust-overlay) ];
        };

        commonPackages = with pkgs; [
          cargo
          rustc
          rustfmt
          clippy
          rust-analyzer
        ];

        embeddedRust = pkgs.rust-bin.stable.latest.default.override {
          extensions = [
            "rust-src"
            "llvm-tools"
            "rust-analyzer"
          ];

          targets = [
            "thumbv7em-none-eabihf"
          ];
        };
      in {
        devShells = {

          # Default Rust shell
          default = pkgs.mkShell {
            packages = commonPackages;

            shellHook = ''
              echo "🦀 Rust"
            '';
          };

          # GTK4
          gtk4 = pkgs.mkShell {
            packages = commonPackages ++ (with pkgs; [
              cairo
              gdk-pixbuf
              glib
              gtk4
              gsettings-desktop-schemas
              libadwaita
              pango
              pkg-config
            ]);

            shellHook = ''
              export XDG_DATA_DIRS=${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}:${pkgs.gtk4}/share/gsettings-schemas/${pkgs.gtk4.name}:$XDG_DATA_DIRS

              echo "🦀 Rust + 📦 GTK4 + 👣 Adwaita"
            '';
          };

          # Embedded / micro:bit
          microbit = pkgs.mkShell {
            packages = with pkgs; [
              embeddedRust

              cargo-binutils
              probe-rs-tools

              gdb
              minicom

              pkg-config
            ];

            shellHook = ''
              echo "micro:bit development environment"
            '';
          };
        };
      });
}
