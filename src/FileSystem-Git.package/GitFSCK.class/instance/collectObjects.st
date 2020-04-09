validating
collectObjects
	all := repository unitOfWork allObjects.
	all := all reject: [ :each| each species == GitTag]