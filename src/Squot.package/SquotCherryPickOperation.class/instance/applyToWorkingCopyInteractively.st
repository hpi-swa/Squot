*Squot-Tools applying
applyToWorkingCopyInteractively
	"Execute the cherry pick."
	self validateRequestor.
	self prepareMerge. "capture lazy snapshot here"
	self resultPromise resolveWith:
		(self applyMergeInteractively
			then: [:ignored | self saveInteractively "captured snapshot used here if reverted"]).
	^ self resultPromise