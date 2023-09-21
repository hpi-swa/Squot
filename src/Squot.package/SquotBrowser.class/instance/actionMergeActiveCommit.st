actions
actionMergeActiveCommit
	self activeCommit ifNil: [^ self inform: 'Please select a commit first.'].
	self mergeCommitIntoHead: self activeCommit.