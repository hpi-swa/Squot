adding and removing
registerPackagesInStore: aSnapshot
	| packageArtifacts |
	packageArtifacts := aSnapshot artifacts select: [:each | each isLoadable and: [each storeInfo objectClassName = #PackageInfo]].
	packageArtifacts do: [:each | | packageName |
		self assert: (repository validatePath: each path for: each) = each path
			description: 'Paths in the snapshot must already be valid'.
		packageName := each content startShadow packageName.
		(store includesObjectAt: each path) ifFalse:
			[store
				addLoadedPackageInfoNamed: packageName
				at: each path
				serializer: (Environment current valueOf: each storeInfo serializer)]]
		displayingProgress: [:each | 'Searching for packages in ', each path].