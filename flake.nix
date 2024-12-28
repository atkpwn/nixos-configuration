{
  description = "My NixOS flake";

  # references:
  # https://github.com/Misterio77/nix-starter-configs
  # https://nixos.wiki/wiki/Flakes

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
  };

  outputs = { self, nixpkgs, nixos-hardware }:
    let
      system = "x86_64-linux";
    in {

      nixosConfigurations.bigfoot = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system; };

        modules = [
          ./nixos/configuration.nix
          nixos-hardware.nixosModules.lenovo-thinkpad-x270
        ];
      };
    };
}
