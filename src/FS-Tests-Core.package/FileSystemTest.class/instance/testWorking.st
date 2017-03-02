tests
testWorking
	self assert: filesystem workingDirectory filesystem = filesystem.
	self assert: filesystem workingDirectory path = filesystem workingDirectoryPath