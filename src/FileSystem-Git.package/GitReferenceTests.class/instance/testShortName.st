testing
testShortName
	self assert: (self refNamed: 'refs/heads/master') shortName = 'master';
		assert: (self refNamed: 'refs/heads/develop') shortName = 'develop'.