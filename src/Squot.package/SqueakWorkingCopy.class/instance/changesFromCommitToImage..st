changes-creation
changesFromCommitToImage: aCommitOrNil
	^ self changesFromFSCommitToImage: (self fsCommitFrom: aCommitOrNil)