{
  description = "My Home Manager configuration";

  inputs = {
    nixpkgs-stable.url = "nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = { nixpkgs-stable, nixpkgs-unstable, home-manager, ... }:
    let
      #lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs-unstable { 
        inherit system; 
        overlays = [
          (final: prev: {
            # Installing specific package from different channel
            # yazi = (import nixpkgs-stable { system = system; }).yazi;
          })
        ];
      };
    in {
      homeConfigurations = {
        michal = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
        };
      };
    };
}
