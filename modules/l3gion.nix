{ pkgs, ... }: {
    users.users.l3gion = {
        isNormalUser = true;
        description = "l3gion";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [];
    };
}