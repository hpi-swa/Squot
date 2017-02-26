tests
testIsDirectory
	self assert: (filesystem isDirectory: FSLocator imageDirectory resolve path)