helpers
addCommit: message time: dateAndTime committedAt: commitDateAndTime withParents: parentCommits
	^ (GitCommit in: repository)
		tree: simpleTree;
		message: message;
		author: (self defaultStamp atTime: dateAndTime);
		committer: (self defaultStamp atTime: commitDateAndTime);
		parents: (parentCommits collect: [:each | each hexHash]);
		store;
		yourself