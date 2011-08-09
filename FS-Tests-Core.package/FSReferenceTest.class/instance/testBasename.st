tests
testBasename
	"self debug: #testBasename"
	
	| ref |
	
	ref := filesystem root.
	self assert: ref basename = '/'.
	
	ref := filesystem referenceTo: 'plonk/griffle'.
	self assert: ref basename = 'griffle'.
	
	ref := filesystem referenceTo: 'plonk/griffle.taz'.
	self assert: ref basename = 'griffle.taz'.