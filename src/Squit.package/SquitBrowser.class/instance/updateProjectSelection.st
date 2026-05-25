ui
updateProjectSelection
	repositoryExists := self projectSelection repository exists.
	selectedHistorian := self projectSelection loadedHistorian.
	self changed: #branchSelection.
	commitSelection := nil.
	commitToDiffAgainst := nil.
	cachedCommitList := #().
	repositoryExists ifFalse: [self informThatProjectDoesNotExist].
	self refresh.