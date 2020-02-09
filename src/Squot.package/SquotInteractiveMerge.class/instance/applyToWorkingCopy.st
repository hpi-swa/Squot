applying
applyToWorkingCopy
	"Compute merge, ask user which changes should be loaded, then do load them."
	^ self resultPromise resolveWith:
		(self chooseChanges
			then:
				[:merge | super applyToWorkingCopy.
				self resultPromise resolveWith: merge];
			ifRejected: [:reason | self resultPromise rejectWith: reason]).