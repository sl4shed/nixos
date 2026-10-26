{...}: {
	flake.nixosModules.bootloader = {pkgs, ...}: {
		boot = {
			loader = {
				# Set bootloader timeout
				timeout = 2;
				efi = {
					# Enable efi var mutation
					canTouchEfiVariables = true;
				};

				limine = {
					enable = true;
					efiSupport = true;
				};
			};

			# kernel latest version
			kernelPackages = pkgs.linuxPackages_latest;
		};
	};
}