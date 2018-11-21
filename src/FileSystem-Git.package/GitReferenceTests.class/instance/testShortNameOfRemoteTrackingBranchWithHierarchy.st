testing
testShortNameOfRemoteTrackingBranchWithHierarchy
	self assert: (self refNamed: 'refs/remotes/origin/feature/shortName') shortName = 'origin/feature/shortName'.