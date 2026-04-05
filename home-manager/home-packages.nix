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
        cargo
        clippy
        rustc
        rustfmt

        # Utils
        zip
        unzip
        qalculate-gtk
        fastfetch
    ];

    # Rust.
    home.sessionVariables.RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
}