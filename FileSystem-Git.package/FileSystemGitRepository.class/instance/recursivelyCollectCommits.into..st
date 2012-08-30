private
recursivelyCollectCommits: aCommit into: aCollection
	self
		recursivelyCollectCommits: aCommit
		into: aCollection
		limit: nil 