ui
refresh
	Cursor wait showWhile:
	[self changed: #projectList.
	(self projectIndex = 0 and: [self hasProjects]) ifTrue: [self projectIndex: 2].
	self changed: #projectIndex.
	self withUnitOfWork:
		[self hasProjectSelection ifFalse:
			[selectedHistorian := nil.
			commitSelection := nil].
		self loadBranchList.
		self activeBranchChanged.
		self loadCommitList.
		self changed: #hasProjectSelection.
		self changed: #hasBranchSelection.
		self changed: #hasCommitSelection.
		self changed: #hasSearchTerm.
		self changed: #contents.
		self changed: #labelString].
	self objectCacheRefreshAsync].