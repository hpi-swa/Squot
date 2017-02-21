git porcelain
pushToRemote: remoteName update: aCollectionOfBranchNamesAndAssociations deleteRemoteBranches: aCollectionOfRemoteBranchNames
	| url protocol updateRefs deleteRefs |
	url := (repository remoteConfigFor: remoteName option: 'url') asUrl.
	updateRefs := aCollectionOfBranchNamesAndAssociations collect: [:each |
		each value == each
			ifTrue: [(repository expandRef: each) -> (repository objectNamed: (repository resolveRef: each))]
			ifFalse: [(self expandRemoteRef: each value) "remote name" -> (repository objectNamed: (repository resolveRef: each key "local name"))]].
	deleteRefs := aCollectionOfRemoteBranchNames collect: [:each | self expandRemoteRef: each].
	protocol := GitAbstractProtocol url: url.
	protocol pushReferences: updateRefs of: repository deleting: deleteRefs.