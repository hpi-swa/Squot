applying
validateForCherryPick
	"Do not test the patch yet, it will be determined after the merge."
	"See also SquotSaveOperation>>validate."
	self withUnitOfWorkActive:
		[historian ifNil: [self error: 'Historian to store to not configured'].
		message ifNil: [self error: 'Message not configured'].
		self author ifNil: [self error: 'Author not configured'].
		self committer ifNil: [self error: 'Committer not configured']].