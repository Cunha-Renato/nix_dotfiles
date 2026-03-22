{ homeStateVersion, user, pkgs, ... }: {
	imports = [
		./modules
		./home-packages.nix
	];

	home = {
		username = user;
		homeDirectory = "/home/${user}";
		stateVersion = homeStateVersion;
	};
}
