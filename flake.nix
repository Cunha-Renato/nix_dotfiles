{
    description = "My Config";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        hyprland.url = "github:hyprwm/Hyprland";
    };

    outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs: let
        system = "x86_64-linux"; 
        homeStateVersion = "25.11";
        user = "l3gion";
        hosts = [
            { hostName = "l3gion-pc"; stateVersion = "25.11"; }
            { hostName = "l3gion-laptop"; stateVersion = "25.11"; }
        ];

        makeSystem = { hostName, stateVersion}: nixpkgs.lib.nixosSystem {
            inherit system;

            specialArgs = {
                inherit inputs stateVersion hostName user;
            };
        
            modules = [
                ./hosts/${hostName}/configuration.nix

                hyprland.nixosModules.default
            
                home-manager.nixosModules.home-manager
            ];
        };
    in {
        nixosConfigurations = nixpkgs.lib.foldl' (configs: host: configs // {
            "${host.hostName}" = makeSystem {
                inherit (host) hostName stateVersion;
            };
        }) {} hosts;

        homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.${system};

            extraSpecialArgs = {
                inherit inputs homeStateVersion user;
            };

            modules = [ ./home-manager/home.nix ];
        };
        
        devShells.${system}.hypr_shell = let
            pkgs = import nixpkgs { inherit system; };
        in pkgs.mkShell {
           name = "hypr_shell";

           packages = with pkgs; [
               zsh

               wayland
               wayland-protocols
               libxkbcommon
               vulkan-loader
               vulkan-tools
               mesa
               pkg-config
               glib
               glib-networking  # WebKit HTTPS support
               pango
               cairo
               gdk-pixbuf
               gtk3
               webkitgtk_4_1
               cacert             # SSL certificates
           ];

           LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
               pkgs.wayland
               pkgs.libxkbcommon
               pkgs.vulkan-loader
               pkgs.mesa
           ];

           shellHook = ''
               echo "Entered hypr_shell"
               export SSL_CERT_FILE="${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
               export NIX_SSL_CERT_FILE="${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
               export GIO_MODULE_DIR="${pkgs.glib-networking}/lib/gio/modules"
               exec zsh
           '';
        };
    };
}