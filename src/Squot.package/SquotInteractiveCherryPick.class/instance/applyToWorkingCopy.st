applying
applyToWorkingCopy
	"Execute the cherry pick."
	| promise |
	self validateRequestor.
	self prepareMerge. "capture lazy snapshot here"
	promise := self resultPromise.
	promise resolveWith:
		(self applyMerge
			then: [:ignored | self save "captured snapshot used here if reverted"]).
	promise
		whenResolved: [self finishUnitOfWork];
		whenRejected: [self finishUnitOfWork].
	^ promise