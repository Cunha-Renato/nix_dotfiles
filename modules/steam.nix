{
    programs.steam.enable = true;
    hardware.steam-hardware.enable = true;
    boot.kernelModules = [ 
        "hid_sony"
        "joydev"
    ]; # ps4 Controller
}