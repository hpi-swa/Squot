changes-creation
changeSetFromCommit: aCommitOrNil toCommit: anotherCommitOrNil
	^ self
		changeSetFromFSCommit: (self fsCommitFrom: aCommitOrNil)
		toFSCommit: (self fsCommitFrom: anotherCommitOrNil)