running
setUpRemoteFor: aWorkingCopy

	| testsBranch newBranch squitRepository actualRepository |
	squitRepository := aWorkingCopy repository.
	actualRepository := squitRepository gitRepository repository.
	
	squitRepository cloneFrom: self remoteURL.
	squitRepository addCredentialsFor: self remoteURL user: self credentials first password: self credentials second. 
	newBranch := squitRepository historianNamed: self branchName.
	testsBranch := squitRepository historianNamed: 'tests'.
	newBranch version: testsBranch version.
	aWorkingCopy switchTo: newBranch.
	actualRepository setUpstreamRemoteOfBranchNamed: self branchName to: 'origin'.
	actualRepository setUpstreamRefOfBranchNamed: self branchName to: (squitRepository gitRepository expandRemoteRef: self branchName).