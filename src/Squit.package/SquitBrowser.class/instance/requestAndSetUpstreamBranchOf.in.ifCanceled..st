user requests
requestAndSetUpstreamBranchOf: branchName in: squitRepository ifCanceled: cancelBlock
	| remoteName remoteBranchName existingRemoteRef git |
	git := squitRepository git.
	remoteName := self chooseOneRemoteFrom: git.
	remoteName ifNil: [^ cancelBlock value].
	[git setUpstreamRemoteOfBranchNamed: branchName to: remoteName]
		on: GitInvalidReferenceName
		do: [:e | self inform: e validationReport. ^ cancelBlock value].
	existingRemoteRef := git upstreamRefOfBranchNamed: branchName.
	(remoteBranchName := SquotGUI request: 'What is the name of the branch at the remote?' initialAnswer: (existingRemoteRef ifNil: [branchName]))
		ifEmpty: [^ cancelBlock value].
	git setUpstreamRefOfBranchNamed: branchName to: (squitRepository fsgitRepository expandRemoteRef: remoteBranchName).
	^ {remoteName. remoteBranchName}