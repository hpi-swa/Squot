utilities
newToolOn: patch
	^ (SquotChangedArtifactsChooser on: patch)
		workingCopy: workingCopy;
		yourself