pending-changes
pendingChangeSetsForPick: aCommit
	^ (self pendingChangeSets:
			(self
				changeSetsToMergeCommitIntoHead: aCommit
				withBase: (self parentForPick: aCommit)))
		windowTitle: aCommit showOneLine;
		yourself