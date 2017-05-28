helpers
addCommit: message withParents: parents
	^ (GitCommit in: repository)
		tree: simpleTree;
		message: message;
		author: self defaultStamp;
		committer: self defaultStamp;
		parents: parents;
		store;
		yourself