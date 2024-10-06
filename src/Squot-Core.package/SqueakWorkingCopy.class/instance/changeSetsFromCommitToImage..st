changes-creation
changeSetsFromCommitToImage: aCommitOrNil
	^ self changeSetsFromFSCommitToImage: (self fsCommitFrom: aCommitOrNil)