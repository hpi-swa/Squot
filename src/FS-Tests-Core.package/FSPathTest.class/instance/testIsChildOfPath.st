tests
testIsChildOfPath
	| parent child |
	parent := FSPath / 'griffle'.
	child := parent / 'nurb'.
	self assert: (child isChildOf: parent).
	self deny: (parent isChildOf: child)