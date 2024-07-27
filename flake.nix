{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    spicetify-nix = {
      url = "github:the-argus/spicetify-nix";
    };

    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    };

    xdghypr = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs
    ,flake-parts
    ,...
  } @ inputs: let
    stateVersion = "24.05";
    system = "x86_64-linux";
    helpers = import ./lib/helpers.nix {inherit inputs stateVersion;}; 
    in

    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [ system ];
      flake = {
        homeConfigurations = {
          "kupr" = helpers.mkHome {user = "kupr";};
        };
      };
    };
}
