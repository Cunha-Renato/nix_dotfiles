{
    programs.steam.enable = true;
    hardware.steam-hardware.enable = true;
    boot.kernelModules = [ "hid_sony" ]; # ps4 Controller
}