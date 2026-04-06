{
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    security.rtkit.enable = true;

    # PENDRIVE
    services.udisks2.enable = true;

    # AUDIO
    services.printing.enable = true;
    services.pulseaudio.enable = false;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };
}