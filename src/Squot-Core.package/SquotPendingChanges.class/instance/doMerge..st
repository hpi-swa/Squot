configuring
doMerge: aCommit
	self
		parents: {self originalHeadCommit. aCommit};
		alwaysMaterialize.