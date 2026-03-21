{
	description = "MY CONFIG";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, home-manager, ... }@inputs: let 
		system = "x86_64-linux";
		homeStateVersion = "25.11";
		user = "l3gion";
	in {

		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			inherit system;
			modules = [ 
                ./configuration.nix
                home-manager.nixosModules.home-manager
            ];
		};

		homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.${system};
            extraSpecialArgs = { 
                inherit inputs homeStateVersion user; 
            };

			modules = [ ./home-manager/home.nix ];
		};
	};
}
