converting history
convertUpToLoadedVersionOfAllPackagesNamed: packageNames asHistorianNamed: historianName in: aSquotRepository
	"
	SquotMonticelloConverter convertUpToLoadedVersionOfAllPackagesNamed: #('VersionNumber' 'VersionNumberTests') asHistorianNamed: 'mc' in: SquotWorkingCopy registered anyOne repository.
	"

	^ self new
		convertUpToLoadedVersionOfAllPackagesNamed: packageNames
		asHistorianNamed: historianName in: aSquotRepository