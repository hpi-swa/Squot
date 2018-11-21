test data
trackingBranchForRemote: remoteString branch: branchString hash: hexHashString
	fsGitRepository addRemote: remoteString url: 'http://example.com/git/example.git'.
	gitRepository updateRef: branchString ofRemote: remoteString to: hexHashString
		message: 'forge remote-tracking branch'.
	^ squitRepository historianNamed: remoteString, '/', branchString