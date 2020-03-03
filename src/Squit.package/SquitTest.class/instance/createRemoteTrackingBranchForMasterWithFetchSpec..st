test data
createRemoteTrackingBranchForMasterWithFetchSpec: aString
	| remoteTrackingHistorian |
	remoteTrackingHistorian := self createRemoteTrackingBranchForMaster.
	master gitRepository remoteConfigFor: 'myremote' option: 'fetch' set: aString.
	^ remoteTrackingHistorian