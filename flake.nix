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
      
    in {
      templates = {
        cpp = {
          path = ./devShells/cpp;
          description = "C dev environment";
        };
        python = {
          path = ./devShells/python;
          description = "Python dev environment";
        };
        rust1 = {
          path = ./devShells/rust1;
          description = "Rust dev environment";
        };
      };
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        specialArgs = {
        	inherit inputs;
        };
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; }; # Passes inputs to home.nix
            home-manager.users.${username} = import ./home.nix;
          }
        ];
      };
    };
}