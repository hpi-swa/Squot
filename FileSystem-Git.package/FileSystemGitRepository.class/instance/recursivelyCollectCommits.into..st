private to be removed
recursivelyCollectCommits: aCommit into: aCollection
	self
		recursivelyCollectCommits: aCommit
		into: aCollection
		limit: nil 