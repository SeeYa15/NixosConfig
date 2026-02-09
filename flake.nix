{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";

    nixvim = {
      url = "github:nix-community/nixvim";
      #When using packages from nixpkgs it caused error with plugins.
      #inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      #inputs.spicetify-nix.homeManagerModules.default
    };
    nix-vscode-extensions = {
      url= "github:nix-community/nix-vscode-extensions";
    }; 
  };

  outputs = { self, 
  nixpkgs, 
  home-manager, 
  hyprland, 
  nixvim, 
  spicetify-nix, 
  nix-vscode-extensions,
  ... }@inputs: 
    let
      currentSystem = "x86_64-linux"; 
    in {

      # NixosConfiguration is what set-up the profile of what flake config to use.
      # This flake would be 'sudo nixos-rebuild switch --flake /PathToThisFile/#johnny-home'
      nixosConfigurations = {
        johnny-laptop = nixpkgs.lib.nixosSystem {

          system = currentSystem;
          specialArgs = {inherit inputs;};
          modules = [

            ./Laptop/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {inherit inputs;};
              home-manager.users.johnnys = import ./home.nix;
            }
          ];
        };
        bojje-pc = nixpkgs.lib.nixosSystem {
          system = currentSystem;
          specialArgs = {inherit inputs;};
          modules = [

            ./PC/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {inherit inputs;};
              home-manager.users.johnnys = import ./PC/home.nix;
            }
          ];
        };
      };
    };
}

