diffing
diffAgainst: otherFilesArtifact

	"This can happen when you checkout"
	self isThisEverCalled: 'A live artifact appeared on the right(wrong) side'.
	^ otherFilesArtifact reverseDiffAgainstLiveFiles: self