user requests
requestAndSetUpstreamBranchOf: branchName in: gitRepository ifCanceled: cancelBlock
	| remoteName remoteBranchName existingRemoteRef |
	remoteName := self chooseOneRemoteFrom: gitRepository.
	remoteName ifNil: [^ cancelBlock value].
	[gitRepository repository setUpstreamRemoteOfBranchNamed: branchName to: remoteName]
		on: GitInvalidReferenceName
		do: [:e | UIManager default inform: e validationReport. ^ cancelBlock value].
	existingRemoteRef := gitRepository repository upstreamRefOfBranchNamed: branchName.
	(remoteBranchName := UIManager default request: 'What is the name of the branch at the remote?' initialAnswer: (existingRemoteRef ifNil: [branchName]))
		ifEmpty: [^ cancelBlock value].
	gitRepository repository setUpstreamRefOfBranchNamed: branchName to: (gitRepository expandRemoteRef: remoteBranchName).