git porcelain
pushToRemote: remoteName update: aCollectionOfBranchNamesAndAssociations deleteRemoteBranches: aCollectionOfRemoteBranchNames
	^ self
		pushToRemote: remoteName
		update: aCollectionOfBranchNamesAndAssociations
		deleteRemoteBranches: aCollectionOfRemoteBranchNames
		force: false