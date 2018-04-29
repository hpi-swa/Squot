switching historians
switchAndMoveUnsavedChangesOverTo: aHistorian
	| fromHistorian stashHistorian previousStashedVersion unsaved temporarySnapshot patch |
	fromHistorian := self loadedHistorian.
	(fromHistorian version = aHistorian version
	and: [(self repository hasTemporaryVersionsOn: aHistorian) not]) ifTrue:
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
		self privateLoadVersion: aHistorian version].
	self withCurrentSnapshot: [self mergeTemporaryVersionsOn: aHistorian].
	UIManager default informUser: 'Restoring unsaved changes' during:
	[self withCurrentSnapshot:
		[patch := SquotMergePatchBuilder new
			patchFrom: self currentSnapshot
			to: temporarySnapshot
			base: fromHistorian version.
		patch hasConflicts ifTrue:
			[patch := SquotConflictResolutionRequested new
				patch: patch;
				title: 'Merge conflicts with unsaved changes';
				signal].
		store applyPatch: patch]].
	previousStashedVersion
		ifNil: [self repository delete: self repository historianForTemporaryVersions]
		ifNotNil: [self repository historianForTemporaryVersions version: previousStashedVersion].