diffing
reverseDiffAgainstLiveFiles: otherFilesArtifact

	otherFilesArtifact initializeOn: self.
	^ LBGitFileListDiff left: otherFilesArtifact right: self