applying
applyToWorkingCopy
	"Execute the cherry pick."
	self validateRequestor.
	self prepareMerge. "capture lazy snapshot here"
	self resultPromise resolveWith:
		(self applyMerge
			then: [:ignored | self save "captured snapshot used here if reverted"]).
	^ self resultPromise