*Squot-shadow
asSquotArtifactForPackage: aPackageInfo
	^ SquotArtifact new
		content: (SquotShadowGraph withSingleShadow:
			(SquotPackageShadow
				forPackageNamed: aPackageInfo packageName
				withSnapshot: self));
		path: aPackageInfo name, '.package';
		initializeDefaultStoreInfoFor: aPackageInfo;
		yourself