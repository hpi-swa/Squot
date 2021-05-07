user requests
requestAndSetUpstreamBranchOf: aHistorian
	| branchName remoteName remoteBranchName existingRemoteRef git |
	git := aHistorian git.
	branchName := aHistorian shortName.
	remoteName := self chooseOneRemoteFrom: git.
	remoteName ifNil: [^ nil].
	[git setUpstreamRemoteOfBranchNamed: branchName to: remoteName]
		on: GitInvalidReferenceName
		do: [:e | self inform: e validationReport. ^ nil].
	existingRemoteRef := git upstreamRefOfBranchNamed: branchName.
	(remoteBranchName := SquotGUI request: 'What is the name of the branch at the remote?' initialAnswer: (existingRemoteRef ifNil: [branchName]))
		ifEmpty: [^ nil].
	git setUpstreamRefOfBranchNamed: branchName to: (aHistorian repository fsgitRepository expandRemoteRef: remoteBranchName).
	^ {remoteName. remoteBranchName}