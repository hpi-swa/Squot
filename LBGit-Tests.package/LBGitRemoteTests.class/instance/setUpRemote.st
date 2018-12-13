running
setUpRemote 

	| testsBranch newBranch gitRepository |
	gitRepository := self workingCopy repository gitRepository.
	self workingCopy repository cloneFrom: self remoteURL.
	newBranch := self workingCopy repository historianNamed: self branchName.
	testsBranch := self workingCopy repository historianNamed: 'tests'.
	newBranch version: testsBranch version.
	self workingCopy switchTo: newBranch.
	gitRepository repository setUpstreamRemoteOfBranchNamed: self branchName to: 'origin'.
	gitRepository repository setUpstreamRefOfBranchNamed: self branchName to: (gitRepository expandRemoteRef: self branchName).