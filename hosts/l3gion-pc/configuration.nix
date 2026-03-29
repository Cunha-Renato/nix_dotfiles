{ stateVersion, hostName, ... }: {
    imports =
    [ 
        ../../modules
        /etc/nixos/hardware-configuration.nix
    ];
    
    services.xserver.videoDrivers = [ "amdgpu" ];
    hardware.graphics.enable = true;
    hardware.cpu.intel.updateMicrocode = true;

    networking.hostName = hostName;
    system.stateVersion = stateVersion;
}
