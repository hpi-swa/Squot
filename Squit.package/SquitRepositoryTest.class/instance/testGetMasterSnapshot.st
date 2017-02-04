tests
testGetMasterSnapshot
	| master masterSnapshot |
	master := squitRepository historianNamed: 'master'.
	masterSnapshot := master version snapshot.
	self assert: (self shouldnt: [masterSnapshot artifactAt: 'README.md'] raise: KeyNotFound) fileReference exists.