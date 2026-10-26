{...}: {
	flake.nixosModules.user = {...}: {
		users.users.andrew = {
			isNormalUser = true;
			initialPassword = "password";
			extraGroups = [
				"root"
				"wheel"
			];
		};
	};
}