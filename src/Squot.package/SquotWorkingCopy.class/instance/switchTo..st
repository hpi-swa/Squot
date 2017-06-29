switching historians
switchTo: aHistorian
	| fromHistorian stashHistorian unsavedArtifacts |
	fromHistorian := self loadedHistorian.
	self withCurrentSnapshot:
		[unsavedArtifacts := self currentSnapshot artifacts.
		stashHistorian := self repository historianForTemporaryVersionsOn: fromHistorian.
		self saveUnsavedChangesOn: stashHistorian].
	self loadedHistorian: aHistorian.
	self loadVersion: aHistorian version interactive: false.
	stashHistorian := self repository historianForTemporaryVersionsOn: aHistorian.
	self restoreUnsavedChangesFrom: stashHistorian.