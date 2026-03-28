{
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    security.rtkit.enable = true;

    services.printing.enable = true;
    services.pulseaudio.enable = false;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };

    imports = [
        ./bluetooth.nix
        ./boot.nix
        ./gc.nix
        ./hyprland.nix
        ./l3gion.nix
        ./locale.nix
        ./networking.nix
        ./packages.nix
    ];
}