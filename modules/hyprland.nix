{
    programs.hyprland = {
  	    enable = true;
        withUWSM = true;
	    # xwayland.enable = true;
    };
    security.pam.services.hyprlock = {};
    security.polkit.enable = true;
    hardware.graphics.enable = true;
    services.getty.autologinUser = "l3gion"; 

    # UWSM START
    environment.loginShellInit = ''
        if uwsm check may-start > /dev/null; then
            exec systemd-cat -t uwsm_start uwsm start hyprland-uwsm.desktop
        fi
    '';
}
