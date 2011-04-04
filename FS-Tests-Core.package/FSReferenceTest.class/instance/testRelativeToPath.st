tests
testRelativeToPath
	| parentPath child relative |
	parentPath := FSPath / 'griffle'.
	child := filesystem referenceTo: (FSPath / 'griffle' / 'plonk' / 'nurb').
	relative := child relativeTo: parentPath.
	self assert: relative = (FSPath * 'plonk' / 'nurb')