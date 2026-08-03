{
  description = "flake for hp14";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    unstable.url = "github:nixOS/nixpkgs/nixos-unstable";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    let
      hostname = "nixos-nvm";
      username = "nautesh";
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      unstable = import inputs.unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      templates = {
        clang.path = ./modules/devShells/c;
        python.path = ./modules/devShells/python;
        rust.path = ./modules/devShells/rust;
        arduino.path = ./modules/devShells/arduino;
      };
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs unstable; };

        modules = [
          ./modules/system/configuration.nix

           home-manager.nixosModules.home-manager {
             home-manager = {
               useGlobalPkgs = true;
               useUserPackages = true;
               extraSpecialArgs = { inherit inputs unstable; };
               users.${username} = import ./modules/user/home.nix;
             };
           }
        ];
      };
    };
}
