applying
applyToWorkingCopy
	"Compute merge, ask user which changes should be loaded, then do load them."
	| promise |
	promise := self resultPromise.
	promise
		resolveWith:
			(self chooseChanges
				then:
					[:aMerge | super applyToWorkingCopy.
					self resultPromise resolveWith: aMerge];
				ifRejected: [:reason | self resultPromise rejectWith: reason]);
		whenResolved: [self finishUnitOfWork];
		whenRejected: [self finishUnitOfWork].
	^ promise