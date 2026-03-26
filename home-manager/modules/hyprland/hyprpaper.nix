{ pkgs, config, ... }: {
    home.packages = with pkgs; [
        hyprpaper
    ];

    services.hyprpaper = {
        enable = true;

        settings = {
            splash = false;

            wallpaper = [{
                monitor = "eDP-1";
                path = "${config.home.homeDirectory}/wallpapers";
                timeout = 300;
                fit_mode = "cover";
            }];
        };
    };
}