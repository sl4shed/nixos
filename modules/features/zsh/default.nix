{inputs, moduleWithSystem, ...}: {
  flake.nixosModules.zsh = moduleWithSystem ({pkgs, self', ...}:
    # This is a "double expression", being written like {...}: {...}: {};
    # having an extra {...}. This is because the first attribute set only contains
    # flake parts attributes (self', flake.nixosModules, etc), and not nixos attributes.
    # The usual nixos attributes, like config, are passed into a potential second attribute
    # set, allowing you to access them there. This set is not implicit, and must be defined.
    # This means that the code can be read as:
    # {flake-parts attrs}: {nix attrs}: {actual expression};
    {config, ...}:
    # A let in statement allows setting of variables, in this case pointing any reference
    # of "lib" to "pkgs.lib". These can be stacked, and can be thought of as a way of
    # scoping variables.
    let
      lib = pkgs.lib;
    in {
      # When the config or options objects are defined, nothing else can be in the expression.
      # Options contains a list of defined options, and config becomes the wrapper for everything
      # else in the expression. Imports works as expected.
      imports = [];
      options = {
        enableHighlighting = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable syntax highlighting";
        };
      };
      config = {
        # Nixpkgs overlay, replacing the universal "pkgs.zsh" with "self'.packages.zsh".
        # As stated, self' allows you to shorten the package definition from
        # self.${pkgs.stdenv.hostPlatform.system}.packages.zsh;
        # into just self'.packages.zsh, meaning package platform errors are almost impossible.
        nixpkgs.overlays = [
          (final: prev: {
            zsh = self'.packages.zsh;
          })
        ];
        
        programs.zsh = {
          enable = true;
          enableSyntaxHighlighting = config.enableHighlighting;
        };
      };
    });

  perSystem = {pkgs, unstablePkgs, lib, ...}: {
    packages.zsh = inputs.wrappers.wrappers.zsh.wrap {
      inherit pkgs;
      zshAliases = {
        v = lib.getExe unstablePkgs.vim;
        cat = lib.getExe pkgs.bat;
      };
    };
  };
}