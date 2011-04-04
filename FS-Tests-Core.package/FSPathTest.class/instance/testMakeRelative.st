tests
testMakeRelative
	"self run: #testMakeRelative"
	
	| parent child relative |
	parent := FSPath / 'griffle' / 'bibb'.
	child := FSPath / 'griffle' / 'plonk' / 'nurp'.
	relative := parent makeRelative: child.
	self assert: relative = (FSPath parent / 'plonk' / 'nurp')