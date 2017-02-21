tests
testInstantiation
	"done in setup"
	self assert: squitRepository notNil.
	self assert: (squitRepository instVarNamed: 'gitRepository') notNil.