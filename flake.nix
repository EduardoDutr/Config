{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { self, nixpkgs, catppuccin, home-manager }: 
    let 
      user = "eduardo";
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      lib = nixpkgs.lib;
    in  {
      nixosConfigurations = {

        desktop = lib.nixosSystem {
          inherit pkgs;
          modules = [ 
            ./configuration.nix
            catppuccin.nixosModules.catppuccin

            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;   
              home-manager.extraSpecialArgs = { inherit user; };           
              home-manager.users.${user} = {
                imports = [ 
                  ./home.nix
                  catppuccin.homeManagerModules.catppuccin
                ];
              };
            }

          ];
        };

      };
    };
}
