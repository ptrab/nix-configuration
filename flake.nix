{
  description = "Home Manager configuration of Phillip";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    qchem.url = "github:nix-qchem/nixos-qchem";
  };

  outputs = { nixpkgs, home-manager, qchem, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
            qchem.overlays.default
        ];
        config = {
            allowUnfree = true;
        };
      };
    in {
                    #    VVVVVVV muss identisch zum $USER sein
      homeConfigurations.ca82pez = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
            ./modules/ca82pez.nix # welches home gemanaged werden soll also $USER.nix quasi
            ./modules/all.nix # konfigurationen, die fuer jeden rechner gelten, unabhaengig von dessen verwendungszweck
            ./modules/chemistry.nix # alle "chemie"-relevanten programme
            ];
        

      };
    };
}
