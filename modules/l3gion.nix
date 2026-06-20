{ pkgs, ... }: {
    users.users.l3gion = {
        isNormalUser = true;
        description = "l3gion";
        extraGroups = [ 
            "storage" 
            "disk" 
            "networkmanager" 
            "wheel"
            "video"
            "render"
        ];
        packages = with pkgs; [];
    };
}