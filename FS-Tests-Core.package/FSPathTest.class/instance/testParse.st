tests
testParse
	"self run: #testParse"
	
	| path |
	path := FSPath readFrom: 'parent/child/grandChild' readStream delimiter: $/.
	self assert: path size = 3.
	self assert: (path at: 1) = 'parent'.
	self assert: (path at: 2) = 'child'.
	self assert: (path at: 3) = 'grandChild'.
	
