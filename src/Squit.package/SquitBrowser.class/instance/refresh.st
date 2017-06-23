ui
refresh
	Cursor wait showWhile:
	[self changed: #projectList.
	self loadBranchList.
	self loadCommitList.
	self changed: #hasProjectSelection.
	self changed: #hasBranchSelection.
	self changed: #hasCommitSelection.
	self changed: #hasSearchTerm.
	self changed: #contents.
	self changed: #labelString.
	self objectCacheRefreshAsync].