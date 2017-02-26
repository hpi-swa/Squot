tests
testSetWorkingDirectory
	| cwd |
	filesystem workingDirectoryPath: (FSPath / 'plonk').
	cwd := filesystem workingDirectoryPath.
	self assert: cwd isAbsolute.
	self assert: (cwd at: 1) = 'plonk'