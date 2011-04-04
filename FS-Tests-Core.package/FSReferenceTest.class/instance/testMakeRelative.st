tests
testMakeRelative
	"self run: #testMakeRelative"

	| parent child relative |
	parent := filesystem referenceTo: (FSPath / 'griffle').
	child := filesystem referenceTo: (FSPath / 'griffle' / 'plonk' / 'nurb').
	relative := parent makeRelative: child.
	self assert: relative = (FSPath * 'plonk' / 'nurb')