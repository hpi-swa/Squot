actions
actionRemoteRemove
	| selection gitRepository oldBranchSelection |
	gitRepository := self projectSelection repository gitRepository.
	selection := UIManager default
		chooseFrom: gitRepository remoteNames
		values: gitRepository remoteNames
		title: 'Select remote to remove'.
	selection ifNil: [^ self].
	oldBranchSelection := self branchSelection.
	gitRepository removeRemoteNamed: selection.
	self changed: #branchList.
	oldBranchSelection ~= self branchSelection ifTrue: [self refresh].