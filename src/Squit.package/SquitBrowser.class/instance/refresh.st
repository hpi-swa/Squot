ui
refresh
	Cursor wait showWhile:
	[self changed: #projectList.
	self changed: #branchList.
	self changed: #commitList.
	self changed: #contents.
	self changed: #labelString.
	self objectCacheRefreshAsync].