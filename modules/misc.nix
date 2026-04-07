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
        jack.enable = true;

        extraConfig.pipewire."92-low-latency" = {
            context.properties = {
                default.clock.rate = 48000;
                default.clock.quantum = 1024;
                default.clock.min-quantum = 1024;
                default.clock.max-quantum = 1024;
            };
        };
    };
}