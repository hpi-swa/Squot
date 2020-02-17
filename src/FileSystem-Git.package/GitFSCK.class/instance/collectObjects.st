validating
collectObjects
	all := repository allObjects.
	all := all reject: [ :each| each species == GitTag]