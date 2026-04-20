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

        extraConfig.pipewire."0-audio-fix" = {
            "context.properties" = {
                "default.clock.rate" = 48000;
                "default.clock.quantum" = 4096;
                "default.clock.min-quantum" = 512;
                "default.clock.max-quantum" = 8192;
            };
        };
    };
}