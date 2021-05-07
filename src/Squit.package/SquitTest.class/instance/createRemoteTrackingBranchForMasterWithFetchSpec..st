test data
createRemoteTrackingBranchForMasterWithFetchSpec: aString
	| remoteTrackingHistorian |
	remoteTrackingHistorian := self createRemoteTrackingBranchForMaster.
	master git remoteConfigFor: 'myremote' option: 'fetch' set: aString.
	^ remoteTrackingHistorian