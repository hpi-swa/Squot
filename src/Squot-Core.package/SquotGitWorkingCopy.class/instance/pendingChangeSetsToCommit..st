pending-changes
pendingChangeSetsToCommit: aCollection
	^ (self pendingChangeSets: aCollection)
		windowTitle: 'Changes to commit';
		yourself