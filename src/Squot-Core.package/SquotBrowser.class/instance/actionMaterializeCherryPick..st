actions
actionMaterializeCherryPick: aCommit
	^ self
		onConflictOpenDialogToMaterializeChangeSets:
			(self activeWorkingCopy
				mergeCommitIntoHead: aCommit
				withBase: (self parentForPick: aCommit))
		windowTitle: ('Resolve conflicts to edit {1}' format: {aCommit showOneLine})