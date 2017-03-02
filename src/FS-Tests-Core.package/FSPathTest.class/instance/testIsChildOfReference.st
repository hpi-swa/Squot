tests
testIsChildOfReference
	| parent child |
	parent := FSPath / 'griffle'.
	child := (FileSystem memory referenceTo: parent / 'nurb').
	self deny: (child isChildOf: parent).
	self deny: (parent isChildOf: child)