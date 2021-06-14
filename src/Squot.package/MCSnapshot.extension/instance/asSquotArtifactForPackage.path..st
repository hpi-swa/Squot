*Squot-shadow
asSquotArtifactForPackage: aPackageInfo path: path

	| artifact |
	artifact := SquotArtifact new
		content: (SquotShadowGraph withSingleShadow:
			(SquotPackageShadow
				forPackageNamed: aPackageInfo packageName
				withSnapshot: self));
		initializeDefaultStoreInfoFor: aPackageInfo;
		yourself.
	artifact path: (SquotFileSystemStore validatePath: path for: artifact).
	^ artifact