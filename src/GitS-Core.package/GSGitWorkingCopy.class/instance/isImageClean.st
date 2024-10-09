testing
isImageClean
	^ GSChangeSet allEmpty: (self changeSetsFromImageToCommit: self headCommit)