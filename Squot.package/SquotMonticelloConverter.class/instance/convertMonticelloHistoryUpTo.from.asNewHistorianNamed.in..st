public
convertMonticelloHistoryUpTo: aMCVersion from: aMCRepository asNewHistorianNamed: historianName in: aRepository
	| versionInfos |
	squotRepository := aRepository.
	monticelloRepository := aMCRepository.
	versionInfos := self collectAncestorsOfMonticelloVersion: aMCVersion.
	versionInfos do: [:eachMCVersionInfo | self convertMonticelloVersion: eachMCVersionInfo].
	aRepository newHistorian: historianName version: (self squotVersionForMonticelloVersion: aMCVersion).
	self cleanUpTemporaryHistorians.