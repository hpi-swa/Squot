actions
actionCommit
	| changeSets |
	changeSets := (self activeWorkingCopyIfNilInformAnd: [^ nil])
						changeSetsFromHeadCommitToImage.
	(SquotChangeSet allEmpty: changeSets)
		ifTrue: [^ self inform: 'Nothing to commit.'].
	^ self openDialogToCommitChangeSets: changeSets
		