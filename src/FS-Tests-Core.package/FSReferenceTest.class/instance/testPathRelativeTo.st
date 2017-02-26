tests
testPathRelativeTo
	| parent childPath relative |
	parent := filesystem / 'griffle'.
	childPath := FSPath / 'griffle' / 'plonk' / 'nurb'.
	relative := childPath relativeTo: parent.
	self assert: relative = (FSPath * 'plonk' / 'nurb')