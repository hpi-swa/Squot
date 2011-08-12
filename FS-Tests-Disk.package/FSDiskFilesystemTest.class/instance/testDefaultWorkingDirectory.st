tests
testDefaultWorkingDirectory
	| ref |
	ref := filesystem workingDirectory.
	self assert: (SmalltalkImage current imagePath beginsWith: ref asString)