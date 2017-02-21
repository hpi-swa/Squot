validating
collectObjects
	all := repository looseObjects.
	self flag: 'TODO: collect packed objects'.
	all := all reject: [ :each| each species == GitTag]