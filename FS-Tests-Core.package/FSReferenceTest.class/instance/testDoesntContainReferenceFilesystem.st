tests
testDoesntContainReferenceFilesystem
	| ref other |
	ref := filesystem referenceTo: (FSPath * 'griffle').
	other := FSFilesystem memory / 'griffle' / 'nurp'.
	self deny: (ref contains: other)