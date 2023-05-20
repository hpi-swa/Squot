changes-creation
changesFromCommit: aCommitOrNil toCommit: anotherCommitOrNil
	^ self
		changesFromFSCommit: (self fsCommitFrom: aCommitOrNil)
		toFSCommit: (self fsCommitFrom: anotherCommitOrNil)