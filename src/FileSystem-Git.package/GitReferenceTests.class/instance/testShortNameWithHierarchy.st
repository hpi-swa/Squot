testing
testShortNameWithHierarchy
	self assert: (self refNamed: 'refs/heads/feature/shortName') shortName = 'feature/shortName'.