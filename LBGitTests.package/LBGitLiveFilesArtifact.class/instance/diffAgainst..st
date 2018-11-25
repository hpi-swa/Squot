diffing
diffAgainst: otherFilesArtifact

	self isThisEverCalled: 'A live artifact appeared on the right(wrong) side'.
	^ otherFilesArtifact reverseDiffAgainstLiveFiles: self