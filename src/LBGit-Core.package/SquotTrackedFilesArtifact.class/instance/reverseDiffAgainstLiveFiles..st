diffing
reverseDiffAgainstLiveFiles: otherFilesArtifact

	otherFilesArtifact initializeOn: self.
	^ SquotFileListDiff left: otherFilesArtifact right: self