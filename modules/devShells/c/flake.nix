{
  description = "C Development Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          # Compiler & build system
          gcc
          cmake
          gnumake
          ninja

          # Debugging & tools
          gdb
          valgrind

          # LSP for VSCode/editors
          clang-tools
        ];

        shellHook = ''
          echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
          echo "🔧 C Development Environment"
          echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
          echo "GCC:   $(gcc --version | head -n1)"
          echo "CMake: $(cmake --version | head -n1)"
          echo ""
          echo "Quick commands:"
          echo "  build  → cmake -B build -G Ninja && ninja -C build"
          echo "  clean  → rm -rf build"
          echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

          mkdir -p build
        '';
      };
    };
}
