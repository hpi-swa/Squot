applying
validate
	self withUnitOfWorkActive:
		[historian ifNil: [self error: 'Historian to store to not configured'].
		self patch ifNil: [self error: 'No changes to be saved'].
		"Also see super validate. Do not check the message here, will be provided interactively."
		self author ifNil: [self error: 'Author not configured'].
		self committer ifNil: [self error: 'Committer not configured']].