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
        nodejs
        nodePackages.pnpm
        biome
        # -> RUST
        rustc
        cargo
        rustfmt
        clippy
    ];
}
