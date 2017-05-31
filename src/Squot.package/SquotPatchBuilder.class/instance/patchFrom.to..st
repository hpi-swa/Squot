public
patchFrom: leftObjectContainer to: rightObjectContainer
	self initialize.
	leftArtifacts := leftObjectContainer artifacts.
	rightArtifacts := rightObjectContainer artifacts.
	self displayProgress: 'Diffing objects' during:
		[self computeDiffsFromLeftToRight;
			computeDiffsForNewArtifacts].
	^ SquotPatch with: diffs