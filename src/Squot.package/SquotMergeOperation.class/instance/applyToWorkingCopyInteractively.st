*Squot-Tools applying
applyToWorkingCopyInteractively
	"Compute merge, ask user which changes should be loaded, then do load them."
	self prepare.
	self chooseChanges
		whenResolved:
			[self applyToWorkingCopy.
			self resultPromise resolveWith: merge];
		whenRejected: [:reason | self resultPromise rejectWith: reason].
	^ self resultPromise