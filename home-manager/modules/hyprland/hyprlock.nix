{
    programs.hyprlock = {
        enable = true;
        settings = {
            general = {
                grace = 10;
                hide_cursor = true;
                no_fade_in = false;
            };
            
            background = [{
                monitor = "";
                path = "$HOME/nix_dotfiles/wallpapers/lock_scr.png";
                blur_passes = 1;
                blur_size = 5;
            }];

            label = {
                text = "$TIME";
                font_size = 96;
                font_family = "JetBrainsMono Nerd Font";
                color = "rgba(ebdbb8ff)";

                position = "0, 300";
                halign = "center";
                valign = "center";

                shadow_passes = 0;
            };

            input-field = [{
                size = "200, 50";
                position = "0, -80";
                monitor = "";
                dots_center = true;
                font_color = "rgba(f8bd96ff)";
                inner_color = "rgba(161632ff)";
                outline_thickness = 0;
                shadow_passes = 0;
                placeholder_text = "Enter password";
            }];
        };
    };
}