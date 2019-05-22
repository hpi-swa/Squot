adding and removing
registerPackagesInStore: aSnapshot
	| packageArtifacts |
	packageArtifacts := aSnapshot artifacts select: [:each | each isLoadable and: [each storeInfo objectClassName = #PackageInfo]].
	packageArtifacts do: [:each | | packageName |
		packageName := each content startShadow packageName.
		(store includesObjectAt: each path) ifFalse:
			[store
				addLoadedPackageInfoNamed: packageName
				at: each path
				serializer: (Environment current valueOf: each storeInfo serializer)]].