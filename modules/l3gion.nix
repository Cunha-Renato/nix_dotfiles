{ pkgs, ... }: {
    users.users.l3gion = {
        isNormalUser = true;
        description = "l3gion";
        extraGroups = [ "storage" "disk" "networkmanager" "wheel" ];
        packages = with pkgs; [];
    };
}