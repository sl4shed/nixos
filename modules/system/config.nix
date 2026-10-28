{inputs, ...}: {
  flake.nixosModules.config = {pkgs, ...}: {
    pkgs.config.allowUnfree = true;
  }
}