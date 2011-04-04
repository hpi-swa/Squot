tests
testDoesntContainPath
	| ref |
	ref := filesystem referenceTo: (FSPath * 'griffle').
	self deny: (ref contains: (FSPath * 'nurp'))