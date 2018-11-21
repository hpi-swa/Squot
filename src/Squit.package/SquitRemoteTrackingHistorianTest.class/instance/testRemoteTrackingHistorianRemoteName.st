tests
testRemoteTrackingHistorianRemoteName
	| remoteTrackingHistorian |
	remoteTrackingHistorian := self createRemoteTrackingBranchForMaster.
	self assert: remoteTrackingHistorian remoteName = 'myremote'.