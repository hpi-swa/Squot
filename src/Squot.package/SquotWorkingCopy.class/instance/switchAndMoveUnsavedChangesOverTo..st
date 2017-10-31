switching historians
switchAndMoveUnsavedChangesOverTo: aHistorian
	| fromHistorian stashHistorian previousStashedVersion unsaved temporarySnapshot patch |
	fromHistorian := self loadedHistorian.
	(fromHistorian version = aHistorian version
	and: [(self repository historianForTemporaryVersionsOn: aHistorian) version isNil]) ifTrue:
		["nothing needs to be modified in the store"
		self loadedHistorian: aHistorian.
		^ self].
	self withCurrentSnapshot:
		[stashHistorian := self repository historianForTemporaryVersions.
		previousStashedVersion := self saveUnsavedChangesOn: stashHistorian.
		UIManager default informUser: 'Computing unsaved changes' during:
		[unsaved := self patchRelativeToBase: self baseSnapshot.
		temporarySnapshot := SquotSnapshot builder
			addAll: self baseSnapshot artifacts;
			in: [:builder | unsaved applyTo: builder];
			buildSnapshot].
		self loadedHistorian: aHistorian.
		stashHistorian := self repository historianForTemporaryVersionsOn: aHistorian.
		self privateLoadVersion: (stashHistorian version ifNil: [aHistorian version]).
		self loadedVersion: aHistorian version].
	UIManager default informUser: 'Restoring unsaved changes' during:
	[self withCurrentSnapshot:
		[patch := SquotMergePatchBuilder new
			patchFrom: self currentSnapshot
			to: temporarySnapshot
			base: fromHistorian version.
		patch hasConflicts ifTrue:
			[patch := SquotConflictResolutionRequested new
				patch: patch;
				signal].
		store applyPatch: patch]].
	previousStashedVersion
		ifNil: [self repository delete: self repository historianForTemporaryVersions]
		ifNotNil: [self repository historianForTemporaryVersions version: previousStashedVersion].