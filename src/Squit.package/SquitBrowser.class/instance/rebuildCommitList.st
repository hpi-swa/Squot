caching
rebuildCommitList
	self hasBranchSelection ifFalse: [^ cachedCommitList := #()].
	cachedCommitList := SquotHistoryWalker new
		startingFrom: self branchSelection historian version.