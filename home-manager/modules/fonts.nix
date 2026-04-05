{ pkgs, ... }: {
    fonts.fontconfig = {
        enable = true;
        
        hinting = "full";        
        antialiasing = true;
    };

    home.packages = with pkgs; [
        noto-fonts
        noto-fonts-color-emoji
        liberation_ttf
        nerd-fonts.jetbrains-mono
        cascadia-code
    ];    
}