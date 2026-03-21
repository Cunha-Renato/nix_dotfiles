{ homeStateVersion, user, ... }: {
    imports = [
        ./modules/default.nix
        ./home-packages.nix
    ];

	home = {
		username = user;
		homeDirectory = "/home/${user}";
		stateVersion = homeStateVersion;
	};

  programs.bash = {
    enable = true;
    
    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec uwsm start -S hyprland-uwsm.desktop
      fi
    '';
  };
}
