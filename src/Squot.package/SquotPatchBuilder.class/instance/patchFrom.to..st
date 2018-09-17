public
patchFrom: leftObjectContainer to: rightObjectContainer
	self initialize.
	self startingFrom: leftObjectContainer.
	rightArtifacts := rightObjectContainer artifacts.
	self displayProgress: 'Diffing objects' during:
		[self computeDiffsFromLeftToRight;
			computeDiffsForNewArtifacts].
	patchedLoadOrder := rightObjectContainer loadOrder.
	^ self buildPatch