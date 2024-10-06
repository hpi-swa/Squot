changes-creation
changeSetsFromImageToCommit: aCommitOrNil
	^ self changeSetsFromImageToFSCommit: (self fsCommitFrom: aCommitOrNil)