git porcelain
externalPush: aCollectionOfBranchNamesAndAssociations toRemote: remoteName
	aCollectionOfBranchNamesAndAssociations do: [:branch |
		self externalGitDo: ('push {1} {2}' format: {remoteName. branch value}) showText: true]