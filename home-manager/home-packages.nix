{ pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;
    
    home.packages = with pkgs; [
        neovim
        vscode

        # Programming
        nodejs
        python311
    ];
}
