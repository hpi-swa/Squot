tests
testParseBogus
	"self run: #testParseBogus"
	
	| path |
	path := FSPath readFrom: 'parent?<>~ \child/grandChild' readStream delimiter: $/.
	self assert: path size = 2.
	self assert: (path at: 1) = 'parent?<>~ \child'.
	self assert: (path at: 2) = 'grandChild'.
	
