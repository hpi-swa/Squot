testing
testShortNameOfRemoteTrackingBranch
	self assert: (self refNamed: 'refs/remotes/origin/master') shortName = 'origin/master';
		assert: (self refNamed: 'refs/remotes/vendor/develop') shortName = 'vendor/develop'.