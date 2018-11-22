as yet unclassified
on: aRecordedFilesArtifact

	self paths: 
		(aRecordedFilesArtifact trackedFiles collect: [:each | each -> (LBGitDeserializedShadow onReference: (aRecordedFilesArtifact rootDirectory resolve: each))]) asDictionary 