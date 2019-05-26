accessing
peeledRefsDictionary
	peeledRefsDictionary ifNil: [self readFromFile].
	^ peeledRefsDictionary ifNil: [Dictionary new]