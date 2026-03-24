{ pkgs, ... }: {
	nixpkgs.config.allowUnfree = true;

	home.packages = with pkgs; [
        # AppImage
		gearlever

		neovim
		vscode

		# Programming
		gcc
		python311
		lean4
		# -> Node
		nodejs
		nodePackages.pnpm
		biome
		# -> Rust
		rustc
		cargo
		rustfmt
		clippy

		# Utils
		zip
		unzip
	];
}
