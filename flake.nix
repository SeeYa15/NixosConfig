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
	};

	outputs = { self, nixpkgs, home-manager, hyprland, nixvim, spicetify-nix, ... }@inputs: {

# NixosConfiguration is what set-up the profile of what flake config to use.
# This flake would be 'sudo nixos-rebuild switch --flake /PathToThisFile/#johnny-home'

   # hosts = {
   #   "johnny-laptop";
   #   "johnny-pc";
   # };
		nixosConfigurations.johnny-home = nixpkgs.lib.nixosSystem {

			system = "x86_64-linux";
			specialArgs = {inherit inputs;};
			modules = [

			./configuration.nix
				home-manager.nixosModules.home-manager
				{
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.extraSpecialArgs = {inherit inputs;};
					home-manager.users.johnnys = import ./home.nix;
				}
			];
		};
	};
}
