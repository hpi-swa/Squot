actions
actionCommit
	| changeSets |
	changeSets := (self activeWorkingCopyIfNilInformAnd: [^ nil])
						changeSetsFromHeadCommitToImage.
	(self activeWorkingCopy allEmpty: changeSets)
		ifTrue: [^ self inform: 'Nothing to commit.'].
	^ self openDialogToCommitChangeSets: changeSets
		