helpers
addCommit: message time: dateAndTime withParents: parentCommits
	^ (GitCommit in: repository)
		tree: simpleTree;
		message: message;
		author: (self defaultStamp timeStamp: dateAndTime);
		committer: (self defaultStamp timeStamp: DateAndTime now);
		parents: (parentCommits collect: [:each | each hexHash]);
		store;
		yourself