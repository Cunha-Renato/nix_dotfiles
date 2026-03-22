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
            "$menu" = "wofi";

			exec-once = [
				"waybar"
				"nm-applet"
			];

			bind = [
				"$mainMod,      RETURN, exec, $terminal"
                "$mainMod,      W, killactive,"
                "$mainMod,      L, togglefloating,"
                "$mainMod,      SPACE, exec, $menu --show drun"
                "$mainMod,      P, pin,"
                "$mainMod,      J, togglesplit,"
                "$mainMod,      N, exec, swaync-client -t"

                # Moving focus
                "$mainMod, left, movefocus, l"
                "$mainMod, right, movefocus, r"
                "$mainMod, up, movefocus, u"
                "$mainMod, down, movefocus, d"

                # Moving windows
                "$mainMod SHIFT, left,  swapwindow, l"
                "$mainMod SHIFT, right, swapwindow, r"
                "$mainMod SHIFT, up,    swapwindow, u"
                "$mainMod SHIFT, down,  swapwindow, d"

                # Resizeing windows                   X  Y
                "$mainMod CTRL, left,  resizeactive, -60 0"
                "$mainMod CTRL, right, resizeactive,  60 0"
                "$mainMod CTRL, up,    resizeactive,  0 -60"
                "$mainMod CTRL, down,  resizeactive,  0  60"

                # Switching workspaces
                "$mainMod, 1, workspace, 1"
                "$mainMod, 2, workspace, 2"
                "$mainMod, 3, workspace, 3"
                "$mainMod, 4, workspace, 4"

                # Moving windows to workspaces
                "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
                "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
                "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
                "$mainMod SHIFT, 4, movetoworkspacesilent, 4"

                # Scratchpad
                "$mainMod,       S, togglespecialworkspace,  magic"
                "$mainMod SHIFT, S, movetoworkspace, special:magic"
			];
            
            # Laptop multimedia keys for volume and LCD brightness
            bindel = [
                ",XF86AudioRaiseVolume,  exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
                ",XF86AudioLowerVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
                ",XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
                ",XF86AudioMicMute,      exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
                "$mainMod, bracketright, exec, brightnessctl s 10%+"
                "$mainMod, bracketleft,  exec, brightnessctl s 10%-"
            ];

            # Audio playback
            bindl = [
                ", XF86AudioNext,  exec, playerctl next"
                ", XF86AudioPause, exec, playerctl play-pause"
                ", XF86AudioPlay,  exec, playerctl play-pause"
                ", XF86AudioPrev,  exec, playerctl previous"
            ];
		};
	};

	xdg.portal.enable = true;
	xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
}
