{ pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;

    programs.firefox.enable = true;
    programs.appimage = {
        enable = true;
        binfmt = true;
    };

    environment.systemPackages = with pkgs; [
  	    home-manager
  	    neovim
	    git
	    kitty
        uwsm
        evtest
        exfatprogs
    ];
}