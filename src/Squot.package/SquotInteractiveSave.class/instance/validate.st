applying
validate
	"Do not test the message yet, it will be provided interactively."
	"See also super>>validate, SquotInteractiveSave>>validateForCherryPick."
	self withUnitOfWorkActive:
		[historian ifNil: [self error: 'Historian to store to not configured'].
		self patch ifNil: [self error: 'No changes to be saved'].
		self author ifNil: [self error: 'Author not configured'].
		self committer ifNil: [self error: 'Committer not configured']].