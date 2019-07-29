switching historians
switchAndMoveUnsavedChangesOverTo: aHistorian
	| fromHistorian temporarySnapshot merge |
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
		[merge := SquotMerge into: self
			merge: temporarySnapshot
			basedOn: fromHistorian version.
		merge hasConflicts
			ifTrue:
				[[self selectFromMerge: merge title: 'Merge conflicts with unsaved changes'
					ifCancelled:
						[self inform: 'Cannot abort this merge. But you could choose to exclude all changes to discard them.'.
						SquotCannotAbortMerge signal]]
					on: SquotCannotAbortMerge do: [:ex | ex retry]].
		store applyPatch: merge resolvedPatch]].
	self repository clearTemporaryVersionsOn: fromHistorian. "changes have been moved over"