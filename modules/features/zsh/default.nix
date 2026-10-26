{inputs, ...}: {
  perSystem = {pkgs, lib, ...}: {
    packages.zsh = inputs.wrappers.wrappers.zsh.wrap {
      inherit pkgs;
      zshAliases = {
        some = lib.getExe pkgs.nvim;
        ff = lib.getExe pkgs.fastfetch;
      };
    };
  };
}