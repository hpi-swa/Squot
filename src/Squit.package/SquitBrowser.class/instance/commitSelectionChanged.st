ui
commitSelectionChanged
	self changed: #hasCommitSelection.
	self changed: #commitSelection.
	self changed: #contents.
	self objectCacheRefreshAsync.