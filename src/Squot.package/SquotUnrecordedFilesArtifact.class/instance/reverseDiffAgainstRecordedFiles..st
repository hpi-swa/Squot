comparing
reverseDiffAgainstRecordedFiles: otherFilesArtifact
	
	^ (UIManager confirm: 'You are about to remove tracking of files outside the image. Are you sure to do so?')
		ifTrue: [LBGitArtifactReplacementDiff left: otherFilesArtifact right: self]
		ifFalse: [SquotDiffOfEqualObjects instance]