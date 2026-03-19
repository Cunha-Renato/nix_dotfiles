{ pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;
    
    home.packages = with pkgs; [
        # AppImage
        gearlever

        neovim
        vscode

        # Programming
        nodejs
        python311
        # -> RUST
        rustc
        cargo
        rustfmt
        clippy
    ];
}
