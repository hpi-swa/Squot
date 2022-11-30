applying
applyMerge
	^ merge applyToWorkingCopy
		then: [:ignored | loadedPatch := merge appliedPatch]