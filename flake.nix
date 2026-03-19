{
	description = "MY CONFIG";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
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
			modules = [ ./configuration.nix ];
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
