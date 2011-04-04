tests
testPathRelativeTo
	| parent childPath relative |
	parent := filesystem referenceTo: (FSPath / 'griffle').
	childPath := FSPath / 'griffle' / 'plonk' / 'nurb'.
	relative := childPath relativeTo: parent.
	self assert: relative = (FSPath * 'plonk' / 'nurb')