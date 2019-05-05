diffing
reverseDiffAgainstRecordedFiles: otherFilesArtifact

	self initializeOn: otherFilesArtifact.
	^ SquotFileListDiff left: otherFilesArtifact right: self