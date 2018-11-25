diffing
reverseDiffAgainstRecordedFiles: otherFilesArtifact

	self flag: #TODO.
	self halt.
	self initializeOn: otherFilesArtifact.
	^ LBGitFileListDiff left: otherFilesArtifact right: self