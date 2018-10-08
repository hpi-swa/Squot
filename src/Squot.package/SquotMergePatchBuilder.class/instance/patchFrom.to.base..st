public
patchFrom: leftObjectContainer to: rightObjectContainer base: baseObjectContainer
	self initialize.
	leftArtifacts := leftObjectContainer artifacts.
	rightArtifacts := rightObjectContainer artifacts.
	baseArtifacts := baseObjectContainer artifacts.
	fromBaseToIncoming := rightObjectContainer patchRelativeToBase: baseObjectContainer.
	fromBaseToExisting := leftObjectContainer patchRelativeToBase: baseObjectContainer.
	self mergePatches.
	leftLoadOrder := leftObjectContainer loadOrder.
	rightLoadOrder := rightObjectContainer loadOrder.
	baseLoadOrder := baseObjectContainer loadOrder.
	self mergeLoadOrders.
	^ self buildPatch