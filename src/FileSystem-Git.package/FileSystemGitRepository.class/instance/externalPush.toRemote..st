git porcelain - external
externalPush: aCollectionOfBranchNamesAndAssociations toRemote: remoteName
	aCollectionOfBranchNamesAndAssociations do: [:branch |
		self externalGitDo: ('push {1} {2}:{3}' format: {remoteName. branch key. branch value})]