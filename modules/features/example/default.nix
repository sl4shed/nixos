{...}: {
	perSystem = {pkgs, ...}: {
		packages = {
			example = pkgs.hello;
		};
	};
}