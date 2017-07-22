switching historians
switchTo: aHistorian
	| fromHistorian stashHistorian |
	fromHistorian := self loadedHistorian.
	self withCurrentSnapshot:
		[stashHistorian := self repository historianForTemporaryVersionsOn: fromHistorian.
		self saveUnsavedChangesOn: stashHistorian.
		self loadedHistorian: aHistorian.
		self loadVersion: aHistorian version interactive: false].
	stashHistorian := self repository historianForTemporaryVersionsOn: aHistorian.
	self restoreUnsavedChangesFrom: stashHistorian.