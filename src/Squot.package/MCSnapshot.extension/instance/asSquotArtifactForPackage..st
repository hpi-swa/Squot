*Squot-Tests
asSquotArtifactForPackage: aPackageInfo
	SquotToggles useNewApi ifTrue:
		[^ SquotLegacyArtifactAdapter
			artifact: (SquotArtifact storeInfo: (SquotTrackedObjectMetadata withNewId
				at: 'path' put: aPackageInfo name, '.package';
				at: 'references' put:
					{'package_', aPackageInfo name -> (OrderedDictionary newFrom:
						{'type' -> 'package'.
						'packageName' -> aPackageInfo name.
						'content-type' -> SquotCypressCodeSerializer contentType})};
				yourself))
			objectSnapshot: (SquotShadowGraph withSingleShadow:
				(SquotPackageShadow
					forPackageNamed: aPackageInfo packageName
					withSnapshot: self
					tonelProperties: (Dictionary newFrom: {#name -> aPackageInfo packageName asSymbol})))].
	^ SquotArtifact new
		content: (SquotShadowGraph withSingleShadow:
			(SquotPackageShadow
				forPackageNamed: aPackageInfo packageName
				withSnapshot: self
				tonelProperties: (Dictionary newFrom: {#name -> aPackageInfo packageName asSymbol})));
		path: aPackageInfo name, '.package';
		initializeDefaultStoreInfoFor: aPackageInfo;
		yourself