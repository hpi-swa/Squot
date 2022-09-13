converting history
convertUpToLoadedVersionOfAllPackagesNamed: packageNames asHistorianNamed: historianName in: aSquotRepository

	| workingCopies latestVersions repositoryGroup |
	workingCopies := packageNames collect: [:packageName |
		MCWorkingCopy forPackageNamed: packageName].
	latestVersions := packageNames with: workingCopies collect: [:packageName :workingCopy |
		| latestVersion |
		latestVersion := MCCacheRepository default versionWithInfo: workingCopy ancestors first.
		self assert: latestVersion notNil description: 'latest version not in cache'.
		latestVersion].
	
	repositoryGroup := MCRepositoryGroup new.
	(workingCopies collect: [:workingCopy | workingCopy repositoryGroup]) withoutDuplicates do: [:packageRepositoryGroup |
		repositoryGroup addRepository: packageRepositoryGroup].
	
	^ self
		convertMonticelloHistoryUpToAll: latestVersions
		from: repositoryGroup
		asNewHistorianNamed: historianName
		in: aSquotRepository