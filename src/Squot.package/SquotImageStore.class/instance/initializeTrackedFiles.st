initialize-release
initializeTrackedFiles

	self 
		add: SquotFilesObject new
		at: SquotFilesArtifact path
		additionalInfo: SquotTrackedObjectMetadata new.