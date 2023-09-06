changes-creation
changeSetFromImageToCommit: aCommitOrNil
	^ self changeSetFromImageToFSCommit: (self fsCommitFrom: aCommitOrNil)