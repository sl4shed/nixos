{...}: {
	flake.nixosModules.frameworkConfiguration = {pkgs, ...}: {
		environment.systemPackages = with pkgs; [
			fastfetch
		];
	};
}