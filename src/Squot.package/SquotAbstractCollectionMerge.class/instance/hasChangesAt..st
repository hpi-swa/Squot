testing
hasChangesAt: key
	^ (containerConflicts at: key ifAbsent:
		[containerModifications at: key ifAbsent:
			[elementMerges at: key ifAbsent: [^ false]]]) hasChanges