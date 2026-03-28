{ pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [
        # AppImage
        gearlever

        # Editors
        neovim
        vscode

        # Programming
        gcc
        (python312.withPackages (ps: with ps; [
            pip
            ipykernel
            jupyterlab
        ]))

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