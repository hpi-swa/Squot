helpers
addCommit: message time: dateAndTime committedAt: commitDateAndTime withParents: parentCommits
	^ (GitCommit in: repository)
		tree: simpleTree;
		message: message;
		author: (self defaultStamp timeStamp: dateAndTime);
		committer: (self defaultStamp timeStamp: commitDateAndTime);
		parents: (parentCommits collect: [:each | each hexHash]);
		store;
		yourself