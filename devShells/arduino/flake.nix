{
  description = "Arduino devshell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system} = {
        default = pkgs.mkShell {
          packages = with pkgs; [
            arduino-cli
            arduino-language-server
            clang-tools 
            arduino-ide
            mosquitto
            python3
            python3Packages.scipy
            python3Packages.matplotlib
            python3Packages.pandas
            python3Packages.pyserial 
            zlib                     
          ];
          shellHook = ''
            echo "🔌 Arduino Dev Environment Loaded!"
    
            # Initialize the arduino-cli config if it doesn't exist yet
            if [ ! -f ~/.arduino15/arduino-cli.yaml ]; then
              echo "Initializing arduino-cli..."
              arduino-cli config init
              arduino-cli core update-index
            fi
    
            echo "Run 'arduino-cli board list' to view connected boards."
          '';
        };
      };
    };
}
