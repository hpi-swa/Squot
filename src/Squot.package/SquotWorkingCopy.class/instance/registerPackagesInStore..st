*Squot-Packages
registerPackagesInStore: aSnapshot
	| packageArtifacts |
	packageArtifacts := aSnapshot artifacts select: [:each | each isLoadable and: [each storeInfo objectClassName = #PackageInfo]].
	SquotProgress display: [:each | 'Searching for packages in ', each path]
		for: packageArtifacts do:
		[:each | | packageName storeInfo |
		storeInfo := each storeInfo copy
			at: #path put: each path;
			yourself.
		repository initializeStoreInfo: storeInfo forObject: each content.
		self assert: (storeInfo at: #path) = each path
			description: 'Paths in the snapshot must already be valid'.
		packageName := each packageName.
		(self includesObjectAt: each path) ifFalse:
			[self
				addLoadedPackageInfoNamed: packageName
				at: each path
				serializer: (Environment current valueOf: each storeInfo serializer)]].