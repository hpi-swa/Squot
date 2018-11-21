tests
testRemoteTrackingHistorianRemoteRefWithNonDefaultFetchSpec
	| remoteTrackingHistorian |
	remoteTrackingHistorian := self createRemoteTrackingBranchForMasterWithFetchSpec: '+refs/heads/extra/*:refs/remotes/myremote/*'.
	self assert: remoteTrackingHistorian remoteRef = 'refs/heads/extra/master'.