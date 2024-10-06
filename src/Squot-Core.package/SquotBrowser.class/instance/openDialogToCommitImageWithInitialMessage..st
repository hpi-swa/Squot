dialog
openDialogToCommitImageWithInitialMessage: aString
	| changeSets |
	changeSets := self activeWorkingCopy changeSetsFromHeadCommitToImage.
	(SquotChangeSet allEmpty: changeSets)
		ifTrue: [self inform: 'Nothing to commit.'. ^ Promise unit: nil].
	^ self
		openDialogToCommitChangeSets: changeSets
		initialMessage: aString