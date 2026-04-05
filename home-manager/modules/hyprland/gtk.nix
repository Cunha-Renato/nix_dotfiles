{ pkgs, ... }: {
    home.pointerCursor = {
        gtk.enable = true;
        x11.enable = true;

        package = pkgs.posy-cursors;
        name = "Posy_Cursor_Mono_Black";
        size = 16;
    };
    
    gtk = {
        enable = true;

        iconTheme = {
            name = "oomox-gruvbox-dark";
            package = pkgs.gruvbox-dark-icons-gtk;
        };

        cursorTheme = {
            package = pkgs.posy-cursors;
            name = "Posy_Cursor_Mono_Black";
        };

        colorScheme = "dark";
    };
}
