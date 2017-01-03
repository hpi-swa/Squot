git porcelain
pushToRemote: remoteName deleteRemoteBranches: aCollectionOfRemoteBranchNames
	^ self pushToRemote: remoteName update: Array empty  deleteRemoteBranches: aCollectionOfRemoteBranchNames