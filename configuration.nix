{ config, pkgs, ... }:

{
    imports =
    [ 
        ./hardware-configuration.nix
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    nix.gc = {
        automatic = true;
        dates = "daily";
    };

    networking.hostName = "nixos"; # Define your hostname.
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "America/Sao_Paulo";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "pt_BR.UTF-8";
        LC_IDENTIFICATION = "pt_BR.UTF-8";
        LC_MEASUREMENT = "pt_BR.UTF-8";
        LC_MONETARY = "pt_BR.UTF-8";
        LC_NAME = "pt_BR.UTF-8";
        LC_NUMERIC = "pt_BR.UTF-8";
        LC_PAPER = "pt_BR.UTF-8";
        LC_TELEPHONE = "pt_BR.UTF-8";
        LC_TIME = "pt_BR.UTF-8";
    };

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Hyprland
    programs.hyprland = {
  	    enable = true;
	    xwayland.enable = true;
    };
    services.displayManager.sddm.enable = true;
    services.displayManager.defaultSession = "hyprland";
    security.polkit.enable = true;
    hardware.graphics.enable = true;

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    services.printing.enable = true;

    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };

    users.users.l3gion = {
        isNormalUser = true;
        description = "l3gion";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [];
    };

    nixpkgs.config.allowUnfree = true;

    programs.firefox.enable = true;
    programs.appimage.enable = true;
    programs.appimage.binfmt = true;
    environment.systemPackages = with pkgs; [
  	    home-manager
  	    neovim
	    git
	    kitty
    ];

    system.stateVersion = "25.11"; # Did you read the comment?
}
