applying
applyToWorkingCopy
	"Execute the cherry pick."
	| promise |
	self validateRequestor.
	promise := self resultPromise.
	self withUnitOfWorkActive:
		[self startUnitOfWork.
		self prepareMerge. "capture lazy snapshot here"
		promise resolveWith:
			(self applyMerge
				then: [:ignored | self save "captured snapshot used here if reverted"])].
	promise
		whenResolved: [self finishUnitOfWork];
		whenRejected: [self finishUnitOfWork].
	^ promise