ui
contents
	self commitSelection ifNil: [^ self defaultCommitText].
	^ self withUnitOfWork: [self commitSelectionWrapped summary]