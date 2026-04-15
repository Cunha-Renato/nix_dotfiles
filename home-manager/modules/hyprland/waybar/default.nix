{
    programs.waybar = {
        enable = true;
        style = ./style.css;
        settings = {
            mainBar = {
                layer = "top";

                modules-left = ["custom/launcher" "backlight" "pulseaudio"];
                modules-center = ["hyprland/workspaces"];
                modules-right = ["tray" "hyprland/language" "cpu" "memory" "battery" "clock"];

                "custom/launcher" = {
                    format = "❄";
                };

                "hyprland/language" = {
                    format = "{short}";
                    min-length = 5;
                    tooltip = false;
                    on-click = "hyprctl switchxkblayout current next";
                };

                "pulseaudio" = {
                    tooltip = false;
                    scroll-step = 5;
                    format = "{icon}  {volume}%";
                    format-bluetooth = "{icon}  {volume}% ";
                    format-muted = "󰝟  {volume}%";
                    format-icons = {
                        "default" = ["" "" ""];
                    };
                    on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
                };

                "backlight" = {
                    tooltip = false;
                    format = "  {}%";
                    interval = 1;
                };

                "battery" = {
                    states = {
                        full = 100;
                        good = 95;
                        decent = 50;
                        warning = 30;
                        critical = 20;
                    };
                    format = "{icon}  {capacity}%";
                    format-charging = "  {capacity}%";
                    format-time = "{H} h {M} min";
                    format-alt = "{icon} {time}";
                    format-icons = ["" "" "" "" ""];
                };

                "clock" = {
                    tooltip = false;
                    format = "{:%H:%M}";
                    format-alt = "{:%d-%m-%Y}";
                };

                "cpu" = {
                    interval = 15;
                    format = "  {usage}%";
                    max-length = 10;
                };

                "memory" = {
                    interval = 15;
                    format = "  {}%";
                    max-length = 10;
                };
            };
        };
    };
}