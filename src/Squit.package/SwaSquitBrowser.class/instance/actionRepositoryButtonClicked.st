actions
actionRepositoryButtonClicked

	self selectedRepository
		ifNotNil: [self actionCredentialsEdit]
		ifNil: [self actionCloneAndMerge]