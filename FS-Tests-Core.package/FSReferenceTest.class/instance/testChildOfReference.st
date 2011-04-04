tests
testChildOfReference
	| parent  child |
	parent := filesystem referenceTo: '/griffle'.
	child := filesystem referenceTo: '/griffle/nurb'.
	self assert: (child isChildOf: parent).
	self deny: (parent isChildOf: child).