as yet unclassified
verifyVersionsOf: aHistorian ofLoadedPackageNamed: packageName
	| workingCopy latestVersion |
	workingCopy := MCWorkingCopy forPackageNamed: packageName.
	latestVersion := MCCacheRepository default versionWithInfo: workingCopy ancestors first.
	self assert: latestVersion notNil description: 'latest version not in cache'.
	^ self new
		verify: aHistorian
		hasCorrectConversionsUpTo: latestVersion
		whichComesFrom: workingCopy repositoryGroup