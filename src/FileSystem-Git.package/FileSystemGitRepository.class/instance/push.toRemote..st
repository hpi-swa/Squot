git porcelain
push: aCollectionOfBranchNamesAndAssociations toRemote: remoteName
	"self push: { 'master' } toRemote: 'origin'.
	 self push: { 'branch' -> 'remoteBranchName' } toRemote: 'origin'"
	GitFeatureFlags externalFetchAndPush
		ifTrue: [self externalPush: aCollectionOfBranchNamesAndAssociations toRemote: remoteName]
		ifFalse: [
			[self
				pushToRemote: remoteName
				update: aCollectionOfBranchNamesAndAssociations
				deleteRemoteBranches: Array empty]
					on: ConnectionClosed
					do: [:exception |
						self
							handleConnectionClosed: exception
							whileTryingTo: 'push'
							ifRetry: [self push: aCollectionOfBranchNamesAndAssociations toRemote: remoteName]]]