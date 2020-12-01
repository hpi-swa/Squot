applying
validate
	"Make sure that all necessary input has been set up."
	"See also SquotSaveOperation>>validateForCherryPick."
	self withUnitOfWorkActive:
		[historian ifNil: [self error: 'Historian to store to not configured'].
		patch ifNil: [self error: 'No changes to be saved'].
		message ifNil: [self error: 'Message not configured'].
		self author ifNil: [self error: 'Author not configured'].
		self committer ifNil: [self error: 'Committer not configured']].