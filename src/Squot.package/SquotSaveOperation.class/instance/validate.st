applying
validate
	self withUnitOfWorkActive:
		[historian ifNil: [self error: 'Historian to store to not configured'].
		self patch ifNil: [self error: 'No changes to be saved'].
		"Actually invoking the patch getter will compute a patch automatically and the patch can
		still not have any changes. But that is okay. It just must be a patch at all."
		message ifNil: [self error: 'Message not configured'].
		self author ifNil: [self error: 'Author not configured'].
		self committer ifNil: [self error: 'Committer not configured']].