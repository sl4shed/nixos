{inputs, moduleWithSystem, ...}: {
  flake.nixosModules.zsh = moduleWithSystem ({pkgs, self', ...}: {config, ...}:
    let
      lib = pkgs.lib;
    in {
      imports = [];
      options = {};
      config = {
        nixpkgs.overlays = [
          (final: prev: {
            fish = self'.packages.fish;
          })
        ];
        
        programs.fish = {
          enable = true;
        };
      };
    });

  perSystem = {pkgs, unstablePkgs, lib, ...}: {
    packages.fish = inputs.wrappers.wrappers.fish.wrap {
      inherit pkgs;
      shellAliases = {
        v = lib.getExe unstablePkgs.vim;
        cat = lib.getExe pkgs.bat;
      };
    };
  };
}