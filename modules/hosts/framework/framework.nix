{self, inputs, ...}: {
	flake.nixosConfigurations.framework = inputs.nixpkgs.lib.nixosSystem {
		modules = with self.nixosModules; [
			frameworkConfiguration
			system
		];
	};
}