{ pkgs, ... }: {
	home.packages = with pkgs; [
        blueman
        brightnessctl
		kitty
		networkmanagerapplet
		wofi

        # Screenshot
        grim
        slurp
        swappy
        swayimg
        
        # File Managers
        nautilus
        yazi
        file-roller
	];

	wayland.windowManager.hyprland = {
		enable = true;
        systemd.enable = true;

		settings = {
			env = [
				"NIXOS_OZONE_WL,1"
				"XDG_CURRENT_DESKTOP,Hyprland"
				"XDG_SESSION_DESKTOP,Hyprland"
				"XDG_SESSION_TYPE,wayland"
				"QT_QPA_PLATFORM,wayland"
                #"XCURSOR_THEME,Capitaine Cursors"
                #"XCURSOR_SIZE,16"
			];

			monitor = ",1920x1080@60,auto,1.25";

            general = {
                gaps_in = 2;
                gaps_out = 2;
                
                border_size = 2;
                resize_on_border = true;

                "col.active_border" = "rgb(ebdbb2) rgb(d65d0e) 60deg";
                "col.inactive_border" = "rgb(161320)";
            
                layout = "master";
                allow_tearing = false;
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
                enabled = true;

                bezier = "myBezier,0, 0, 0.58, 1";

                animation = [
                    "windows, 1, 2, myBezier"
                    "windowsOut, 1, 2, myBezier, popin 80%"
                    "border, 1, 2, myBezier"
                    "borderangle, 1, 2, myBezier"
                    "fade, 1, 2, myBezier"
                    "workspaces, 1, 2, myBezier"
                ];
            };
            
            device = {
                name = "logitech-g403-hero-gaming-mouse";
                sensitivity = -1.0;
            };
            
            input = {
                kb_layout = "us,br";
                kb_options = "caps:escape";
                touchpad = {
                    natural_scroll = true;
                    scroll_factor = 0.2;
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
            "$menu" = "rofi";
            "$fileExplorer" = "nautilus";

			exec-once = [
                "hyprlock"
				"waybar"
                "hyprpaper"
				"nm-applet"
			];

			bind = [
				"$mainMod,      RETURN, exec, $terminal"
                "$mainMod,      SPACE, exec, $menu -show drun"
                ", PRINT, exec, grim -g \"$(slurp)\" - | swappy -f -"
                "$mainMod,      E, exec, $fileExplorer"
                "$mainMod,      N, exec, swaync-client -t"
                "$mainMod,      W, killactive,"
                "$mainMod,      D, fullscreen, 1"
                "$mainMod,      A, fullscreen, 0"
                "$mainMod,      P, pin,"

                # Moving focus
                "$mainMod, H, movefocus, l"
                "$mainMod, L, movefocus, r"
                "$mainMod, K, movefocus, u"
                "$mainMod, J, movefocus, d"

                # Moving windows
                "$mainMod SHIFT, H, swapwindow, l"
                "$mainMod SHIFT, L, swapwindow, r"
                "$mainMod SHIFT, K, swapwindow, u"
                "$mainMod SHIFT, J, swapwindow, d"

                # Resizeing windows                   X  Y
                "$mainMod CTRL, H,  resizeactive, -60 0"
                "$mainMod CTRL, L,  resizeactive,  60 0"
                "$mainMod CTRL, K,  resizeactive,  0 -60"
                "$mainMod CTRL, J,  resizeactive,  0  60"

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
                ", XF86MonBrightnessUp, exec, brightnessctl set +10%"
                ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
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

    xdg = {
        portal = {
            enable = true;
            extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
        };
    
        mimeApps = {
            enable = true;
            
            defaultApplications = {
                # Images
                "image/png" = [ "swayimg.desktop" ];
                "image/jpeg" = [ "swayimg.desktop" ];
                "image/jpg" = [ "swayimg.desktop" ];
                
                # ZIP
                "application/zip" = [ "org.gnome.FileRoller.desktop" ];
                "application/x-zip-compressed" = [ "org.gnome.FileRoller.desktop" ];
            };
        };
    };
}
