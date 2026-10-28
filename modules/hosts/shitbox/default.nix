{ self, inputs, ... }: {
  flake.nixosConfigurations.shitbox = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      hostConfiguration
      system

      inputs.home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.andrew = import ./home.nix;
      }
    ];
  };
}
