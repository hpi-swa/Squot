changes-creation
changesFromImageToCommit: aCommitOrNil
	^ self changesFromImageToFSCommit: (self fsCommitFrom: aCommitOrNil)