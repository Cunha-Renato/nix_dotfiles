{
    wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = true;
    
        settings = {
            env = [
                "NIXOS_OZONE_WL,1"
                "QT_QPA_PLATFORM,wayland"
            ];
        };
    };
}