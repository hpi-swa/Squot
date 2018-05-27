tests
createRemoteTrackingBranchForMasterWithFetchSpec: aString
	| remoteTrackingHistorian |
	remoteTrackingHistorian := self createRemoteTrackingBranchForMaster.
	gitRepository remoteConfigFor: 'myremote' option: 'fetch' set: aString.
	^ remoteTrackingHistorian