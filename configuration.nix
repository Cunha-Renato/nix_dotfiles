{ config, pkgs, ... }:

{
    imports =
    [ 
        ./modules
        /etc/nixos/hardware-configuration.nix
    ];

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

    system.stateVersion = "25.11"; # Did you read the comment?
}
