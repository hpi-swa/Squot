testing
isImageClean
	^ SquotChangeSet allEmpty: (self changeSetsFromImageToCommit: self headCommit)