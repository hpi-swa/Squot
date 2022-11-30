*Squot-Tools
browseFromSquotWorkingCopyArtifact: aSquotWorkingCopyArtifact
	aSquotWorkingCopyArtifact isLoaded ifFalse: [^ self browse].
	^ self definition browseFromSquotWorkingCopyArtifact: aSquotWorkingCopyArtifact