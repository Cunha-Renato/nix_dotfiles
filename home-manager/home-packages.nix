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
            jupyter
            notebook
            matplotlib
            numpy
        ]))

        elan

        # -> Node
        nodejs
        pnpm
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
        btop
        gnome-disk-utility
        (pkgs.wrapOBS {
            plugins = with pkgs.obs-studio-plugins; [
                obs-vaapi
            ];
        })

        # Gaming
        discord
    ];

    # Rust.
    home.sessionVariables.RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
}