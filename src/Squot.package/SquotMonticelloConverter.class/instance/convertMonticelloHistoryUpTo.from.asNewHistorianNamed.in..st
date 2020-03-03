converting history
convertMonticelloHistoryUpTo: aMCVersion from: aMCRepository asNewHistorianNamed: historianName in: aRepository
	| versionInfos |
	squotRepository := aRepository.
	monticelloRepository := aMCRepository.
	versionInfos := aMCVersion info topologicalAncestors reverse.
	squotRepository withUnitOfWork:
		[monticelloRepository cacheAllFileNamesDuring:
			[versionInfos
				do: [:eachMCVersionInfo | self convertMonticelloVersion: eachMCVersionInfo]
				displayingProgress: [:info | 'Converting ', info name]].
		aRepository newHistorian: historianName version: (self squotVersionForMonticelloVersion: aMCVersion).
		self cleanUpTemporaryHistorians].