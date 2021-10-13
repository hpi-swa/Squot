accessing
selectedRepository

	self repositoryListIndex = 0 ifTrue: [^ nil].
	^ self repositoryList at: self repositoryListIndex