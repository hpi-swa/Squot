tests
testMethodDefinitionTextDiff
	| text |
	"when"
	text := (self rootNode withAllChildren detect: [:each | each title asString includesSubstring: existingMethod selector caseSensitive: true]) asStringOrText.
	"then"
	self assert: (text asString includesSubstring: existingMethod selector caseSensitive: true);
		assert: (text asString includesSubstring: '^ #changed' caseSensitive: true).