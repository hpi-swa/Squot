accessing
patchFrom: leftObjectContainer to: rightObjectContainer
	self initialize.
	self startingFrom: leftObjectContainer.
	self goingTo: rightObjectContainer.
	self displayProgress: 'Diffing objects' during:
		[self computeDiffsFromLeftToRight;
			computeDiffsForNewArtifacts].
	^ self buildPatch