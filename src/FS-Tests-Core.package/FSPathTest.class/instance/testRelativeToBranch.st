tests
testRelativeToBranch
	| parent child relative |
	parent := FSPath / 'griffle' / 'bibb'.
	child := FSPath / 'griffle' / 'plonk' / 'nurp'.
	relative := child relativeTo: parent.
	self assert: relative = (FSPath parent / 'plonk' / 'nurp')