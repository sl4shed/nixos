{self, inputs, ...}: {
	flake.nixosConfigurations.shitbox = inputs.nixpkgs.lib.nixosSystem {
		modules = with self.nixosModules; [ 
			hostConfiguration
			system
		];
	};
} 