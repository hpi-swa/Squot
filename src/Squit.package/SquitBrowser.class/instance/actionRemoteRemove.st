actions on working copies
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
	self loadBranchList.
	selectedHistorian version ifNil: "selected remote-tracking branch was deleted"
		[selectedHistorian := self projectSelection loadedHistorian.
		self branchSelectionChanged].