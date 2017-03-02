tests
testSetRelativeWorkingDirectory
	self 
		should: [filesystem workingDirectoryPath: (FSPath * 'plonk')]
		raise: Error
	