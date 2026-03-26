{ pkgs, config, ... }: {
    programs.rofi = {
        enable = true;

        font = "JetBrainsMono Nerd Font 12";
        terminal = "ghostty";

        extraConfig = {
            modi = "drun,run";
            show-icons = true;
            drun-display-format = "{icon} {name}";
            display-drun = "Apps";
            display-run = "Run";
            location = 0;
            disable-history = false;
            hide-scrollbar = true;
            sidebar-mode = false;
        };

        theme = let
            inherit (config.lib.formats.rasi) mkLiteral;
        in {
            "*" = {
                bg0     = mkLiteral "#282828";
                bg1     = mkLiteral "#3c3836";
                bg3     = mkLiteral "#504945";
                fg0     = mkLiteral "#ebdbb2";
                fg4     = mkLiteral "#928374";
                yellow  = mkLiteral "#d79921";
                background-color = mkLiteral "transparent";
                text-color = mkLiteral "@fg0";
            };

            "window" = {
                background-color = mkLiteral "@bg0";
                border = mkLiteral "2px solid";
                border-color = mkLiteral "#ebdbb2";
                border-radius = mkLiteral "12px";
                width = mkLiteral "500px";
                padding = mkLiteral "2px";
            };

            "mainbox" = {
                background-color = mkLiteral "transparent";
                children = mkLiteral "[inputbar, listview]";
                spacing = mkLiteral "8px";
            };

            "inputbar" = {
                background-color = mkLiteral "@bg1";
                border-radius = mkLiteral "8px";
                padding = mkLiteral "8px 12px";
                children = mkLiteral "[prompt, entry]";
                spacing = mkLiteral "8px";
            };

            "prompt" = {
                text-color = mkLiteral "@yellow";
            };

            "entry" = {
                background-color = mkLiteral "transparent";
                text-color = mkLiteral "@fg0";
                placeholder = "Search...";
                placeholder-color = mkLiteral "@fg4";
            };

            "listview" = {
                background-color = mkLiteral "transparent";
                lines = 8;
                scrollbar = false;
                spacing = mkLiteral "4px";
            };

            "element" = {
                background-color = mkLiteral "transparent";
                border-radius = mkLiteral "8px";
                padding = mkLiteral "8px";
                spacing = mkLiteral "8px";
                orientation = mkLiteral "horizontal";
            };

            "element selected" = {
                background-color = mkLiteral "@yellow";
                text-color = mkLiteral "@bg0";
            };

            "element-icon" = {
                size = mkLiteral "24px";
                background-color = mkLiteral "transparent";
            };

            "element-text" = {
                background-color = mkLiteral "transparent";
                text-color = mkLiteral "inherit";
                vertical-align = mkLiteral "0.5";
            };
        };
    };
}