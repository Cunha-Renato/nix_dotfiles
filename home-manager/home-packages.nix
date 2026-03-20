{ pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;
    
    home.packages = with pkgs; [
        # AppImage
        gearlever

        neovim
        vscode

        # Programming
        gcc
        nodejs
        python311
        lean4
        # -> RUST
        rustc
        cargo
        rustfmt
        clippy
    ];
}
