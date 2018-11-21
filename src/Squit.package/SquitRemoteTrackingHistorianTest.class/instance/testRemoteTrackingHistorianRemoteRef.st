tests
testRemoteTrackingHistorianRemoteRef
	| remoteTrackingHistorian |
	remoteTrackingHistorian := self createRemoteTrackingBranchForMaster.
	self assert: remoteTrackingHistorian remoteRef name = 'refs/heads/master'.