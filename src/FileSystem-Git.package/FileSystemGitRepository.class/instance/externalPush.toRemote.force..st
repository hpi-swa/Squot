git porcelain - external
externalPush: aCollectionOfBranchNamesAndAssociations toRemote: remoteName force: forceBoolean
	aCollectionOfBranchNamesAndAssociations do: [:branch |
		self externalGitDo: ('push {1}{2} {3}:{4}' format: {
			forceBoolean ifTrue: ['-f '] ifFalse: [''].
			remoteName. branch key. branch value})].
	self repository changed: #allReferences.