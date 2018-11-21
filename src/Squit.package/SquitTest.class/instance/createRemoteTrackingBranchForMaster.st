tests
createRemoteTrackingBranchForMaster
	| remoteTrackingHistorian |
	master := squitRepository historianNamed: 'master'.
	fsGitRepository addRemote: 'myremote' url: 'http://example.com/git/example.git'.
	gitRepository updateRef: 'master' ofRemote: 'myremote' to: master version hexHash
		message: 'forge remote-tracking branch'.
	remoteTrackingHistorian := squitRepository historianNamed: 'myremote/master'.
	self assert: remoteTrackingHistorian version = master version.
	^ remoteTrackingHistorian