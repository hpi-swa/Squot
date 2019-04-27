initialize-release
initializeTrackedFiles

	self 
		add: LBGitFilesObject new
		at: LBGitFilesArtifact path
		additionalInfo: SquotTrackedObjectMetadata new.