{ stateVersion, hostName, ... }: {
    imports =
    [ 
        ../../modules
        /etc/nixos/hardware-configuration.nix
    ];
    
    networking.hostName = hostName;
    system.stateVersion = stateVersion;

    hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
            libva
        ];
    };
    
    services.power-profiles-daemon.enable = true;
}
