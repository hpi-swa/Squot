tests
testRemoteTrackingHistorianRemoteRef
	| remoteTrackingHistorian |
	remoteTrackingHistorian := self createRemoteTrackingBranchForMaster.
	self assert: remoteTrackingHistorian remoteRef = 'refs/heads/master'.