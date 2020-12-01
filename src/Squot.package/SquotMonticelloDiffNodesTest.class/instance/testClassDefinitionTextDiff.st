tests
testClassDefinitionTextDiff
	| text |
	"when"
	text := ((self rootNode children detect:
		[:each | each title asString includesSubstring: existingMethod classSymbol caseSensitive: true])
		children detect:
			[:each | each title asString includesSubstring: existingMethod classSymbol
						caseSensitive: true]) asStringOrText.
	"then"
	self assert: (text asString includesSubstring: existingMethod classSymbol caseSensitive: true);
		assert: (text asString includesSubstring: 'addedVariable' caseSensitive: true).