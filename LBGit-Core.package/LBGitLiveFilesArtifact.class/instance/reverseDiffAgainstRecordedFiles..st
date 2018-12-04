diffing
reverseDiffAgainstRecordedFiles: otherFilesArtifact

	self initializeOn: otherFilesArtifact.
	^ LBGitFileListDiff left: otherFilesArtifact right: self