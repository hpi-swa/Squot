applying
applyToWorkingCopy
	self withUnitOfWork:
	[merge ifNil: [self error: 'Must prepareMerge first'].
	merge hasConflicts ifTrue: [self error: 'Conflicts must be resolved first'].
	self workingCopy applyPatch: (appliedPatch := merge resolvedPatch).
	shouldAddParent ifTrue: [self addParent]].