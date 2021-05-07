initialize-release
setLeft: leftArtifact right: rightArtifact isLoadedInWorkingCopy: aBoolean contentDiff: aGraphDiff metadataDiff: aMetadataDiff
	super setLeft: leftArtifact right: rightArtifact isLoadedInWorkingCopy: aBoolean.
	diffContent := aGraphDiff.
	metadataDiff := aMetadataDiff.