{ pkgs, ... }: {
    devShells.default = pkgs.mkShell {
        packages = with pkgs; [
            wayland
            libxkbcommon
            vulkan-loader
        ];

        LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
            pkgs.wayland
            pkgs.libxkbcommon
        ];
    };
}