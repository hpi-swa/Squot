actions
actionFetch
	| workingCopy |
	workingCopy := self projectSelection.
	[self withUnitOfWork:
		[self fetch: workingCopy]] fork.