{ pkgs, stateVersion, hostName }: {
    imports =
    [ 
        ../../modules
        /etc/nixos/hardware-configuration.nix
    ];
    
    networking.hostName = hostName;
    system.stateVersion = stateVersion;

    hardware.graphics.enable = true;
}
