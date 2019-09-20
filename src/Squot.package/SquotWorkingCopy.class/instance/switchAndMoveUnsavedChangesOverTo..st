switching historians
switchAndMoveUnsavedChangesOverTo: aHistorian
	| fromHistorian temporarySnapshot |
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
	[self mergeSilently: temporarySnapshot basedOn: fromHistorian version
		onConflictsDo:
			[:merge | | accepted |
			[accepted := true.
			self selectFromMerge: merge
				title: 'Merge conflicts with unsaved changes'
				ifCancelled:
					[self inform: 'Cannot abort this merge. But you could choose to exclude all changes to discard them.'.
					accepted := false]]
				doWhileFalse: [accepted]]].
	self repository clearTemporaryVersionsOn: fromHistorian. "changes have been moved over"