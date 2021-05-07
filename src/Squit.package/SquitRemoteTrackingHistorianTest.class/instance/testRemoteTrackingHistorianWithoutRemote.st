tests
testRemoteTrackingHistorianWithoutRemote
	"A remote-tracking branch without a remote is not actually remote-tracking,
	so the historian should answer the related queries with nil."
	| remoteTrackingHistorian |
	self assert: (squitRepository git remoteConfigFor: 'myremote' option: 'fetch') isNil.
	remoteTrackingHistorian := squitRepository historianNamed: 'refs/remotes/myremote/mybranch'.
	self assert: remoteTrackingHistorian version isNil;
		assert: remoteTrackingHistorian remoteName isNil;
		assert: remoteTrackingHistorian remoteRef isNil.