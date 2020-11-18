tests
testBrowseTraitDefinition
	"when"
	((self rootNode children detect: [:each | each title asString includesSubstring: trait name caseSensitive: true]) children detect: [:each | each title asString includesSubstring: trait name caseSensitive: true]) browseInWorkingCopy.
	"then"
	self assert: SquotBrowseMockTrait wasBrowsed.