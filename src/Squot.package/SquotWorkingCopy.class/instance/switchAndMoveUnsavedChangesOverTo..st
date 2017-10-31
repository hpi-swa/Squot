switching historians
switchAndMoveUnsavedChangesOverTo: aHistorian
	| fromHistorian stashHistorian previousStashedVersion unsaved |
	fromHistorian := self loadedHistorian.
	fromHistorian version = aHistorian version ifTrue:
		["nothing needs to be modified in the store"
		self loadedHistorian: aHistorian.
		^ self].
	self withCurrentSnapshot:
		[stashHistorian := self repository historianForTemporaryVersions.
		previousStashedVersion := self saveUnsavedChangesOn: stashHistorian.
		UIManager default informUser: 'Computing unsaved changes' during:
		[unsaved := self patchRelativeToBase: self baseSnapshot].
		self loadedHistorian: aHistorian.
		self loadVersion: aHistorian version interactive: false].
	UIManager default informUser: 'Restoring stashed changes' during:
	[store applyPatch: unsaved].
	previousStashedVersion
		ifNil: [self repository delete: stashHistorian]
		ifNotNil: [stashHistorian version: previousStashedVersion].