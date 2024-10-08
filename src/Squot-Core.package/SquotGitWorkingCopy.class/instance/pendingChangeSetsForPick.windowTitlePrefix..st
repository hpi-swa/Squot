pending-changes
pendingChangeSetsForPick: aCommit
windowTitlePrefix: aString
	^ (self pendingChangeSets: (self
			changeSetsToMergeCommitIntoHead: aCommit
			withBase: (self parentForPick: aCommit)))
		windowTitle: ('{1} {2}' format: {aString. aCommit showOneLine});
		yourself