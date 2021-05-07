tests
testClassBrowse
	| isolatedEnvironment |
	"given"
	SquotBrowseMockClass reset.
	isolatedEnvironment := Environment withName: self printString.
	isolatedEnvironment 
		bind: existingMethod classSymbol to: SquotBrowseMockClass.
	PackageInfo squotSetEnvironmentOf: preparedWorkingCopy artifacts anyOne
		to: isolatedEnvironment.
	"when the class changes grouping node is browsed"
	(self rootNode children detect: [:each | each title asString includesSubstring: existingMethod classSymbol caseSensitive: true]) browseInWorkingCopy.
	"then"
	self assert: SquotBrowseMockClass wasBrowsed.