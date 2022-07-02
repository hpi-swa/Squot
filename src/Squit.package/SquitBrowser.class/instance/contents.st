ui
contents
	self commitSelection ifNil: [^ self defaultCommitText].
	^ self withUnitOfWork: [self summaryForCommit: self commitSelection]