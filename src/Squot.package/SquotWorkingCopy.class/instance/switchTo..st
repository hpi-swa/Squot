switching historians
switchTo: aHistorian
	| fromHistorian stashHistorian |
	fromHistorian := self loadedHistorian.
	self withCurrentSnapshot:
		[stashHistorian := self repository historianForTemporaryVersionsOn: fromHistorian.
		self saveUnsavedChangesOn: stashHistorian.
		self loadedHistorian: aHistorian.
		self privateLoadVersion: aHistorian version].
	self withCurrentSnapshot: [self mergeTemporaryVersionsOn: aHistorian].