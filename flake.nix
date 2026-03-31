{
  description = "flake for hp14";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    unstable.url = "github:nixOS/nixpkgs/nixos-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: 
    let
      hostname = "nixos-nvm";
      username = "nautesh";    
      system = "x86_64-linux";
      unstablePkgs = import inputs.unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      templates = {
        clang.path = ./devShells/c;
        python.path = ./devShells/python;
        rust.path = ./devShells/rust;
        arduino.path = ./devShells/arduino;
      };
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs unstablePkgs; };
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs unstablePkgs; }; 
              users.${username} = import ./home.nix;
            };
          }
        ];
      };
    };
}
