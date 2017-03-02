tests
testDoesntContainPath
	| ref |
	ref := filesystem * 'griffle'.
	self deny: (ref contains: (FSPath * 'nurp'))