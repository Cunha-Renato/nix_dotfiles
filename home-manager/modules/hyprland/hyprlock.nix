{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        grace = 10;
        hide_cursor = true;
        no_fade_in = false;
      };

      label = {
        text = "$TIME";
        font_size = 96;
        font_family = "Cascadia Code";
        color = "rgba(235, 219, 178, 1.0)";
        position = "0, 600";
        halign = "center";
        walign = "center";

        shadow_passes = 1;
      };

      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          font_color = "rgb(235, 219, 178)";
          inner_color = "rgb(40, 40, 40)";
          outer_color = "rgb(60, 56, 54)";
          outline_thickness = 5;
          shadow_passes = 1;
        }
      ];
    };
  };
}