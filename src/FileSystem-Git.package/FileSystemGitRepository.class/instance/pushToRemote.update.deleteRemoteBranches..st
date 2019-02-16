git porcelain
pushToRemote: remoteName update: aCollectionOfBranchNamesAndAssociations deleteRemoteBranches: aCollectionOfRemoteBranchNames
	| remote url protocol updateRefs deleteRefs report |
	remote := repository remoteNamed: remoteName.
	url := remote url.
	updateRefs := aCollectionOfBranchNamesAndAssociations collect: [:each |
		each value == each
			ifTrue: [(repository expandRef: each) -> (repository objectNamed: (repository resolveRef: each))]
			ifFalse: [(self expandRemoteRef: each value) "remote name" -> (repository objectNamed: (repository resolveRef: each key "local name"))]].
	deleteRefs := aCollectionOfRemoteBranchNames collect: [:each | self expandRemoteRef: each].
	protocol := GitAbstractProtocol url: url.
	protocol remote: remote.
	report := protocol pushReferences: updateRefs of: repository deleting: deleteRefs.
	updateRefs do: [:refAndCommit |
		(report successes includes: refAndCommit key) ifTrue:
			[repository
				updateRef: refAndCommit key
				ofRemote: remoteName
				to: refAndCommit value hexHash
				message: 'update by push']].
	deleteRefs do: [:each |
		(report successes includes: each) ifTrue:
			[repository deleteRef: (repository refName: each forRemote: remoteName)]].