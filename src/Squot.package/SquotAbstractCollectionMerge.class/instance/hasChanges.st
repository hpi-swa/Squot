testing
hasChanges
	^ containerConflicts notEmpty or:
		[containerModifications notEmpty or:
			[elementMerges notEmpty]]