{ pkgs, ... }: {
    home.pointerCursor = {
        gtk.enable = true;
        x11.enable = true;

        package = pkgs.capitaine-cursors;
        name = "capitaine-cursors";
        size = 16;
    };
    
    gtk = {
        enable = true;
        cursorTheme = {
            package = pkgs.capitaine-cursors;
            name = "capitaine-cursors";
        };
    };
}
