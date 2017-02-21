as yet unclassified
convertUpToLoadedVersionOfPackageNamed: packageName asHistorianNamed: historianName in: aSquotRepository
	| workingCopy latestVersion |
	workingCopy := MCWorkingCopy forPackageNamed: packageName.
	latestVersion := MCCacheRepository default versionWithInfo: workingCopy ancestors first.
	self assert: latestVersion notNil description: 'latest version not in cache'.
	^ self new
		convertMonticelloHistoryUpTo: latestVersion
		from: workingCopy repositoryGroup
		asNewHistorianNamed: historianName
		in: aSquotRepository