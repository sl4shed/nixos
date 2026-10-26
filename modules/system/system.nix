{...}: {
	flake.nixosModules.system = {pkgs, ...}: {
		environment.systemPackages = with pkgs; [
			git
		];

		imports = [
			/etc/nix/hardware-configuration.nix # uhmm
		];
	};
}