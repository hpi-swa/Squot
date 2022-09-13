*Squot-shadow
asSquotArtifactForPackage: aPackageInfo
	^ SquotArtifact new
		content: (SquotShadowGraph withSingleShadow:
			(SquotPackageShadow
				forPackageNamed: aPackageInfo packageName
				withSnapshot: self
				tonelProperties: (Dictionary newFrom: {#name -> aPackageInfo packageName asSymbol})));
		path: aPackageInfo name, '.package';
		initializeDefaultStoreInfoFor: aPackageInfo;
		yourself