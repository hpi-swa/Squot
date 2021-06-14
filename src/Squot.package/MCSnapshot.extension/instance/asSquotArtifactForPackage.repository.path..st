*Squot-shadow
asSquotArtifactForPackage: aPackageInfo repository: aSquitRepository path: path

	| artifact |
	artifact := SquotArtifact new
		content: (SquotShadowGraph withSingleShadow:
			(SquotPackageShadow
				forPackageNamed: aPackageInfo packageName
				withSnapshot: self));
		initializeDefaultStoreInfoFor: aPackageInfo;
		yourself.
	artifact path: (aSquitRepository validatePath: path for: artifact).
	^ artifact