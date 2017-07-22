switching historians
switchAndMoveUnsavedChangesOverTo: aHistorian
	| fromHistorian stashHistorian previousStashedVersion unsaved |
	fromHistorian := self loadedHistorian.
	self withCurrentSnapshot:
		[stashHistorian := self repository historianForTemporaryVersions.
		previousStashedVersion := self saveUnsavedChangesOn: stashHistorian.
		unsaved := self patchRelativeToBase: self baseSnapshot].
	self loadedHistorian: aHistorian.
	self loadVersion: aHistorian version interactive: false.
	UIManager default informUser: 'Restoring stashed changes' during:
	[store applyPatch: unsaved].
	previousStashedVersion
		ifNil: [self repository delete: stashHistorian]
		ifNotNil: [stashHistorian version: previousStashedVersion].