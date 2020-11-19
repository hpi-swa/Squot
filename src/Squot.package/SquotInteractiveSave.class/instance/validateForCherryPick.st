applying
validateForCherryPick
	"Do not test the patch and the message yet, it will be determined after the merge and in the save dialog, respectively."
	"See also SquotInteractiveSave>>validate."
	self withUnitOfWorkActive:
		[historian ifNil: [self error: 'Historian to store to not configured'].
		self author ifNil: [self error: 'Author not configured'].
		self committer ifNil: [self error: 'Committer not configured']].