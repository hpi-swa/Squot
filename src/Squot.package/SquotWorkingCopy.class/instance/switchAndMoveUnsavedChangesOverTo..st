switching historians
switchAndMoveUnsavedChangesOverTo: aHistorian
	| fromHistorian temporarySnapshot patch |
	fromHistorian := self loadedHistorian.
	(fromHistorian version = aHistorian version
	and: [(self repository hasTemporaryVersionsOn: aHistorian) not]) ifTrue:
		["nothing needs to be modified in the store"
		self loadedHistorian: aHistorian.
		^ self].
	self withCurrentSnapshot:
		[temporarySnapshot := self temporarilySaveChangesOn: fromHistorian.
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
	self repository clearTemporaryVersionsOn: fromHistorian. "changes have been moved over"