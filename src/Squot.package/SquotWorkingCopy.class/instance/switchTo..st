switching historians
switchTo: aHistorian
	| fromHistorian stashHistorian |
	fromHistorian := self loadedHistorian.
	self withCurrentSnapshot:
		[stashHistorian := self repository historianForTemporaryVersionsOn: fromHistorian.
		self saveUnsavedChangesOn: stashHistorian.
		self loadedHistorian: aHistorian.
		stashHistorian := self repository historianForTemporaryVersionsOn: aHistorian.
		self privateLoadVersion: (stashHistorian version ifNil: [aHistorian version]).
		self loadedVersion: aHistorian version].