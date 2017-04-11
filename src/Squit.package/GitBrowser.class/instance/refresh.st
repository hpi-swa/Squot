as yet unclassified
refresh
	self changed: #projectList.
	self changed: #branchList.
	self changed: #commitList.
	self changed: #contents.
	self objectCacheRefreshAsync.