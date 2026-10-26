{inputs, ...}: {
  perSystem = {system, ...}: {
    _module.args = {
      unstablePkgs = import inputs.nixpkgs-unstable {
        inherit system;
      };
    };
  };
}