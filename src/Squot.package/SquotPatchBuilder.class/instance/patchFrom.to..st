public
patchFrom: leftObjectContainer to: rightObjectContainer
	| patch |
	self initialize.
	leftArtifacts := leftObjectContainer artifacts.
	rightArtifacts := rightObjectContainer artifacts.
	self displayProgress: 'Diffing objects' during:
		[self computeDiffsFromLeftToRight;
			computeDiffsForNewArtifacts].
	patch := SquotPatch with: diffs.
	patch loadOrderDiff: (self computeLoadOrderDiffFrom: leftObjectContainer to: rightObjectContainer).
	^ patch