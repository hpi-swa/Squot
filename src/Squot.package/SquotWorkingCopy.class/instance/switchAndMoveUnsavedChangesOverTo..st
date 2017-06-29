switching historians
switchAndMoveUnsavedChangesOverTo: aHistorian
	| fromHistorian stashHistorian previousStashedVersion unsavedDiffs unsavedArtifacts |
	fromHistorian := self loadedHistorian.
	self withCurrentSnapshot:
		[unsavedArtifacts := self currentSnapshot artifacts.
		stashHistorian := self repository historianForTemporaryVersions.
		previousStashedVersion := self saveUnsavedChangesOn: stashHistorian.
		unsavedDiffs := self diffsForUnsavedChanges].
	self loadedHistorian: aHistorian.
	self loadVersion: aHistorian version interactive: false.
	self restoreUnsavedChangesFromDiffs: unsavedDiffs andArtifacts: unsavedArtifacts.
	previousStashedVersion
		ifNil: [self repository delete: stashHistorian]
		ifNotNil: [stashHistorian version: previousStashedVersion].