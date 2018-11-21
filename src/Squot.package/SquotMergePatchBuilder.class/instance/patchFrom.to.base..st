public
patchFrom: leftObjectContainer to: rightObjectContainer base: baseObjectContainer
	| base |
	self initialize.
	leftArtifacts := leftObjectContainer artifacts.
	rightArtifacts := rightObjectContainer artifacts.
	base := baseObjectContainer ifNil: [SquotSnapshot empty].
	baseArtifacts := base artifacts.
	fromBaseToIncoming := rightObjectContainer patchRelativeToBase: base.
	fromBaseToExisting := leftObjectContainer patchRelativeToBase: base.
	self mergePatches.
	leftLoadOrder := leftObjectContainer loadOrder.
	rightLoadOrder := rightObjectContainer loadOrder.
	baseLoadOrder := base loadOrder.
	self mergeLoadOrders.
	^ self buildPatch