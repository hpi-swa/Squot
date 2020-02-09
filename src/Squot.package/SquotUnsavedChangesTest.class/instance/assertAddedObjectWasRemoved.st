tests
assertAddedObjectWasRemoved
	self deny: (workingCopy includesObject: addedObject).
	self deny: (workingCopy includesObjectAt: 'added.txt').