self-update
requestNewSelfUpdateBranch
	| newBranch |
	newBranch := UIManager default
		request: 'Branch name for Git Browser update (master, develop, squeak5.1, mapper)'
		initialAnswer: self selfUpdater selfUpdateBranch.
	newBranch isEmptyOrNil ifTrue: [^ self].
	self selfUpdater selfUpdateBranch: newBranch.
	(self confirm: 'Would you like to install updates now?')
		ifTrue: [self selfUpdate].