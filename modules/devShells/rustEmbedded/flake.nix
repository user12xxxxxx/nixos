{
  description = "micro:bit development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, rust-overlay, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ (import rust-overlay) ];
        };

        rust = pkgs.rust-bin.stable.latest.default.override {
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
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            rust

            cargo-binutils
            probe-rs-tools

            gdb
            minicom

            pkg-config
          ];

          shellHook = ''
            fish
            echo "micro:bit development environment"
          '';
        };
      });
}
