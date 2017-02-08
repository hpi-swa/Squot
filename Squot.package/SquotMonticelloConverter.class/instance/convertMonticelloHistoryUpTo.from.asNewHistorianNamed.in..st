converting history
convertMonticelloHistoryUpTo: aMCVersion from: aMCRepository asNewHistorianNamed: historianName in: aRepository
	| versionInfos |
	squotRepository := aRepository.
	monticelloRepository := aMCRepository.
	versionInfos := aMCVersion info topologicalAncestors.
	versionInfos reverseDo: [:eachMCVersionInfo | self convertMonticelloVersion: eachMCVersionInfo].
	aRepository newHistorian: historianName version: (self squotVersionForMonticelloVersion: aMCVersion).
	self cleanUpTemporaryHistorians.