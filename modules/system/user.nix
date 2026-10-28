{ pkgs, ... }: {
  flake.nixosModules.user = { ... }: {
    programs.fish.enable = true;
    users.users.andrew = {
      isNormalUser = true;
      initialPassword = "password";
      extraGroups = [
        "root"
        "wheel"
      ];

      shell = pkgs.fish;
    };
  };
}
