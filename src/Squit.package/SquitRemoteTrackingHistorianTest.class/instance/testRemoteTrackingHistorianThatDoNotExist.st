tests
testRemoteTrackingHistorianThatDoNotExist
	| remoteTrackingHistorian |
	fsGitRepository addRemote: 'myremote' url: 'http://example.com/git/example.git'.
	remoteTrackingHistorian := squitRepository historianNamed: 'refs/remotes/myremote/mybranch'.
	self assert: remoteTrackingHistorian version isNil;
		assert: remoteTrackingHistorian remoteName = 'myremote';
		assert: remoteTrackingHistorian remoteRef = 'refs/heads/mybranch'.