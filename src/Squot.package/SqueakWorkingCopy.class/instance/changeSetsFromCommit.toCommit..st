changes-creation
changeSetsFromCommit: aCommitOrNil toCommit: anotherCommitOrNil
	^ self
		changeSetsFromFSCommit: (self fsCommitFrom: aCommitOrNil)
		toFSCommit: (self fsCommitFrom: anotherCommitOrNil)