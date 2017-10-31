public
patchFrom: leftObjectContainer to: rightObjectContainer base: baseObjectContainer
	self initialize.
	leftArtifacts := leftObjectContainer artifacts.
	rightArtifacts := rightObjectContainer artifacts.
	baseArtifacts := baseObjectContainer artifacts.
	fromBaseToIncoming := rightObjectContainer patchRelativeToBase: baseObjectContainer.
	fromBaseToExisting := leftObjectContainer patchRelativeToBase: baseObjectContainer.
	self mergePatches.
	^ SquotPatch with: diffs