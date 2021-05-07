instance creation
left: leftArtifact right: rightArtifact isLoadedInWorkingCopy: aBoolean contentDiff: aGraphDiff metadataDiff: aMetadataDiff
	^ self new
		setLeft: leftArtifact
		right: rightArtifact
		isLoadedInWorkingCopy: aBoolean
		contentDiff: aGraphDiff
		metadataDiff: aMetadataDiff;
		yourself