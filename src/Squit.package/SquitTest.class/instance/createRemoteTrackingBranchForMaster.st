test data
createRemoteTrackingBranchForMaster
	| remoteTrackingHistorian |
	remoteTrackingHistorian := self trackingBranchForRemote: 'myremote' branch: 'master' hash: self master version hexHash.
	self assert: remoteTrackingHistorian version = self master version.
	^ remoteTrackingHistorian