ui
refresh
	Cursor wait showWhile:
	[self changed: #projectList.
	self changed: #branchList.
	self changed: #commitList.
	self changed: #hasProjectSelection.
	self changed: #hasBranchSelection.
	self changed: #hasCommitSelection.
	self changed: #hasSearchTerm.
	self changed: #contents.
	self changed: #labelString.
	self objectCacheRefreshAsync].