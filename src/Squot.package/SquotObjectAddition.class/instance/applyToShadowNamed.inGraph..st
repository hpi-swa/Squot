patching
applyToShadowNamed: name inGraph: aMutableObjectGraph
	self checkName: name.
	aMutableObjectGraph assign: name toShadow: addedObject undecorated.
	^ addedObject