git porcelain
pushToRemote: remoteName update: aCollectionOfBranchNamesAndAssociations deleteRemoteBranches: aCollectionOfRemoteBranchNames force: forceBoolean
	| remote url protocol updateRefs deleteRefs pushBlock report |
	remote := self unitOfWork remoteNamed: remoteName.
	url := remote url.
	updateRefs := aCollectionOfBranchNamesAndAssociations collect: [:each |
		each value == each
			ifTrue: [(self unitOfWork expandRef: each) -> (self unitOfWork objectReferenced: each)]
			ifFalse: [(self expandRemoteRef: each value) "remote name" -> (self unitOfWork objectReferenced: each key "local name")]].
	(updateRefs detect: [:each | each value isNil] ifNone: []) ifNotNil:
		[:badUpdate | GitRefDoesNotExistYet new
			repository: repository;
			missingRef: badUpdate key;
			signal: 'Nothing to push for ', badUpdate key asString].
	deleteRefs := aCollectionOfRemoteBranchNames collect: [:each | self expandRemoteRef: each].
	protocol := GitAbstractProtocol url: url.
	protocol remote: remote.
	pushBlock := [protocol pushReferences: updateRefs of: repository deleting: deleteRefs].
	report := forceBoolean
				ifTrue: [pushBlock
							on: GitNonFastForwardPushUpdatesDetected
							do: [:notification | notification proceedWithForcedPush]]
				ifFalse: [pushBlock value].
	updateRefs do: [:refAndCommit |
		(report successes includes: refAndCommit key) ifTrue:
			[self unitOfWork
				updateRef: refAndCommit key
				ofRemote: remoteName
				to: refAndCommit value hexHash
				message: 'update by push']].
	deleteRefs do: [:each |
		(report successes includes: each) ifTrue:
			[self unitOfWork deleteRef:
				(self unitOfWork refName: each forRemote: remoteName)]].