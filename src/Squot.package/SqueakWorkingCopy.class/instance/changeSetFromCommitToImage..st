changes-creation
changeSetFromCommitToImage: aCommitOrNil
	^ self changeSetFromFSCommitToImage: (self fsCommitFrom: aCommitOrNil)