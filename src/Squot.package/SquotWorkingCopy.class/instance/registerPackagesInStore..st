adding and removing
registerPackagesInStore: aSnapshot
	| packageArtifacts |
	packageArtifacts := aSnapshot artifacts select: [:each | each path endsWith: '.package'].
	packageArtifacts do: [:each | | packageName |
		packageName := (each path splitBy: '/') last allButLast: '.package' size.
		(store includesObjectAt: each path) ifFalse:
			[store addLoadedPackageInfoNamed: packageName at: each path]].