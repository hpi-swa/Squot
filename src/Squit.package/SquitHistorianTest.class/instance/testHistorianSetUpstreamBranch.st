tests
testHistorianSetUpstreamBranch
	| remoteTrackingBranch |
	remoteTrackingBranch := self createRemoteTrackingBranchForMaster.
	master setUpstreamToBranchTrackedByRemoteTrackingBranch: remoteTrackingBranch.
	self assert: master upstreamRemoteName = 'myremote';
		assert: master upstreamHistorianName = 'refs/heads/master'.