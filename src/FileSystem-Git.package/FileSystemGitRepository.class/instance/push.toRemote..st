git porcelain
push: aCollectionOfBranchNamesAndAssociations toRemote: remoteName
	"self push: { 'master' } toRemote: 'origin'.
	 self push: { 'branch' -> 'remoteBranchName' } toRemote: 'origin'"
	^ self pushToRemote: remoteName update: aCollectionOfBranchNamesAndAssociations deleteRemoteBranches: Array empty