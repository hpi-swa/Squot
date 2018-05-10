switching historians
switchTo: aHistorian
	| fromHistorian |
	fromHistorian := self loadedHistorian.
	self withCurrentSnapshot:
		[self temporarilySaveChangesOn: fromHistorian.
		self loadedHistorian: aHistorian.
		self privateLoadVersion: aHistorian version].
	self withCurrentSnapshot: [self mergeTemporaryVersionsOn: aHistorian].