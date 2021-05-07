visiting
visitCommit: aCommit
	self exclude: aCommit andIfNotAlreadyExcluded:
		[queue
			add: aCommit tree;
			addAll: aCommit parents].