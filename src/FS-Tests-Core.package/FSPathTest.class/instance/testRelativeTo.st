tests
testRelativeTo
	"self run: #testRelativeTo"
	"aPath relativeTo: aParent returns a new path relative to the parent"
	
	| parent child relative |
	parent := FSPath / 'griffle'.
	child := FSPath / 'griffle' / 'plonk' / 'nurp'.
	relative := child relativeTo: parent.
	self assert: relative = (FSPath * 'plonk' / 'nurp')