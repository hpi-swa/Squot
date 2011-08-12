tests
testChildOfPath
	| parent  child |
	parent := FSPath / 'griffle'.
	child := filesystem / 'griffle' / 'nurb'.
	self deny: (child isChildOf: parent).
	self deny: (parent isChildOf: child).