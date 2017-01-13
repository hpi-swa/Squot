tests
testGetMasterSnapshot
	| master masterSnapshot |
	master := squitRepository historianNamed: 'master'.
	masterSnapshot := master version snapshot.
	self assert: (masterSnapshot / 'README.md') exists.