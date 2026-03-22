{ pkgs, ... }: {
	home.packages = with pkgs; [
		kitty
		networkmanagerapplet
		waybar
		wofi
	];

	wayland.windowManager.hyprland = {
		enable = true;

		settings = {
			env = [
				"NIXOS_OZONE_WL,1"
				"XDG_CURRENT_DESKTOP,Hyprland"
				"XDG_SESSION_DESKTOP,Hyprland"
				"XDG_SESSION_TYPE,wayland"
				"QT_QPA_PLATFORM,wayland"
			];

			monitor = ",1920x1080@60,auto,auto";

            general = {
                gaps_in = 0;
                gaps_out = 0;
                
                border_size = 2;
                resize_on_border = true;
            };
            
            decoration = {
                rounding = 4;
                
                active_opacity = 1;
                inactive_opacity = 0.95;
                
                shadow = {
                    enabled = false;
                };
                
                blur = {
                    enabled = false;
                };
            };

            animations = {
                enabled = false;
            };
            
            input = {
                kb_layout = "us,br";
                touchpad = {
                    natural_scroll = true;
                };
            };
            
            gestures = {
                workspace_swipe_invert = false;
                workspace_swipe_forever = true;
            };
            
            misc = {
                force_default_wallpaper = 0;
                disable_hyprland_logo = true;
            };

			"$mainMod" = "SUPER";
			"$terminal" = "ghostty";

			exec-once = [
				"waybar"
				"nm-applet"
			];


			bind = [
				"$mainMod, 	RETURN, 	exec,  	$terminal"
				"$mainMod, 	Q, 		killactive"
			];
		};
	};

	xdg.portal.enable = true;
	xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
}
