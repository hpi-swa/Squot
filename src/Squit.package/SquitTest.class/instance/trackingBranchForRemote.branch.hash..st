test data
trackingBranchForRemote: remoteString branch: branchString hash: hexHashString
	fsGitRepository addRemote: remoteString url: 'http://example.com/git/example.git'.
	gitRepository unitOfWork updateRef: branchString ofRemote: remoteString to: hexHashString
		message: 'forge remote-tracking branch'.
	^ squitRepository historianNamed: remoteString, '/', branchString