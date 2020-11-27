tests
testClassTextDiff
	| text |
	"when"
	text := (self rootNode children detect: [:each | each title asString includesSubstring: existingMethod classSymbol caseSensitive: true]) asStringOrText.
	"then"
	self assert: (text asString includesSubstring: existingMethod classSymbol caseSensitive: true);
		assert: (text asString includesSubstring: existingMethod selector caseSensitive: true);
		assert: (text asString includesSubstring: methodToBeAdded selector caseSensitive: true);
		assert: (text asString includesSubstring: methodToBeRemoved selector caseSensitive: true).