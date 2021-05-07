tests
testMethodDefinitionBrowse
	"when"
	SquotFakeToolSet installDuring: 
		[(self rootNode withAllChildren detect: [:each | each title asString includesSubstring: existingMethod selector caseSensitive: true]) browseInWorkingCopy].
	"then"
	self assert: (SquotFakeToolSet didBrowseMethod: existingMethod).