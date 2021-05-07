converting history
convertMonticelloHistoryUpTo: aMCVersion from: aMCRepository asNewHistorianNamed: historianName in: aRepository
	| versionInfos |
	squotRepository := aRepository.
	monticelloRepository := aMCRepository.
	versionInfos := aMCVersion info topologicalAncestors reverse.
	squotRepository withUnitOfWork:
		[monticelloRepository cacheAllFileNamesDuring:
			[SquotProgress display: [:info | 'Converting ', info name]
				for: versionInfos
				do: [:eachMCVersionInfo | self convertMonticelloVersion: eachMCVersionInfo]].
		aRepository newHistorian: historianName version: (self squotVersionForMonticelloVersion: aMCVersion).
		self cleanUpTemporaryHistorians].