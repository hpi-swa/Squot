accessing
patchFrom: leftObjectContainer to: rightObjectContainer
	self initialize.
	self startingFrom: leftObjectContainer goingTo: rightObjectContainer.
	^ self buildPatch