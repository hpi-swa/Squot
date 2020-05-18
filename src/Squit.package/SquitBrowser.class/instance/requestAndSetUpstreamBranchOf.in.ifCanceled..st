user requests
requestAndSetUpstreamBranchOf: branchName in: gitRepository ifCanceled: cancelBlock
	| remoteName remoteBranchName existingRemoteRef git |
	remoteName := self chooseOneRemoteFrom: gitRepository.
	remoteName ifNil: [^ cancelBlock value].
	git := gitRepository unitOfWork.
	[git setUpstreamRemoteOfBranchNamed: branchName to: remoteName]
		on: GitInvalidReferenceName
		do: [:e | UIManager default inform: e validationReport. ^ cancelBlock value].
	existingRemoteRef := git upstreamRefOfBranchNamed: branchName.
	(remoteBranchName := UIManager default request: 'What is the name of the branch at the remote?' initialAnswer: (existingRemoteRef ifNil: [branchName]))
		ifEmpty: [^ cancelBlock value].
	git setUpstreamRefOfBranchNamed: branchName to: (gitRepository expandRemoteRef: remoteBranchName).