tests
testDoesntContainReferencePath
	| ref other |
	ref := filesystem referenceTo: (FSPath * 'griffle').
	other := filesystem referenceTo: (FSPath * 'nurp').
	self deny: (ref contains: other)