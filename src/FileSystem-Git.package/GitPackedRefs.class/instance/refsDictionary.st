accessing
refsDictionary
	refsDictionary ifNil: [self readFromFile].
	^ refsDictionary ifNil: [Dictionary new]