applying
applyToWorkingCopy
	self withUnitOfWork:
	[merge ifNil: [self error: 'Must prepareMerge first'].
	merge hasConflicts ifTrue: [self error: 'Conflicts must be resolved first'].
	SquotToggles useNewApi
		ifTrue:
			[merge updateResult.
			self workingCopy applyMerge: merge.
			appliedPatch := nil]
		ifFalse: [self workingCopy applyPatch: (appliedPatch := merge resolvedPatch)].
	shouldAddParent ifTrue: [self addParent]].