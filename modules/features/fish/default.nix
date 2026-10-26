{inputs, ...}: {
  perSystem = {pkgs, lib, ...}: {
    packages.fish = inputs.wrappers.wrappers.fish.wrap {
      inherit pkgs;
      shellAliases = {
        cat = lib.getExe pkgs.bat;
      };
    };
  };
}