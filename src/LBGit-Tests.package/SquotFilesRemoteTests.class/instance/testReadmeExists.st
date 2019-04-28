tests
testReadmeExists

	<timeout: 20>
	self assert: (self commit tree entries includesKey: 'README.md').