{ stateVersion, hostName, ... }: {
    imports =
    [ 
        ../../modules
        /etc/nixos/hardware-configuration.nix
    ];
    
    networking.hostName = hostName;
    system.stateVersion = stateVersion;
    
    services.xserver.videoDrivers = [ "amdgpu" ];
    hardware.graphics.enable = true;
    hardware.cpu.intel.updateMicrocode = true;
}
