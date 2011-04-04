tests
testDoesntContainReferenceFilesystem
	| ref other |
	ref := filesystem referenceTo: (FSPath * 'griffle').
	other := FSFilesystem inMemory referenceTo: 'griffle/nurp'.
	self deny: (ref contains: other)