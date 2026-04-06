{
    programs.hyprland = {
  	    enable = true;
        withUWSM = true;
	    xwayland.enable = true;
    };
    security.pam.services.hyprlock = {};
    security.polkit.enable = true;
    services.getty.autologinUser = "l3gion"; 
    services.gvfs.enable = true;

    # UWSM START
    environment.loginShellInit = ''
        if uwsm check may-start > /dev/null; then
            exec systemd-cat -t uwsm_start uwsm start hyprland-uwsm.desktop
        fi
    '';
}
