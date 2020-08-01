applying
applyToWorkingCopy
	"Compute merge, ask user which changes should be loaded, then do load them.
	Answer a promise that will be resolved with the loaded patch, if accepted."
	| promise |
	promise := self resultPromise.
	promise
		resolveWith:
			(self chooseChanges
				then:
					[:aPatch | super applyToWorkingCopy.
					self resultPromise resolveWith: aPatch];
				ifRejected: [:reason | self resultPromise rejectWith: reason]);
		whenResolved: [self finishUnitOfWork];
		whenRejected: [self finishUnitOfWork].
	^ promise