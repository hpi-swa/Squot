tests
testIsChildOfReference
	| parent child |
	parent := FSPath / 'griffle'.
	child := (FSFilesystem memory referenceTo: parent / 'nurb').
	self deny: (child isChildOf: parent).
	self deny: (parent isChildOf: child)